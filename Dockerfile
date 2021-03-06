# Build Python app.
FROM python:3.6-stretch

WORKDIR /app

# use config.settings.dev so we can serve media files without using AWS s3
ENV PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app \
    DJANGO_SETTINGS_MODULE=config.settings.dev \
    PORT=8000 \
    WEB_CONCURRENCY=3 \
    GUNICORN_CMD_ARGS="--max-requests 1200 --access-logfile -"

EXPOSE 8000

# Install operating system dependencies.
RUN apt-get update -y && \
    apt-get install -y apt-transport-https rsync gettext libgettextpo-dev && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt-get install -y nodejs &&\
    rm -rf /var/lib/apt/lists/*

# Install Gunicorn.
RUN pip install "gunicorn>=19.8,<19.9"

WORKDIR wagtail_react_blog/static_src

# Install front-end dependencies.
COPY ./wagtail_react_blog/static_src/package.json ./wagtail_react_blog/static_src/package-lock.json ./
RUN npm install

# Install Python requirements.
COPY requirements.txt .
RUN pip install -r requirements.txt

# Compile static files
COPY ./wagtail_react_blog/static_src/ ./
RUN npm run build:prod

WORKDIR /app

# Copy application code.
COPY . .

# Install assets
RUN python manage.py collectstatic --noinput --clear

# Run application
CMD ["sh", "config/docker_start.sh"]
