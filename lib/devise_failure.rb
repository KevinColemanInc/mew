class DeviseFailure < Devise::FailureApp
  def http_auth_body
      return i18n_message unless request_format
      method = "to_#{request_format}"
      if method == "to_xml"
        { :error => i18n_message }.to_xml(:root => "errors")
      elsif {}.respond_to?(method)
        { status: 'fail', :errormsg => i18n_message }.send(method)
      else
        i18n_message
      end
    end
end