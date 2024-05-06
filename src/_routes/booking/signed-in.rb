# route: /booking/signed-in/
r.get do
  next r.redirect("/account/profile") unless r.invocably?

  r.invocably do
    html -> { <<~HTML
      <iv-fetch id="signed">
        #{
          html(-> { <<~HTML
            <p data-invocably="replaceChildren" style="text-align: center">
              Hey #{text-> { current_user.name }}, you're back! So glad to see you here again. 😊
            </p>
          HTML
          }) if rodauth.logged_in?
        }
      </iv-fetch>
    HTML
    }
  end
end
