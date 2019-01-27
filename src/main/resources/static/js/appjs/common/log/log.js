var prefix = "/common/log";
$(function () {
    load();

});

$('#exampleTable').on('load-success.bs.table', function (e, data) {
    if (data.total && !data.rows.length) {
        $('#exampleTable').bootstrapTable('selectPage').bootstrapTable('refresh');
    }
});

function load() {
    var columns = [
        { checkbox: true },
        { field: 'id',  title: '序号' },
        { field: 'userId', title: '用户Id' },
        { field: 'username', title: '用户名' },
        { field: 'operation', title: '操作' },
        { field: 'time', title: '用时' },
        { field: 'method', title: '方法' },
        { field: 'params', title: '参数' },
        { field: 'ip', title: 'IP地址' },
        { field: 'gmtCreate', title: '创建时间' },
        { title: '操作', field: 'id', align: 'center',
            formatter: function (value, row, index) {
                var d = '<a class="btn btn-warning btn-sm" href="#" title="删除"  mce_href="#" onclick="remove(\''
                + row.id
                + '\')"><i class="fa fa-remove"></i></a> ';
                return d;
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
        sort: 'gmt_create',
        order: 'desc',
        operation: $("#searchOperation").val(),
        username: $("#searchUsername").val()
    };
    return param;
}

function reLoad(page) {
    refreshTable(getParam(), page);
}

function remove(id) {
    ajaxConfirm('确定要删除选中的记录？', prefix + "/remove", function (data) {
        if (data.code == 0) {
            layer_msg(data.msg);
            reLoad();
        } else {
            layer_msg(data.msg);
        }
    }, {'id': id});
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