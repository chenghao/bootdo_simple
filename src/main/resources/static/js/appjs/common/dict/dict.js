
var prefix = "/common/dict";
$(function() {
	
	//	var config = {
	//		'.chosen-select' : {},
	//		'.chosen-select-deselect' : {
	//			allow_single_deselect : true
	//		},
	//		'.chosen-select-no-single' : {
	//			disable_search_threshold : 10
	//		},
	//		'.chosen-select-no-results' : {
	//			no_results_text : '没有数据'
	//		},
	//		'.chosen-select-width' : {
	//			width : "95%"
	//		}
	//	}
	//	for (var selector in config) {
	//		$(selector).chosen(config[selector]);
	//	}
	load();
});

function selectLoad() {
	var html = "";
	ajaxRequest(prefix + "/type", function (data) {
		//加载数据
		for (var i = 0; i < data.length; i++) {
			html += '<option value="' + data[i].type + '">' + data[i].description + '</option>'
		}

		$(".chosen-select").append(html);
		$(".chosen-select").chosen({
			maxHeight : 200
		});

		//点击事件
		$('.chosen-select').on('change', function(e, params) {
			var opt = {
				query : {
					type : params.selected,
				}
			};
			$('#exampleTable').bootstrapTable('refresh', opt);
		});
	});
}

function load() {
	selectLoad();

	var columns = [
		{ checkbox : true },
		{ field : 'id', title : '编号' },
		{ field : 'name', title : '标签名' },
		{ field : 'value', title : '数据值', width : '100px' },
		{ field : 'type', title : '类型' },
		{ field : 'description', title : '描述' },
		{ visible : false, field : 'sort', title : '排序（升序）' },
		{ visible : false, field : 'parentId', title : '父级编号' },
		{ visible : false, field : 'createBy', title : '创建者' },
		{ visible : false, field : 'createDate', title : '创建时间' },
		{ visible : false, field : 'updateBy', title : '更新者' },
		{ visible : false, field : 'updateDate', title : '更新时间' },
		{ visible : false, field : 'remarks', title : '备注信息' },
		{ visible : false, field : 'delFlag', title : '删除标记' },
		{ title : '操作', field : 'id', align : 'center',
			formatter : function(value, row, index) {
				var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
				+ row.id
				+ '\')"><i class="fa fa-edit"></i></a> ';
				var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\''
				+ row.id
				+ '\')"><i class="fa fa-remove"></i></a> ';
				var f = '<a class="btn btn-success btn-sm ' + s_add_h + '" href="#" title="增加"  mce_href="#" onclick="addD(\''
				+ row.type +'\',\''+row.description
				+ '\')"><i class="fa fa-plus"></i></a> ';
				return e + d +f;
			}
		}
	];

	genList(prefix + "/list", columns, function (params) {
		var p = getParam();
		p["limit"] = params.limit;
		p["offset"] = params.offset;
		return p;
	});
}


function getParam() {
	var param = {

	};
	return param;
}


function reLoad(page) {
	refreshTable(getParam(), page);
}

function add() {
	var opts = {
		title : '增加',
		maxmin : false
	};
	openwin(prefix + '/add', 800, 520, opts);
}

function edit(id) {
	var opts = {
		title : '编辑',
		maxmin : false
	};
	openwin(prefix + '/edit/' + id, 800, 520, opts);
}

function remove(id) {
	ajaxConfirm('确定要删除选中的记录？', prefix + "/remove", function (data) {
		if (data.code == 0) {
			layer_msg(data.msg);
			reLoad();
		} else {
			layer_msg(data.msg);
		}
	}, {id: id});
}

function addD(type, description) {
	var opts = {
		title : '增加',
		maxmin : false
	};
	openwin(prefix + '/add/'+type+'/'+description, 800, 520, opts);
}

function batchRemove() {
	var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer_msg("请选择要删除的数据");
		return;
	}

	var ids = new Array();
	// 遍历所有选择的行数据，取每条数据对应的ID
	$.each(rows, function(i, row) {
		ids[i] = row['${pk.attrname}'];
	});

	ajaxConfirm("确认要删除选中的'" + rows.length + "'条数据吗?", prefix + "/batchRemove", function (data) {
		if (data.code == 0) {
			layer_msg(data.msg);
			reLoad();
		} else {
			layer_msg(data.msg);
		}
	}, {"ids" : ids});
}