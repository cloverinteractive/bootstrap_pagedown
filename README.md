# Bootstrap Pagedown
[![Build Status](https://secure.travis-ci.org/cloverinteractive/bootstrap_pagedown.png?branch=master)](http://travis-ci.org/cloverinteractive/bootstrap_pagedown)

It's a rails version of Bootstrap Pagedown with it's own form builder.

## Setup

Add it to your Gemfile then run `bundle` to install it.

```ruby
gem "bootstrap_pagedown"
```

Then add it to your Asset Pipeline manifest files:

```javascript
// application.js
//= require bootstrap_pagedown
```

```css
/*
* application.css
*= require bootstrap_pagedown
*/
```

## Requirements

This plugin requires bootstrap to work as intended.

## Form builder

To use with rails form simply do the following:

```erb
<%= form_for @page do |f| %>
  <%= f.pagedown_editor :body
<% end %>
```

This will generate the necessary HTML to render the Markdown editor for the `body` property of our `Page` model.

You may also add attributes to the generated text area as needed by simply adding them after the method name:

```erb
<%= f.pagedown_editor :body, 'data-name' => 'editor'
```

The previous example would add `data-name="editor"` to the editor textarea element.

### Custom options supported:

By default bootstrap_pagedown will create the needed HTML elements to render a functional editor with a button bar and a preview div.
However you can change the different element classes, ids and even skip the preview div by passing different options to the `pagedown_editor`
method, here's the hash with different options and it's default values:

```ruby
{
  skip_preview:     false,             # Whether or not we should skip the preview div, skipping this will render an editor without HTML preview
  panel_id:         '',                # HTML id of the editor panel div
  panel_class:      'wmd-panel',       # HTML class of the editor panel div
  button_bar_id:    'wmd-button-bar',  # HTML id of the editor's button bar div
  button_bar_class: '',                # HTML class of the editor's button bar div
  editor_id:        'wmd-input',       # HTML if of the editor textarea
  editor_class:     'wmd-input',       # HTML class of the editor textarea
  preview_id:       'wmd-preview',     # HTML id of the preview div
  preview_class:    '',                # HTML class of the preview div
}
```

This is a the default generated HTML, note that name will change depending on your form builder and method name.

```html
<div class="wmd-panel">
  <div id="wmd-button-bar"></div>
  <textarea class="wmd-input" id="wmd-input" name="test[test]"></textarea>
  <div id="wmd-preview"></div>
</div>
```

If you change the any of the default ids or classes on the HTML elements the `pagedown_editor` will render the correct HTML, but the editor won't render
that is because by default Pagedown looks for those element attribute values, however you can still get the editor to render and behave correctly through the
[Pagedown API](https://code.google.com/p/pagedown/wiki/PageDown). I other words in order to have more than one editor in the same page you'll obviously have to
change the element attributes and the use the Pagedown API to create every aditional editor.

## Running the test suite

Simply clone this project (or pull) and then run `rake`

## Running the dummy app

Go into the `spec/dummy` directory and run `rails s` then in your web browser visit `http://localhost:3000`, you should see a blank page with the editor.

## License

This project uses the MIT license, please read the `MIT-LICENSE` file included with this project
