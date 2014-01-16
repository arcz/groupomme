$(document).ready ->
  $('.group-member-list li.list-group-item').hover(
    ->
      $(this).children('.remove-member-btn').css 'display', 'inline' 
    ->
      $(this).children('.remove-member-btn').css 'display', 'none'
    )
  
  $('.autocomplete-id').typeahead
    name: 'users'
    remote:
      url: '/user/search?query=%QUERY'
    valueKey: 'first_name'
    template: (datum) ->
      '<p>'+datum.first_name+' '+datum.last_name+'</p>'
        
  
  $('.autocomplete-id').on('typeahead:selected', (object,datum) ->
    currentId = object.currentTarget.id
    targetId = currentId .slice(0, currentId .lastIndexOf('_'))
    $('#'+targetId).val(datum.id)
  )
  