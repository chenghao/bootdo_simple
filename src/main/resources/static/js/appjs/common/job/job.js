var prefix = "/common/job";
$(function () {
    load();
});

function load() {
    var columns= [
        { checkbox: true },
        { field: 'id', title: 'id' },
        { field: 'jobName',  title: '任务名称' },
        { field: 'jobGroup', title: '任务分组' },
        { field: 'beanClass', title: '任务类' },
        { field: 'cronExpression', title: 'cron表达式' },
        { visible: false, field: 'methodName', title: '方法名称' },
        { visible: false, field: 'isConcurrent', title: '任务是否有状态' },
        { visible: false, field: 'description', title: '任务描述' },
        { visible: false, field: 'updateBy', title: '更新者' },
        { visible: false, field: 'createDate', title: '创建时间' },
        { visible: false, field: 'updateDate', title: '更新时间' },
        { visible: false, field: 'createBy', title: '创建者' },
        { visible: false, field: 'springBean', title: 'Spring bean' },
        { field: 'jobStatus', title: '停起操作',
            formatter: function (value, row, index) {
                var e = '<a class="btn btn-success btn-xs" href="#" mce_href="#" title="点击开启" onclick="changeStatus(\''
                + row.id + '\',\'' + row.jobStatus
                + '\')"><i class="fa fa-hourglass-start"></i>开启</a> ';
                var f = '<a class="btn btn-danger btn-xs" href="#" mce_href="#" title="点击关闭" onclick="changeStatus(\''
                + row.id + '\',\'' + row.jobStatus
                + '\')"><i class="fa fa-square-o">关闭</i></a> ';
                if (row.jobStatus == 0) {
                    return e;
                } else {
                    return f;
                }
            }
        },
        { title: '操作', field: 'id', align: 'center',
            formatter: function (value, row, index) {
                var e = '<a class="btn btn-primary btn-sm" href="#" mce_href="#" title="编辑" onclick="edit(\''
                    + row.id + '\',\'' + row.jobStatus
                    + '\')"><i class="fa fa-edit"></i></a> ';
                var d = '<a class="btn btn-warning btn-sm" href="#" title="删除"  mce_href="#" onclick="remove(\''
                    + row.id
                    + '\')"><i class="fa fa-remove"></i></a> ';
                return e + d;
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

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}

function add() {
    var opts = {
        title : '增加',
        maxmin : false
    };
    openwin(prefix + '/add', 800, 520, opts);
}

function edit(id, status) {
    if (status == '1') {
        layer_alert('修改之前请先停止任务');
        return;
    }

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
    }, {'id': id});
}

function changeStatus(id, status) {
    var actCh;
    var cmd;
    if (status == 0) {
        cmd = 'start';
        actCh = "确认要开启任务吗？";
    } else {
        cmd = 'stop';
        actCh = "确认要停止任务吗？";
    }

    ajaxConfirm(actCh, prefix + "/changeJobStatus", function (data) {
        if (data.code == 0) {
            layer_msg(data.msg);
            reLoad();
        } else {
            layer_msg(data.msg);
        }
    }, {'id': id, 'cmd': cmd});
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