$(document).on('turbolinks:load', function() {
  console.log('Loaded');

  var learnMoreListBanner  = $('.js-learn-more-list');
  var learnMoreGoalBanner  = $('.js-learn-more-goal');
  var learnMoreBrainBanner = $('.js-learn-more-brain');

  learnMoreListBanner.hide();
  learnMoreGoalBanner.hide();
  learnMoreBrainBanner.hide();

  $('.js-toggle-learn-more-list').click(function(event) {
    console.log('list banner');
    learnMoreListBanner.toggle();
    learnMoreGoalBanner.hide();
    learnMoreBrainBanner.hide();
  });

  $('.js-toggle-learn-more-goal').click(function() {
    console.log('goal banner');
    learnMoreListBanner.hide();
    learnMoreGoalBanner.toggle();
    learnMoreBrainBanner.hide();
  });

  $('.js-toggle-learn-more-brain').click(function() {
    console.log('brain banner');
    learnMoreListBanner.hide();
    learnMoreGoalBanner.hide();
    learnMoreBrainBanner.toggle();
  });

});

