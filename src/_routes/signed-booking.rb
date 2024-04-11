r.get do
  next r.redirect("/account/profile") unless r.invocably?

  r.respond_invocably do
    html -> { <<~HTML
      <iv-fetch id="signed">
        <p data-function="replaceChildren">
          Hello, signed in?
          #{text -> { rodauth.logged_in? ? "Yup!" : "Nope" }}
        </p>
      </iv-fetch>
    HTML
    }
  end
end
