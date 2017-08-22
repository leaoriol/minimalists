$(document).ready(function($) {
  console.log("hello");

  // SEARCH FUNCTIONALITY
  var listItemsAttributes = $('.hidden-attribute');

  $('#search-filter').keyup(function() {
    listItemsAttributes.parent().hide();
    // get the string from the select input box
    var inputString = $(this).val();
    //console.log(inputString);
    listItemsAttributes.each(function() {
      // get the string from the listItemAttributes div
      var text = $(this).text().trim();
      console.log(text);
      if(text.startsWith(inputString)) {
        $(this).parent().show();
      };
    });
  });

  // FILTER FUNCTIONALITY
  var actionOptions = [];
  var listItemsActions = $('.hidden-action');

  $('.dropdown-menu a').on('click', function(event) {

    listItemsActions.parent().show();

    var $target = $(event.currentTarget),
        val = $target.attr('data-value'),
        $input = $target.find('input'),
        index;

    if ((index = actionOptions.indexOf(val)) > -1 ) {
      // action val is unchecked - hide corresponding items
      actionOptions.splice(index, 1);
      setTimeout(function() {
        $input.prop('checked', false)
      }, 0);
      listItemsActions.each(function() {
        var text = $(this).text().trim();
        if(!actionOptions.includes(text)) {
          $(this).parent().hide();
        };
      });
    } else {
      // indicate that the button was checked - show corresponding items
      actionOptions.push(val);
      setTimeout(function() {
        $input.prop('checked', true)
      }, 0);
      listItemsActions.each(function() {
        var text = $(this).text().trim();

        // check if text (i.e. keep) is found in actionOptions

        if(!actionOptions.includes(text)) {
          $(this).parent().hide();
        };
      });
    }

    if (actionOptions.length == 0) {
      listItemsActions.parent().show();
    };

    $(event.target).blur();

    console.log(actionOptions);
    return false
  });
});
