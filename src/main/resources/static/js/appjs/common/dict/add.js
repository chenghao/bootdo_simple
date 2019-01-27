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
			layer_msg("操作成功");
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
			},
			value : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入标签名"
			},
			value : {
				required : icon + "请输入数据值"
			},
		}
	})
}