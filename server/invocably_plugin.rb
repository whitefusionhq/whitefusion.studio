# NOTE: this plugin does not get reloaded via Zeitwerk
module InvocablyPlugin
  def self.configure(app, opts = {})
    app.opts[:invocably_header] = opts.fetch(:invocably_header, "Invocably-Request")
    app.opts[:invocably_env_header] = "http_#{app.opts[:invocably_header].tr("-", "_")}".upcase
  end

  module RequestMethods
    def invocably?
      has_header?(roda_class.opts[:invocably_env_header])
    end

    def invocably
      response["#{roda_class.opts[:invocably_header]}-Accepted"] = "true"
      yield
    end
  end
end

Roda::RodaPlugins.register_plugin(:invocably, InvocablyPlugin)
