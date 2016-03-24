// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  PicSlider().init("#shopfoods");
});
$(document).on("page:change", function() {
});

var PicSlider = function() {

  return {
	init: function(container, opts) {
	  for(var o in opts) {
		  options[o] = opts[o];
	  }

      $(container).css("overflow", "hidden");
      $(container + ">div").css("width", "9999px");

	}
  };
};
