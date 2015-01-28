$(document).ready(function() {

  $("#go_login").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" })
  $("#go_signup").leanModal({ top : 200, overlay : 0.4, closeButton: ".modal_close" })

  var $add_game_button = $('#add_game_button');

  $add_game_button.on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'POST',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response) {
      $('#group_games_ct').append(response);
    });
  });

  $('#group_games_ct').on('submit', "#create_game", function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'POST',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response) {
      $('#main_container').html(response);
    });
  });

  var $add_clash_button = $('.add_clash_button');

  $add_clash_button.on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'GET',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response) {
      $target.closest('.show_game').append(response);
    })
  })

  var $create_clash_form = $('#create_game_form');

  $create_clash_form.on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'POST',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response) {
      $('#main_container').html(response);
    })
  })
});
