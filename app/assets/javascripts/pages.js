//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

//var currentPet = {};

function onVoteSuccess(data, textStats, jqXHR) {
  currentPet = data;
  $('img').attr('src', currentPet.photo_medium_url); 
}

$(document).ready(function() {
$('#vote-yes').click(function(event) {
  $.ajax({
    url: '/pets/' + currentPet.id + '/vote_for',
    success: onVoteSuccess
  });
});

$('#vote-no').click(function(event) {
  $.ajax({
    url: '/pets/' + currentPet.id + '/vote_against',
    success: onVoteSuccess
  });
});

$('#vote-report').click(function(event) {
  $.ajax({
    url: '/pets/' + currentPet.id + '/report'
  });
});

$('#skip').click(function(event) {
  $.ajax({
    url: '/pets/show_next',
    success: onVoteSuccess
  });
});

});
