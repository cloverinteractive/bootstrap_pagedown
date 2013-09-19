module BootstrapPagedown
  module Generators
    class SassGenerator < ::Rails::Generators::Base
      VENDOR_PATH = '../../../../vendor/assets/stylesheets/'

      source_root File.expand_path( VENDOR_PATH, __FILE__ )

      desc "Generates the editor stylesheet"

      def copy_sass
        directory File.expand_path( VENDOR_PATH, __FILE__ ), 'app/assets/stylesheets'
      end
    end
  end
end
