// resizes element for input
// updates the list with the goal of items

$(document).ready(function($){

  // get list id from the page
  var listId = $('.js-list-id').text().trim();
  console.log(listId);


  // make the call to update list goal
  $('#js-items-goal').keyup(function(event) {
    // event.preventDefault();
    $(this).css('width', (($(this).val().length + 1) * 8) + 'px');

    var goalValue = $(this).val();
    console.log(goalValue);
    var url = '/lists/' + listId;
    console.log(url);
    data_send = { list: { id: listId, goal: goalValue } }

    $.ajax({
      method: 'PATCH',
      dataType: "json",
      url: url,
      data: data_send,
      success: function(data) {
        //console.log(data)
      }
    });
  });
});
