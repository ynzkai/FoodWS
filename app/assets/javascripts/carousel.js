
;var Carousel = function() {
	var options = {
		interval: 3000,
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
	var animateElements = {};

	function slide(pos, dir) {
		// dir: 1 right, -1 lieft

		// animate
		for(var k in animateElements) {
			var $element = panels[pos].children(k);
			$element.removeClass(animateElements[k]);
			$element.css("visibility", "hidden");
		}

		panels[pos].css({"left":dir*width+"px"});
		panels[currentPos].animate({left: -dir*width + "px"}, "slow", "swing");
		panels[pos].animate({left: "0px"}, "slow", "swing", function() {
			// animate
			for(var k in animateElements) {
				var $element = panels[pos].children(k);
				$element.css("visibility", "visible");
				$element.queue(function() {
					$(this).addClass(animateElements[k]);
					$(this).dequeue();
				});
			}

			panelHints[currentPos].removeClass("active");
			panelHints[pos].addClass("active");
			currentPos = pos;
		});
	}

	function pre_panel() {
		var pos = currentPos - 1;
		if(pos < 0) {
			pos = panels.length - 1;
		}

		slide(pos, -1);
	}

	function next_panel() {
		var pos = currentPos + 1;
		if(pos >= panels.length) {
			pos = 0;
		}

		slide(pos, 1);
	}

	function at_panel(pos) {
		var dir = 1;
		if(pos < currentPos) {
			dir = -1;
		}

		slide(pos, dir);
	}

	function _resize() {
		width = $carousel.width();
		height = $carousel.height();
		for(var i=0; i<panels.length; i++) {
			panels[i].css({"left":width+"px"});
		}
		panels[currentPos].css({"left":"0px"});
	}

	//setInterval 回调函数,这里污染了全局命名空间
	window.slide = function() {
		next_panel();
	};

	return {
		init: function(container, opts) {

			$carousel = $(container);
			// if can't match container do not anything
			if($carousel.length == 0) {
				return;
			}

			// clear
			panels.splice(0, panels.length);
			panelHints.splice(0, panelHints.length);
			$carousel.children("#hints,#pre,#next").remove();

			// merge options
			for(var o in opts) {
				options[o] = opts[o];
			}


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

			
			// set timer
			if(options["auto_play"]) {
				intval = setInterval("slide();", options["interval"]);
			}

			// events
			if(options["hover_stop"]) {
				$carousel.on('mouseenter', function() {
					clearInterval(intval);
				});
				$carousel.on('mouseleave', function() {
					intval = setInterval("slide();", options["interval"]);
				});
			}

			$carousel.children("#pre").on('click', function() {
				pre_panel();
			});
			$carousel.children("#next").on('click', function() {
				next_panel();
			});
			$carousel.find("#hints span").on('click', function() {
				at_panel(parseInt(this.id));
			});

			$(document).on("page:before-change", function() {
				clearInterval(intval);
			});

			$(window).resize(function() {
				_resize();
			});
		},
		animate_elements: function(eles) {
			animateElements = eles;

			// play first panel's animation
			for(var k in animateElements) {
				var $element = panels[currentPos].children(k);
				$element.addClass(animateElements[k]);
			}
		}
	};

};
