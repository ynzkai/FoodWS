// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  //ajax post form
  $("#upload_shop_pics").on("submit", function(e) {
    event.preventDefault();
    $(this).ajaxSubmit({
	  url: $(this).prop('action'),
	  type: 'post',
	  dataType: 'script',//json
	  //data: $(this).serialize(),
	  success: function(data, status, xhr) {
		/*
		$(".images").append('<img src="' + data["pic_path"] + '">');
		$("#shop_image").val('');
		*/
	  },
	  error: function(xhr, status, err) {
		alert(status + ' 上传图片失败\n' + err);
	  }
    });
  });

  $("a.del-pic").on("click", function(e) {
    event.preventDefault();
	var _this = $(this);
	$.ajax({
	  url: $(this).prop('href'),
	  type: 'DELETE',
	  dataType: 'json',
	  success: function(data, status, xhr) {
		_this.parent().parent().remove();
	  },
	  error: function(xhr, status, err) {
		alert('删除图片失败');
	  }
	});
	return false;
  });
});
