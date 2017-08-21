$(document).ready(function($) {
  console.log("hello");
  var listItemsAttributes = $('.hidden-attribute');

  // SEARCH FUNCTIONALITY
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

});

