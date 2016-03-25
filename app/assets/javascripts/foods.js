// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  PicSlider().init("#shopfoods");
});
$(document).on("page:change", function() {
});

var PicSlider = function() {
  var options = {
	  it: 500
  };

  var $pics_outer_wrapper = $("<div style='width: 99999px'>");
  var $pics_wrapper1 = $("<div style='position: absolute; display: inline-block;'></div>");
  var $pics_wrapper2 = $("<div style='position: absolute; display: inline-block;'></div>");

  var interval;

  window.move_pics = function () {
	  var left1 = $pics_wrapper1.css("left");
	  var left2 = $pics_wrapper2.css("left");
	  $pics_wrapper1.css("left", parseInt(left1)+1);
	  $pics_wrapper2.css("left", parseInt(left2)+1);
  }

  return {
	init: function(container, opts) {
	  for(var o in opts) {
		  options[o] = opts[o];
	  }

	  var $slider = $(container);
      $slider.css("overflow", "hidden");
	  $slider.append($pics_outer_wrapper);
	  $pics_outer_wrapper.append($pics_wrapper1);
	  $pics_outer_wrapper.append($pics_wrapper2);
	  $slider.children("div.pic").each(function() {
		$pics_wrapper1.append($(this).css("float", "left").detach());
	  });

	  interval = setInterval("move_pics();", options["it"]);

	}
  };
};
