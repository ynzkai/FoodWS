
;var Carousel = function($) {
	var options = {
		auto_play: true,
		hover_stop: true
	};
	var $carousel;
	var intval;
	var width;
	var height;
	var currentPos = 0;
	var panels = [];
	var panelHints = [];

	/*
	function slide_panel(pos, speed, dir) {
		var direction = (dir=="right") ? 1 : -1;
		if(dir == "right") {
			direction = 1;
			panels[pos].css({"left":width+"px"});
		}
		panels[currentPos].animate({left: direction*width + "px"}, speed, "swing", function() {
			panels[pos].animate({left: "0px"});
			panelHints[currentPos].removeClass("active");
			panelHints[pos].addClass("active");
			currentPos = pos;
		});
	}
	*/

	function pre_panel() {
		var pos = currentPos - 1;
		if(pos < 0) {
			pos = panels.length - 1;
		}
		panels[pos].css({"left":-1*width+"px"});
		panels[currentPos].animate({left: width + "px"}, "slow", "swing", function() {
			panels[pos].animate({left: "0px"});
			panelHints[currentPos].removeClass("active");
			panelHints[pos].addClass("active");
			currentPos = pos;
		});
	}

	function next_panel() {
		var pos = currentPos + 1;
		if(pos >= panels.length) {
			pos = 0;
		}
		panels[pos].css({"left":width+"px"});
		panels[currentPos].animate({left: -1*width + "px"}, "slow", "swing", function() {
			panels[pos].animate({left: "0px"});
			panelHints[currentPos].removeClass("active");
			panelHints[pos].addClass("active");
			currentPos = pos;
		});
	}

	function at_panel(pos) {
		var dir = 1;
		if(pos < currentPos) {
			dir = -1;
		}

		panels[pos].css({"left":dir*width+"px"});
		panels[currentPos].animate({left: -dir*width + "px"}, "slow", "swing", function() {
			panels[pos].animate({left: "0px"});
			panelHints[currentPos].removeClass("active");
			panelHints[pos].addClass("active");
			currentPos = pos;
		});

	}

	//setInterval 回调函数,这里污染了全局命名空间
	window.slide = function() {
		next_panel();
	};

	return {
		init: function(container, opts) {
			for(var o in opts) {
				options[o] = opts[o];
			}

			$carousel = $(container);
			$carousel.css({"position":"relative", "overflow":"hidden"});
			$carousel.children().css({"position":"absolute", "width":"100%", "height":"100%"});
			width = $carousel.width();
			height = $carousel.height();
			$carousel.children().each(function(index) {
				panels.push($(this));
				panelHints.push($('<span id="'+index+'"></span>'));
				$(this).css({"left":width+"px"});
			});
			if(panels.length > 0) {
				panels[0].css({"left": "0px"});
				panelHints[0].addClass("active");
				currentPos = 0;
			}

			$carousel.append($('<span id="pre" class="glyphicon glyphicon-menu-left"></span><span id="next" class="glyphicon glyphicon-menu-right"></span>'));
			var $hints = $('<div id="hints"></div>').css({"width":"100%"});
			for(var i=0; i<panelHints.length; i++) {
				$hints.append(panelHints[i]);
			}
			$carousel.append($hints);


			if(options["hover_stop"]) {
				$carousel.mouseenter(function() {
					clearInterval(intval);
				});
				$carousel.mouseleave(function() {
					intval = setInterval("slide();", 3000);
				});
			}

			$carousel.children("#pre").click(function() {
				pre_panel();
			});
			$carousel.children("#next").click(function() {
				next_panel();
			});
			$carousel.find("#hints span").click(function() {
				at_panel(this.id);
			});


			if(options["auto_play"]) {
				intval = setInterval("slide();", 3000);
			}

		},
		resize: function() {
			width = $carousel.width();
			height = $carousel.height();
			for(var i=0; i<panels.length; i++) {
				panels[i].css({"left":width+"px"});
			}
			panels[currentPos].css({"left":"0px"});
		}
	};

};
