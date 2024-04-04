r.get do
  html -> { <<~HTML
    <p>This is pretty sweet.</p>
  HTML
  }
end