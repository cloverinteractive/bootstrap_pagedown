require 'bootstrap_pagedown/version'
require 'bootstrap_pagedown/engine'
require 'bootstrap_pagedown/form_builder'

module BootstrapPagedown
end

ActionView::Helpers::FormBuilder.send :include, BootstrapPagedown::FormBuilder
