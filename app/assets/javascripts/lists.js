$(document).on('turbolinks:load', function() {

  // INITIALIZE TOOLTIPS  ---------------------------------------
  options = {
    container: 'body',
    placement: 'top',
    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow" style="color: rgb(237, 241, 242); border-top-color: rgb(237, 241, 242);"></div><div class="tooltip-inner" style="background-color: rgb(237, 241, 242);"></div></div>'
  };

  $(function () {
    $('[data-toggle="tooltip"]').tooltip(options)
  })


  // UPDATE LIST NAME IN UI ------------------------------------
  var listId = $('.js-list-id').text().trim();
  var userId = $('.js-current-user-id').text().trim();
  // console.log(listId);
  // console.log(userId);

  $('#js-list-name').keyup(function(event) {
    var listName = $(this).val();
    // console.log(listName);
    var url = '/lists/' + listId
    var data_send = { list: { id: listId, name: listName, user_id: userId }}

    $.ajax({
      method: 'PATCH',
      dataType: 'json',
      url: url,
      data: data_send
    });
  }); 


  // SEARCH AND FILTER FUNCTIONALITIES ---------------------------

  // gets every element that has the hidden attribute class
  var listItemsAttributes = $('.hidden-search-attribute');

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
      if(text.includes(inputString)) {
        $(this).parent().show();
      };
    });
  });

  // FILTER FUNCTIONALITY
  var activeActionFilters = [];
  var activeCatFilters = [];
  var listItemsActions = $('.hidden-filter-attribute');

  function addFilterToActiveFilters(index, array, value, input) {
    if ((index = array.indexOf(value)) > -1 ) {
      // action val is unchecked - remove filter from list
      array.splice(index, 1);
      setTimeout(function() {
        input.prop('checked', false)
      }, 0);
    } else {
      // indicate that the button was checked - add filter from list
      array.push(value);
      setTimeout(function() {
        input.prop('checked', true)
      }, 0);
    }
  }

  $('.dropdown-menu a').on('click', function(event) {

    listItemsActions.parent().show();
    // listItemsCategories.parent().show();

    var $target = $(event.currentTarget),
        type    = $target.attr('class'),
        val     = $target.attr('data-value'),
        $input  = $target.find('input'),
        index;

    console.log("type of filter: " + type);

    // add / remove filters from activefilters arrays
    if (type.includes('action')) {
      addFilterToActiveFilters(index, activeActionFilters, val, $input);      
    } else if (type.includes('category')) {
      addFilterToActiveFilters(index, activeCatFilters, val, $input);
    }

    // // show / hide items from the UI
    listItemsActions.each(function() {
      // split attributes by action and category
      var attributes = $(this).text().trim().split(",");
      console.log(attributes);

      if(type.includes('action')) {
        // case 1 - no action filter, but category filter
        if (activeActionFilters.length == 0 && activeCatFilters.length > 0) {
          if (!activeCatFilters.includes(attributes[1])) {
            $(this).parent().hide();
          }
        } else if (activeActionFilters.length > 0 && activeCatFilters.length > 0) {
          // case 2 - action filter AND category filter
          // if element is currently hidden (means it was hidden by something else)
          // hide if the attribute is not in either of the filters
          if (!activeActionFilters.includes(attributes[0]) || !activeCatFilters.includes(attributes[1])) {
            $(this).parent().hide();
          }
        } else if (!activeActionFilters.includes(attributes[0])) {
          // case 3 - action filters but no category filter
          $(this).parent().hide();
        }
        
      } else if (type.includes('category')) {
        // if the category filter is empty but not the action one, make sure to show it if the action attribute is in action 
        if (activeCatFilters.length == 0 && activeActionFilters.length > 0) {
          if (!activeActionFilters.includes(attributes[0])) {
            $(this).parent().hide();
          }
        } else if (activeCatFilters.length > 0 && activeActionFilters.length > 0) {
          if(!activeCatFilters.includes(attributes[1]) || !activeActionFilters.includes(attributes[0])) {
            $(this).parent().hide();
          }
        } else if (!activeCatFilters.includes(attributes[1])) {
          $(this).parent().hide();
        }
      }
    });

    // if nothing is checked, show everyting
    if (activeActionFilters.length == 0 && activeCatFilters.length == 0) {
      console.log("Show everything because filters are empty");
      listItemsActions.parent().show();
    };

    $(event.target).blur();

    console.log("FILTERS: " + activeActionFilters);
    console.log("CAT FILTERS: " + activeCatFilters);
    return false
  });

  // SHOW CREATE NEW ITEM IN LIST FUNCTINOALITY -----------------------

  var buttonCreateItem = $('.js-button-create-item');
  var createItemBanner = $('.js-create-item-banner');
  createItemBanner.hide();

  $('.js-toggle-create-item').click(function(event) {
    buttonCreateItem.hide();
    createItemBanner.toggle();
    event.preventDefault();
  });


});
