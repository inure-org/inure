# frozen_string_literal: true

class DeviseMailer < Devise::Mailer
    default from: "#{Inure.config.inure.email_display_name} <#{Inure.config.inure.email_from}>"
    default reply_to: Inure.config.inure.email_reply_to

    layout 'mailer/devise'

    helper EmailsHelper
    helper ApplicationHelper
    helper RegistrationsHelper

    def password_change_by_admin(record, opts = {})
        devise_email(record, :password_change_by_admin, opts)
    end

    def user_admin_approval(record, opts = {})
        devise_email(record, :user_admin_approval, opts)
    end

    def reset_password_instructions(record, token, opts = {})
        headers['X-Mailgun-Suppressions-Bypass'] = 'true'

        super
    end

    def email_changed(record, opts = {})
        if Inure.com?
            devise_email(record, :email_changed_inure_com, opts)
        else
            devise_email(record, :email_changed, opts)
        end
    end

    protected

    def subject_for(key)
        subject = [super]
        subject << Inure.config.inure.email_subject_suffix if Inure.config.inure.email_subject_suffix.present?

        subject.join(' | ')
    end
end
