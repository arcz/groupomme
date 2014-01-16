$(document).ready ->
  $('.autocomplete-id').typeahead
    name: 'users'
    remote:
      url: '/user/search?query=%QUERY'
      filter: (response) ->
        response.search
    valueKey: 'name'
    template: (datum) ->
      '<p><img src="'+datum.avatar+'">'+datum.name+'</p>'
        
  
  $('.autocomplete-id').on('typeahead:selected', (object,datum) ->
    currentId = object.currentTarget.id
    targetId = currentId .slice(0, currentId .lastIndexOf('_'))
    $('#'+targetId).val(datum.id)
  )
  