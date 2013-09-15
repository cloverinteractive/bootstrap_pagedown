# Bootstrap Pagedown

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

### Note

You should only use one editor per page since `Pagedown`'s Javascript relies on the HTML id attribute for most of it's behavior.

## Running the test suite

Simply clone this project (or pull) and then run `rake`

## Running the dummy app

Go into the `spec/dummy` directory and run `rails s` then in your web browser visit `http://localhost:3000`, you should see a blank page with the editor.

## License

This project uses the MIT license, please read the `MIT-LICENSE` file included with this project
