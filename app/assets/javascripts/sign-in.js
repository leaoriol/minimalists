$(document).on('turbolinks:load', function() {
  // to grab the value of the action 

  // switch the header font depending on selection

  // render correct partial
  $(".js-login-switch").click(function() {
    var sessionType = $(this).attr('data-action');
    console.log(sessionType);

    $(".js-user-session-form").html('<div class="user-session-box center margin-top-md margin-bottom-large"><i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span></div>');

    $.ajax({
      type: 'GET',
      url: '/users/session_switch',
      data: { session_type: sessionType }
    });
  });
});