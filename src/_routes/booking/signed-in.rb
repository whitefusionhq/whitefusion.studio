# route: /booking/signed-in/
r.get do
  next r.redirect("/account/profile") unless r.invocably?

  r.invocably do
    html -> { <<~HTML
      <iv-fetch id="signed">
        <p data-invocably="replaceChildren">
          Hello, signed in?
          #{text -> { rodauth.logged_in? ? "Yup!" : "Nope" }}
        </p>
      </iv-fetch>
    HTML
    }
  end
end
