module BootstrapPagedown
  module FormBuilder
    def pagedown_editor( method, options={})
      @template.content_tag( :div, class: 'wmd-panel' ) do
        @template.content_tag( :div, nil, id: 'wmd-button-bar' ) +
        @template.text_area( @object_name, method, objectify_options( options ).merge( id: 'wmd-input', class: 'wmd-input' ) )
      end
    end
  end
end
