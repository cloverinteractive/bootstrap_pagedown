module BootstrapPagedown
  module FormBuilder
    def pagedown_editor(method, options={})
      options         = pagedown_default_values options
      custom_options  = pagedown_custom_attributes options

      @template.content_tag( :div, id: options[:panel_id], class: options[:panel_class] ) do
        @template.content_tag( :div, nil, id: options[:button_bar_id], class: options[:button_bar_class] ) +
        @template.text_area( @object_name, method, objectify_options( custom_options ).merge( id: options[:editor_id], class: options[:editor_class] ) ) +

        unless options[:skip_preview]
          @template.content_tag :div, nil, id: options[:preview_id], class: options[:preview_class]
        end
      end
    end

    def pagedown_default_values( options )
      options[:skip_preview]  ||= false
      options[:panel_class]   ||= 'wmd-panel'
      options[:button_bar_id] ||= 'wmd-button-bar'
      options[:editor_id]     ||= 'wmd-input'
      options[:editor_class]  ||= 'wmd-input'
      options[:preview_id]    ||= 'wmd-preview'

      options
    end

    def pagedown_custom_attributes( options )
      options.except :skip_preview, :panel_class, :panel_id, :button_bar_id, :button_bar_class, :editor_id, :editor_class, :preview_id, :preview_class
    end
  end
end
