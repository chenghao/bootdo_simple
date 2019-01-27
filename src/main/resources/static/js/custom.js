var icon6 = 6; //正确
var icon5 = 5; //错误

/**
 处理超出字符
 */
function subString(str, str_len) {
    var len = 10;
    if (str_len) {
        len = str_len;
    }

    if (str.length > len) {
        str = str.substring(0, len) + "...";
    }
    return str;
}

/***
 处理NULL数据
 */
function formatNull(data) {
    if (data == null || data == "null") {
        data = "";
    }
    return data;
}

/**
 统一ajax请求
 */
function ajaxRequest(url, callback, param, method, async, error) {
    layer.load();

    $.ajax({
        url: url,
        data: !param ? {} : param,
        type: !method ? "get" : method,
        dataType: "json",
        async: async == undefined ? true : async,
        success: function (data) {
            layer.closeAll('loading');

            if (callback) {
                callback(data);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            layer.closeAll('loading');

            if (error) {
                error(jqXHR.status, jqXHR.statusText);
            }
        }
    })
}

function ajaxConfirm(msg, url, callback, param, method, callback2) {
    param = !param ? {} : param;
    method = !method ? "post" : method;

    layer.confirm(msg, {
        title: "信息",
        btn: ['确定', '取消'] //按钮
    }, function (index) {
        layer.close(index);
        if (url) {
            ajaxRequest(url, function (data) {
                callback(data);
            }, param, method);
        } else {
            callback();
        }
    }, function (index) {
        layer.close(index);
        if (callback2) {
            callback2();
        }
    });
}

/**
 * 弹出层
 * @param url
 * @param width
 * @param height
 * @param opts
 */
function openwin(url, width, height, opts) {
    var _width = !width ? "800px" : width + "px";
    var _height = !height ? "550px" : height + "px";

    if(!opts){opts = {};};
    if(!opts.hasOwnProperty("type")){opts["type"] = 2;}; //类型， 1是div, 2是iframe
    if(!opts.hasOwnProperty("title")){opts["title"] = "信息";}; //标题
    if(!opts.hasOwnProperty("shadeClose")){opts["shadeClose"] = false;}; //是否点击遮罩层关闭，true是，false否
    if(!opts.hasOwnProperty("maxmin")){opts["maxmin"] = true;}; //是否可以最大最小化，true是，false否

    var o = {
        type: opts["type"],
        title: opts["title"],
        shadeClose: opts["shadeClose"],
        shade: 0.8,
        maxmin: opts["maxmin"],
        area: [_width, _height],
        content: url
    };

    layer.open(o);
}

/**
 * 信息框
 * @param content
 * @param options
 */
function layer_msg(content, opts) {
    if(!opts){opts = {};};
    if(opts.hasOwnProperty("icon")){opts["icon"] = icon6}; //显示图标，默认显示正确图标
    if(opts.hasOwnProperty("time")){opts["time"] = 2000}; //多久后自动关闭，默认2秒后关闭，=0时不自动关闭
    layer.msg(content, opts);
}

/**
 * 弹出框
 * @param content
 * @param opts
 */
function layer_alert(content, opts) {
    if(!opts){opts = {};};
    if(opts.hasOwnProperty("closeBtn")){opts["closeBtn"] = 0}; //是否显示右上角的关闭按钮，默认不显示
    layer.alert(content, opts);
}

/**
 * 刷新表格
 * @param query
 * @param page
 */
function refreshTable(query, page) {
    //如果page=1时候，说明是点击查询按钮，就直接从第一页开始显示
    if(page == 1){
        $("#exampleTable").bootstrapTable('selectPage', 1);
    }else{
        $('#exampleTable').bootstrapTable('refresh', {query: query});
    }
}

/**
 * 生成列表
 * @param url
 * @param columns
 * @param queryParams
 * @param appendRows
 */
function genList(url, columns, queryParams, appendRows) {
    var exampleTable = $('#exampleTable').bootstrapTable({
        method : 'get', // 服务器数据的请求方式 get or post
        url : url, // 服务器数据的加载地址
        //	showRefresh : true,
        //	showToggle : true,
        //	showColumns : true,
        iconSize : 'outline',
        toolbar : '#exampleToolbar',
        striped : true, // 设置为true会有隔行变色效果
        dataType : "json", // 服务器返回的数据类型
        pagination : true, // 设置为true会在底部显示分页条
        // queryParamsType : "limit",
        // //设置为limit则会发送符合RESTFull格式的参数
        singleSelect : false, // 设置为true将禁止多选
        // contentType : "application/x-www-form-urlencoded",
        // //发送到服务器的数据编码类型
        pageSize : 10, // 如果设置了分页，每页数据条数
        pageNumber : 1, // 如果设置了分布，首页页码
        //search : true, // 是否显示搜索框
        showColumns : false, // 是否显示内容下拉框（选择显示的列）
        sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
        queryParams : function(params) { //设置分页参数
            //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
            return queryParams(params);
        },
        // //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
        // queryParamsType = 'limit' ,返回参数必须包含
        // limit, offset, search, sort, order 否则, 需要包含:
        // pageSize, pageNumber, searchText, sortName,
        // sortOrder.
        // 返回false将会终止请求
        columns : columns,
        onLoadSuccess: function(data){
        	var query = window.queryData;
        	if(appendRows){
	        	var columns = this.columns[0];
	        	var rows = {};
	        	for(var i = 0; i < columns.length; i++){
	        		if(!rows[columns[i].field]){
		        		if(i === 1){
		        			rows[columns[i].field] = "合计";
		        		}else{
		        			rows[columns[i].field] = "-";
		        		}
	        		}
	        	}
                var d = concatDict(query, appendRows.data);
	        	ajaxRequest(appendRows.url, function (data) {
                    $.extend(rows, data);
                    exampleTable.bootstrapTable('insertRow', {
                        index: 0,
                        row: rows,
                    });
                }, d);
        	}
        },
    });
}

//合并两个字典
function concatDict(dict1, dict2) {
    var dict = dict1;
    if(dict1 == undefined && !dict1){
        dict = {};
    }
    for(var i in dict2){
        if(dict2[i] != null && dict2[i] !=''){
            dict[i] = dict2[i];
        }
    }
    return dict;
}

/**
 * 根据类型获取字典数据
 * @param type
 */
function getDictOpt(type) {
    var opt = "";
    ajaxRequest("/common/dict/list/" + type, function (data) {
        for(var i = 0; i < data.length; i++){
            var obj = data[i];
            opt += '<option value="' + obj.value + '">' + obj.name + '</option>';
        }
    }, false, "get", false);
    return opt;
}
function getDictVal(type) {
    var list = [];
    ajaxRequest("/common/dict/list/" + type, function (data) {
        for(var i = 0; i < data.length; i++){
            var obj = data[i];
            list.push({"value": obj.value, "name": obj.name});
        }
    }, false, "get", false);
    return list;
}

/**
 * 根据日期获取多少年
  * @param strBirthday
 * @returns {number}
 */
function jsGetAge(strBirthday) {
    var returnAge;
    var strBirthdayArr = strBirthday.split("-");
    var birthYear = strBirthdayArr[0];
    var birthMonth = strBirthdayArr[1];
    var birthDay = strBirthdayArr[2];

    var d = new Date();
    var nowYear = d.getFullYear();
    var nowMonth = d.getMonth() + 1;
    var nowDay = d.getDate();

    if(nowYear == birthYear) {
        returnAge = 0;//同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear ; //年之差
        if(ageDiff > 0) {
            if(nowMonth == birthMonth) {
                var dayDiff = nowDay - birthDay;//日之差
                if(dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            } else {
                var monthDiff = nowMonth - birthMonth;//月之差
                if(monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            }
        } else {
            returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
        }
    }
    return returnAge;//返回周岁年龄
}

/**
 * 上传文件
 * @param id        ID元素
 * @param val       隐藏值ID
 * @param valImg    imgID
 */
function uploadFile(id, val, valImg) {
    //上传文件
    layui.use('upload', function () {
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#' + id, //绑定元素
            url: '/common/sysFile/upload', //上传接口 (保存到本地)
            //url: '/house/fileUpload/uploadImg', //上传接口 (保存到aliyun)
            size: 10000,
            accept: 'images',
            done: function (r) {
                if(r.code == 0){
                    $("#" + val).val(r.fileName);
                    $("#" + valImg).attr("src", r.fileName);
                }
                layer.msg(r.msg);
            },
            error: function (r) {
                layer.msg(r.msg);
            }
        });
    });
}
