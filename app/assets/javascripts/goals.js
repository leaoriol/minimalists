// resizes element for input
// updates the list with the goal of items

$(document).on('turbolinks:load', function() {


  // set ininitial input width
  var goalLength = $('.js-goal-length').text().trim();
  console.log("Goal length: " + goalLength);
  $('#js-overall-goal').css('width', (goalLength * 24) + 'px');


  // GOAL PER LIST
  // get list id from the page
  var listId = $('.js-list-id').text().trim();
  console.log(listId);

  // make the call to update list goal
  $('#js-items-goal').keyup(function(event) {
    console.log('here!');
    // resize of the element
    $(this).css('width', (($(this).val().length + 1) * 8) + 'px');

    // ajax call for the list goal 
    var goalValue = $(this).val();
    console.log(goalValue);
    var url = '/lists/' + listId;
    console.log(url);
    data_send = { list: { id: listId, goal: goalValue } }

    $.ajax({
      method: 'PATCH',
      dataType: "json",
      url: url,
      data: data_send
    });
  });


  // GOAL PER USER 
  // get user id from the page
  var goalId = $('.js-goal-id').text().trim();
  console.log("test");

  // update the user overall goal
  $('#js-overall-goal').keyup(function(event) {
    // resize the element
    console.log("test");
    $(this).css('width', (($(this).val().length) * 24) + 'px');

    // ajax call to make the element
    var overallGoalValue = $(this).val();
    console.log(overallGoalValue);  
    var url = '/goals/' + goalId
    console.log(url);
    data_send = { goal: { id: goalId, overall_goal: overallGoalValue}}

    $.ajax({
      method: 'PATCH',
      dataType: "json",
      url: url,
      data: data_send
    });
  });


  // SHOW CREATE GOAL BANNER
  var noGoalBanner = $('.js-no-goal-banner');
  var createGoalBanner = $('.js-create-goal-banner');
  createGoalBanner.hide();

  $('.toggle-create').click(function() {
    console.log("test button click");
    noGoalBanner.hide();
    createGoalBanner.toggle();
  });
});
