class ProfileController < ApplicationController
    def show
        @user = current_user
    end

    def password
        @user = current_user
    end

    def password_update
        params[:user].reject!{ |k, v| k != "password" && k != "password_confirmation" }

        @user = current_user

        if @user.update_attributes(params[:user])
            flash[:notice] = "senha foi atualizada com sucesso. por favor, inicie sua sessão com ela"

            redirect_to new_user_session_path
        else
            render :action => "password"
        end
    end
end
