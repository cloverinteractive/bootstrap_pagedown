$ ->
  buttons           = [ 'link', 'bold', 'italic', 'image', 'redo', 'quote', 'code', 'ulist', 'olist', 'heading', 'hr', 'undo' ]
  bootstrap_buttons = [ 'bold', 'italic', 'image', 'redo', 'picture', 'share-alt' ]

  if $( "#wmd-input" ).length > 0
    window.converter = Markdown.getSanitizingConverter()
    window.editor    = new Markdown.Editor converter
    editor.run()

    ## Create editor toolbar buttons
    $.each buttons, (iteration, button)->
      selector  = "wmd-#{ button }-button"
      element   = $( "##{ selector }" ).addClass "btn #{ selector }"

      # Replace wmd-class with bootstrap class where needed
      button  = 'picture'    if button is 'image'
      button  = 'share-alt'  if button is 'redo'

      # Add wrapper class for non bootstrap buttons
      icon    = if $.inArray( button, bootstrap_buttons ) is -1
        'icon '
      else
        ''

      icon += "icon-#{ button }"

      # Create editor button
      element.html """<span class="#{ icon }"></span>"""
