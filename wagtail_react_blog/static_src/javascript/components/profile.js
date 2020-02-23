import React from 'react';


class ProfileWidget extends React.Component {
    render() {
        return (

            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="https://scontent-gmp1-1.xx.fbcdn.net/v/t1.0-9/11705273_405039616355679_493786191606366634_n.jpg?_nc_cat=103&_nc_sid=a61e81&_nc_ohc=XEJyFB7JQQgAX_GWFEO&_nc_ht=scontent-gmp1-1.xx&oh=c9a6e8dfb0e79d5f22bafed2c6d72459&oe=5EC4E05E" class="mx-auto d-block" alt="" />
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">
            Modulabs
                    </div>
                    <div class="profile-usertitle-job">
            MODU AIFFEL
                    </div>
                </div>
            </div>

        );
    }
}

export { ProfileWidget };





