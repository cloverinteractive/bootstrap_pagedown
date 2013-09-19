module BootstrapPagedown
  module Generators
    class SassGenerator < ::Rails::Generators::Base
      VENDOR_PATH = File.expand_path( '../../../../vendor/assets/stylesheets/', __FILE__ )

      source_root VENDOR_PATH

      desc "Generates the editor stylesheet"

      def copy_sass
        directory VENDOR_PATH, 'app/assets/stylesheets'
      end
    end
  end
end
