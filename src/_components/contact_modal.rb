class ContactModal < Bridgetown::Component
  def initialize(step:)
    @step = step
  end

  def bot_check(error: false)
    help_text = "What is three plus ten minus two?"
    help_text.prepend("Oops, try again! ") if error

    <<~HTML
      <form-field id="i-like-big-bots-and-i-cannot-lie">
        <sl-input data-invocably="replaceChildren" required #{%(class="bad-bot") if error} type="text" name="bot_check" label="Bot Check" help-text="#{help_text}"></sl-input>
      </form-field>
    HTML
  end
end
