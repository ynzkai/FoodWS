
;var Rank = (function($){
  var options = {
	bgcolor1: "#f8f8f8",
	color1: "#333",
	bgcolor2: "#f9a",
	color2: "#fff"
  };

  return {
	init_rank: function(container, opts) {
	  for(var o in opts) {
		  options[o] = opts[o];
	  }

      var $btns = $(container).children();
      $btns.mouseenter(function(){
		for(var $btn in $btns) {
			alert($btn.)
          $btn.css({"background-color": options["bgcolor2"], "color": options["color2"]});
		  if($btn == $(this)) return;
		}
      });
      $btns.mouseleave(function(){
		for(var $btn in $btns) {
          $btn.css({"background-color": options["bgcolor1"], "color": options["color1"]});
		  if($btn == $(this)) return;
		}
      });
	}
  };
})(jQuery);
