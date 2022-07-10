require "cable_ready"

class Roda
  module RodaPlugins
    module CableCar
      module TurboTagHelper
        def cable_car
          yield
          append_all "html", CableReady::CableCar.instance.dispatch(element: true)
        end
      end

      def self.load_dependencies(app)
        app.plugin :turbo

        RodaTurbo::StreamTagBuilder.include TurboTagHelper
      end

      module InstanceMethods
        def cable_car
          CableReady::CableCar.instance
        end
      end
    end

    register_plugin :cable_car, CableCar
  end
end
