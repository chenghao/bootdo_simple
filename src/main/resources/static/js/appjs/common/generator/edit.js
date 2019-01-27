// 以下为官方示例
$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});

function update() {
	ajaxRequest(parent.prefix + "/update", function (data) {
		if (data.code == 0) {
			layer_msg(data.msg);
			parent.reLoad();

			parent.layer.close(parent.layer.getFrameIndex(window.name)); //关闭窗口
		} else {
			layer_alert(data.msg);
		}
	}, $('#signupForm').serialize(), "POST");
}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			author : {
				required : true
			},
			email : {
				required : true,
			},
			package : {
				required : true,
			},
			
		},
		messages : {

			author : {
				required : icon + "请输入作者"
			},
			email : {
				required : icon + "请输入email",
			},
			package : {
				required : icon + "请输入包名",
			},
		}
	})
}
