require 'spec_helper'
require 'generator_spec/test_case'
require 'rails/generators'
require File.expand_path( '../../lib/generators/bootstrap_pagedown/sass_generator.rb', File.dirname( __FILE__ ) )


module BootstrapPagedown
  module Generators
    describe SassGenerator do
      include GeneratorSpec::TestCase
      destination File.expand_path( '../../tmp', __FILE__ )

      before do
        prepare_destination
        run_generator
      end

      it 'should generate bootstrap_pagedown sass' do
        assert_file( 'app/assets/stylesheets/bootstrap_pagedown.css.scss' )
      end
    end
  end
end
