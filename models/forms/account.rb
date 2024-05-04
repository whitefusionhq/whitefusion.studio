module Forms
  class Account < Lifeform::Form
    fields do
      field rodauth.login_param.to_sym,
            type: :email,
            label: rodauth.login_label,
            required: true,
            autocomplete: "username",
            autofocus: true,
            data_invocably: :aria,
            data_parent_selector: "[name=#{rodauth.login_param}]",
            data_acting_selector: "input"
      field :name,
            label: "Your Name",
            autocomplete: "name",
            required: true
      field rodauth.password_param.to_sym,
            type: :password,
            label: rodauth.password_label,
            required: true,
            autocomplete: rodauth.password_field_autocomplete_value,
            data_invocably: :aria,
            data_parent_selector: "[name=#{rodauth.password_param}]",
            data_acting_selector: "input"
      field :submit, type: :submit_button, label: rodauth.login_button
    end
  end
end
