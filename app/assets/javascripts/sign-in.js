$(document).on('turbolinks:load', function() {

  $('h1[ data-action=sign-in]').removeClass('light-text-color').addClass('focus');
  $('h1[ data-action=sign-up]').addClass('light-text-color').removeClass('focus');

  // render correct partial through ajax call
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