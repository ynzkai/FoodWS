// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  /*
  $("#upload_shop_pics").on("ajax:success", function(e, data, status, xhr) {
	  alert(status);
    });
  .on("ajax:error", function(e, data, status, xhr) {
	  alert("error");
	});
  */
  $('#upload_shop_pics').on('ajax:complete', function(event, xhr, status, error) {
    alert(xhr.responseText)
  });
});
