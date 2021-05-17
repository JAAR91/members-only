module ApplicationHelper
    def email_cha(try,resource)
        if try
            return "We're contacting you to notify you that your email is being changed to #{resource.unconfirmed_email}"
        else
            return "We're contacting you to notify you that your email has been changed to #{resource.email}"
        end
    end

    def registration_message(confirmation, message)
        if confirmation
            return "Currently waiting confirmation for: #{message}"
        end
    end
end
