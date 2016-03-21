
var Rank = function(){
  var options = {
	bgcolor1: "#f8f8f8",
	color1: "#333",
	bgcolor2: "#f9a",
	color2: "#fff",
    pos: 0
  };

  var buttons = [];
  var pos = 0;

  function toggle_button(ele, flag) {
	if(flag)
	  $(ele).css({"background-color": options["bgcolor2"], "color": options["color2"]});
	else
	  $(ele).css({"background-color": options["bgcolor1"], "color": options["color1"]});
  }

  function set_pos(p) {
	pos = p;
  }

  function light_buttons(p) {
	for(var i=0; i<buttons.length; i++) {
	  if(i <= p)
	    toggle_button(buttons[i], true);
	  else
	    toggle_button(buttons[i], false);
	}
  }

  return {
	init_rank: function(container, opts) {
	  for(var o in opts) {
		  options[o] = opts[o];
	  }

	  set_pos(options["pos"]-1);

      buttons = $(container).children().toArray();

	  light_buttons(pos);

	  for(var i=0; i<buttons.length; i++) {
        $(buttons[i]).mouseenter(function(){
		  light_buttons($(this).data("pos")-1);
		});
        $(buttons[i]).mouseleave(function(){
		  light_buttons(pos);
		});
        $(buttons[i]).click(function(){
		  set_pos($(this).data("pos")-1);
		});
	  }
	}
  };
};
