$(document).ready(function(){

	//手机号码验证
	jQuery.validator.addMethod("isPhone",function(value,element){
		var length = value.length;
		var phone=/^1[3|4|5|7|8][0-9]\d{8}$/;
		return this.optional(element)||(length == 11 && phone.test(value));
	},"请填写正确的11位手机号");

	//电话号码验证
	jQuery.validator.addMethod("isTel",function(value,element){
		var tel = /^(0\d{2,3}-)?\d{7,8}$/g;//区号3,4位,号码7,8位
		return this.optional(element) || (tel.test(value));
	},"请填写正确的座机号码");

	//姓名校验
	jQuery.validator.addMethod("isName",function(value,element){
		var name=/^[\u4e00-\u9fa5]{2,6}$/;
		return this.optional(element) || (name.test(value));
	},"姓名只能用汉字,长度2-4位");

	//校验用户名
	jQuery.validator.addMethod("isUserName",function(value,element){
		var userName=/^[a-zA-Z0-9]{2,13}$/;
		return this.optional(element) || (userName).test(value);
	},'请输入数字或者字母,不包含特殊字符');

	////////////////////////////////////////////////////
	//判断小数位数
    jQuery.validator.addMethod("decimals",function(value,element){
    	var returnVal = true;
    	var v = $(element).attr("decimals");

        var arr = value.split(".");  //截取字符串
        if(arr.length == 2){
            if(arr[1].length > v){   //判断小数点后面的字符串长度
                returnVal = false;
                return false;
            }
        }
		return returnVal;
    }, "小数点位数不正确");

	//判断正数
    jQuery.validator.addMethod("num",function(value,element){
    	var rex = /^\d+(\.\d+)?$/;
        return this.optional(element) || (rex.test(value));
    }, "请输入正数（包含小数）");

	//判断两位小数
    jQuery.validator.addMethod("decimal",function(value,element){
    	var rex = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
        return this.optional(element) || (rex.test(value));
    }, "最多两位小数");


});