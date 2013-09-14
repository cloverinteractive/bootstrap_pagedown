require 'spec_helper'

module BootstrapPagedown
  WITH_NO_OPTIONS = '<textarea class="wmd-input" id="wmd-input" name="page[body]">'
  WITH_OPTIONS    = '<textarea class="wmd-input" data-editor="true" id="wmd-input" name="page[body]">'
  TOOLBAR         = '<div id="wmd-button-bar">'
  WRAPPER         = '<div class="wmd-panel">'

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
  end
end
