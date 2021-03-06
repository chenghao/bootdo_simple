$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});

function save() {
	ajaxRequest(parent.prefix + "/save", function (data) {
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
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}