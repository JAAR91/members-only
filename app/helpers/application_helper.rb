module ApplicationHelper
  def email_cha(try, resource)
    if try
      "We're contacting you to notify you that your email is being changed to #{resource.unconfirmed_email}"
    else
      "We're contacting you to notify you that your email has been changed to #{resource.email}"
    end
  end

  def registration_message(confirmation, message)
    return "Currently waiting confirmation for: #{message}" if confirmation
  end
end
