module LoginMacros
    def login_as role
        @user = User.create(:email => "user#{User.count}@mail.com",
                            :name => "grivo",
                            :password => "123456",
                            :password_confirmation = "123456")

        if role == :admin
            @user.admin = true
            @user.save!
        end

        visit new_user_session_path

        fill_in "email", :with => @user.email
        fill_in "senha", :with => "123456"

        click_button "logar"
    end

    def login_with(user)
        visit new_user_session_path

        fill_in "email", :with => user.email
        fill_in "senha", :with => "123456"

        click_button "logar"
    end

    def logout
        click_link "deslogar" rescue nil
    end
end
