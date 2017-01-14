###!
# jivo-chat-initializer 1.0.1 | https://github.com/yivo/jivo-chat-initializer | MIT License
###
  
initialize = do ->
  initialized = no

  (widgetID) ->
    unless initialized
      unless widgetID
        throw new TypeError('[Jivo Chat Initializer] Widget ID is required')

      script       = document.createElement('script')
      script.type  = 'text/javascript'
      script.defer = true
      script.async = true
      script.src   = 'https://code.jivosite.com/script/widget/' + widgetID
      document.getElementsByTagName('head')[0]?.appendChild(script)
      initialized  = true
    return

if (head = document.getElementsByTagName('head')[0])?
  for el in head.getElementsByTagName('meta')
    if el.getAttribute('name') is 'jivo:widget_id'
      initialize(widgetID) if widgetID = el.getAttribute('content')
      break
