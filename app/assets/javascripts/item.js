$(document).on('turbolinks:load', function() {

  $('.js-edit-item').click(function() {
    var itemId = $(this).attr('data-target-id');
    var url = '/items/' + itemId + '/edit'

    $.ajax({
      method: 'GET',
      dataType: 'script',
      url: url,
    });
  });
});

