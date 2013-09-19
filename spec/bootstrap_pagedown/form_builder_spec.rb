require 'spec_helper'

module BootstrapPagedown
  WITH_NO_OPTIONS = '<textarea class="wmd-input" id="wmd-input" name="page[body]">'
  WITH_OPTIONS    = '<textarea class="wmd-input" data-editor="true" id="wmd-input" name="page[body]">'
  TOOLBAR         = '<div id="wmd-button-bar">'
  WRAPPER         = '<div class="wmd-panel">'
  PAGEDOWN_DEFAULTS = {
    skip_preview:   false,
    panel_class:    'wmd-panel',
    button_bar_id:  'wmd-button-bar',
    editor_id:      'wmd-input',
    editor_class:   'wmd-input',
    preview_id:     'wmd-preview',
  }

  describe FormBuilder do
    let( :builder ) { ActionView::Helpers::FormBuilder }
    let( :page )    { Page.new }

    let( :template ) do
      template = ActionView::Base.new
      template.output_buffer = ''
      template
    end

    subject { builder.new :page, page, template, {} }

    describe 'pagedown_editor' do
      context 'with no options' do
        it 'creates a textarea only with id an class wmd-id' do
          editor = subject.pagedown_editor :body
          editor.should include( WITH_NO_OPTIONS )
        end
      end

      context 'with options' do
        it 'should render the options HTML attributes' do
          editor = subject.pagedown_editor :body, data: { editor: true }
          editor.should include( WITH_OPTIONS )
        end
      end

      it 'should render the toolbar' do
        editor = subject.pagedown_editor :body
        editor.should include( TOOLBAR )
      end

      it 'should render the wrapper div' do
        editor = subject.pagedown_editor :body
        editor.should include( WRAPPER )
      end
    end

    describe :pagedown_default_values do
      it 'sets a list of default values if these have not been set' do
        options = subject.pagedown_default_values( {} )
        options.should eql( PAGEDOWN_DEFAULTS )
      end

      it 'will keep any value previously set' do
        options = subject.pagedown_default_values skip_preview: true
        options[:skip_preview].should be_true
      end

      it 'will keep any value even if it is not part of the defaults' do
        options = subject.pagedown_default_values foo: :bar
        options[:foo].should eql( :bar )
      end
    end

    describe :pagedown_custom_attributes do
      it 'will sanitize default options' do
        custom_options = subject.pagedown_custom_attributes PAGEDOWN_DEFAULTS.merge( foo: :bar )
        custom_options.should eql( foo: :bar )
      end
    end
  end
end
