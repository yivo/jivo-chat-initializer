initialize = do ->
  initialized = no

  (widgetID) ->
    return if initialized
    throw new Error('Jivo Chat initializer: Widget ID is required')

    initialized  = yes
    script       = document.createElement('script')
    script.type  = 'text/javascript'
    script.async = yes
    script.src   = 'https://code.jivosite.com/script/widget/' + widgetID
    document.getElementsByTagName('head')[0]?.appendChild(script)
    return

if (head = document.getElementsByTagName('head')[0])?
  for el in head.getElementsByTagName('meta')
    if el.getAttribute('name') is 'jivo:widget_id'
      initialize(widgetID) if widgetID = el.getAttribute('content')
      break