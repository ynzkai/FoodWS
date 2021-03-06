// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require timeago/jquery.timeago
//= require jquery.form
//= require bootstrap-sprockets
//= require simditor
//= require owl.carousel
//= require turbolinks
//= require_tree .

$(document).on("page:change", function() {
	var carsousel = Carousel();
	carsousel.init("#bigBanner", {interval: 5000});
	carsousel.animate_elements({
		".wsfadeInDown": "animated fadeInDown",
		".wsfadeInDownBig": "animated fadeInDownBig",
		".wsbounceInRight": "animated bounceInRight",
	});
});


function init_owlCarousel(sel) {
  $(sel).owlCarousel({
    navigation: true, // Show next and prev buttons
    slideSpeed: 300,
    paginationSpeed: 400,
	goToFirstSpeed: 2000,
    autoPlay: 3000,
    stopOnHover: true,
    navigationText: ['<span class="glyphicon glyphicon-chevron-left"></span>', '<span class="glyphicon glyphicon-chevron-right"></span>'],
	//autoHeight: true,
  
    singleItem: true
    // "singleItem:true" is a shortcut for:
    // items : 1, 
    // itemsDesktop : false,
    // itemsDesktopSmall : false,
    // itemsTablet: false,
    // itemsMobile : false
  });
}

$(document).ready(function() {
	init_owlCarousel(".owl-shop-pic");
});
$(document).on("page:change", function() {
	init_owlCarousel(".owl-shop-pic");
});




// time ago
$(document).ready(function() {
  jQuery("time.timeago").timeago();
});
$(document).on("page:change", function() {
  jQuery("time.timeago").timeago();
});




// hide/show headline when scroll document
;(function($) {
  var initTop = 0;
  $(document).scroll(function() {
	var scrollTop = $(document).scrollTop();
	//if(scrollTop > initTop) {
	if(scrollTop > 99) {
	  $(".headline").hide();
	} else if($(window).width() > 992 ) {
	  $(".headline").show();
	}
	initTop = scrollTop;
  });
})(jQuery);


// shop remark
function init_shop_rank() {
  Rank().init_rank(".shop-star-buttons",{pos: 5}, function() {
	$("#shop_remark_star").val($(this).data("pos"));
  });
  Rank().init_rank(".shop-taste-buttons",{pos: 5}, function() {
	$("#shop_remark_taste").val($(this).data("pos"));
  });
  Rank().init_rank(".shop-serve-buttons",{pos: 5}, function() {
	$("#shop_remark_serve").val($(this).data("pos"));
  });
  Rank().init_rank(".shop-env-buttons",{pos: 5}, function() {
	$("#shop_remark_environment").val($(this).data("pos"));
  });
}
jQuery(document).ready(function() {
  init_shop_rank();
});
jQuery(document).on("page:change", function() {
  init_shop_rank();
});


// food remark
function init_food_rank() {
  Rank().init_rank(".food-star-buttons",{pos: 5}, function() {
	$("#food_remark_star").val($(this).data("pos"));
  });
}
jQuery(document).ready(function() {
  init_food_rank();
});
jQuery(document).on("page:load", function() {
  init_food_rank();
});
jQuery(document).on("page:change", function() {
  init_food_rank();
});
