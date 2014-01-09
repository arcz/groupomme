$(document).ready ->
  $('.group-member-list li.list-group-item').hover(
    ->
      $(this).children('.remove-member-btn').css 'display', 'inline'
    ->
      $(this).children('.remove-member-btn').css 'display', 'none'
    )