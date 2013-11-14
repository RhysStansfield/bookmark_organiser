$(function() {
  console.log($("*").length);
});

function addFavoritesHandler() {
  $(".radioactive.colored").click(function(event) {
    var link = $(this).parent();
    var id = $(this).data('id');
    var favourited = !!$(link).data("favourited");
    var newOpacity = favourited ? 0 : 1;
    $(link).data("favourited", !favourited);
    $(this).animate({opacity: newOpacity}, 1000);
    showLinkFavouritedNotice($('h1[data-id='+id+']'),favourited);
  });
};

$(function() {
  addFavoritesHandler();
  prepareRemoteFormsHandler();
});

function showLinkFavouritedNotice(link_element, favourited) {
  var name = link_element.text();
  var message = favourited ?
    name + " was added to favourites" :
    name + " was removed from favourites";
  var $flash = $("<div></div>").addClass('flash notice').html(message);
  $flash.appendTo('#flash_container');
  window.setTimeout(function() {
    $($flash).fadeOut();
  }, 3000);
};

function prepareRemoteFormsHandler() {
  $('.add-link, .sign-up, .sign-in, .tags').click(function(event) {
    $('#ajax-form').show(1000);
    $.get($(this).attr("href"), function(data) {
      if ($('#ajax-form').length == 0) {
        $('#container').prepend("<div id='ajax-form'></div>");
      };
      $('#container #ajax-form').html(data);
      prepareFormHandler();
    });
    event.preventDefault();
  });
};

function prepareFormHandler() {
  var form = $('#container #ajax-form #new-link form');
  form.submit(function(event) {
    var addLink = function(data) {
      $('#container').append(data);
      $('form').each(function(){
        this.reset();
      });
      $('#ajax-form').hide(1000);
    };
    var data = form.serialize();
    $.post(form.attr('action'), data, addLink);
    event.preventDefault();
  });
};