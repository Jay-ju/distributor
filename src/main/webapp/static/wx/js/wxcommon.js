/**
 * 通用工具类，集成微信通用UI，依赖jquery
 * Created by micheal on 16/1/14.
 */
if (typeof jQuery == 'undefined') {
    alert('需要导入jquery');
}
var wxcommon = {
    autoLoad: function(opts){
        if(opts){
            opts = $.extend({
                totalPages: 0,                  // 总页数
                pageNo: 1,                      // 页码
                pageSize: 10,                   // 分页大小
                containerId: "dataList",        // 显示内容的容器id
                url: undefined,                 // 请求url
                doRowDataFun: undefined,        // 处理每行数据的方法
                loadedCallbackFun: undefined    // 加载完数据的回调方法
            }, opts);
            var totalPages = opts.totalPages;//最多页数
            if(totalPages <= 1){
                return;
            }
            var pageNo = opts.pageNo;//页数
            var pageSize = opts.pageSize;
            var isLoading = false;//是否正在加载
            var $dataList = $('#' + opts.containerId);
            var timestamp = opts.timestamp;

            $('body').children().last().after(
                '<div class="weui-infinite-scroll" id="loadingTip">' +
                '<div class="infinite-preloader"></div>' +
                '<span id="loadMsg">玩命加载中...</span>' +
                '</div>'
            );

            var loading = false;
            $(document.body).infinite().on("infinite", function() {
                if(loading) return;

                loading = true;
                $('#loadingTip').show();
                if(pageNo < totalPages){
                    $.ajax({
                        url: opts.url,
                        data:{
                            pageNo: ++pageNo,
                            pageSize: pageSize,
                            timestamp: timestamp
                        },
                        type: 'get',
                        dataType:'json',
                        success:function(result){
                            if(result.state == 200){
                                var rows = result.data;
                                if( rows && rows.result && rows.result.length > 0){
                                    $(rows.result).each(function(i, e){
                                        $dataList.append(opts.doRowDataFun(e));
                                    });

                                    if(opts.loadedCallbackFun){
                                        opts.loadedCallbackFun();
                                    }
                                }else{
                                    loadFinishTip();
                                }
                            }else{
                                errorTip();
                            }

                            loading = false;
                            $('#loadingTip').hide();
                        },
                        error:function(){
                            errorTip();
                            loading = false;
                            $('#loadingTip').hide();
                        }
                    });
                }else{
                    loadFinishTip();
                    loading = false;
                    $('#loadingTip').hide();
                }
            });

            function errorTip(){
                $dataList.find('#loadErrorMsg').remove();
                $dataList.append('<div id="loadErrorMsg" style="text-align: center;color: red;">加载失败！请检查您的网络是否稳定！</div>');
            }

            function loadFinishTip(){
                $dataList.find('#loadErrorMsg').remove();
                $dataList.append('<div id="loadErrorMsg" style="text-align: center;">已经到达列表底部～</div>');
            }
        }
    },
    /**
     * 消息提示框
     * @param msg 内容
     * @param callback 按钮回调函数
     */
    message: function(msg, callback){
        /*var html = '<div>' +
                        '<div id="sysMsgId" class="hint">' +
                            '<div class="hint_tle">系统提示</div>' +
                            '<div class="hint_tex">' + msg + '</div>' +
                            '<div class="hint_btn">' +
                                '<input type="button" value="确定">' +
                            '</div>' +
                        '</div>' +
                        '<div class="bgColor"></div>' +
                    '</div>';

        $('#sysMsgId').remove();
        var $msg = $(html);
        $msg.find("input").click(function(){
            $msg.remove();
            if(callback){
                callback();
            }
        });
        $('body').append($msg);*/
        $.alert(msg, '系统提示', function(){
            if(callback){
                callback();
            }
        });
    },
    /**
     * 确认提示框
     * @param msg 内容
     * @param yesCallback 确认按钮回调函数
     * @param noCallback  取消按钮回调函数
     */
    confirm: function(msg, yesCallback, noCallback){
        /*var html = '<div>' +
                        '<div id="sysConfirmId" class="hint"  style="position: fixed;">' +
                            '<div class="hint_tle">确认信息</div>' +
                                '<div class="hint_tex">'+ msg +'</div>' +
                                '<div class="hint_btn">' +
                                '<button type="button" class="hint_l">确认</button>' +
                                '<button type="button" class="hint_r">取消</button>' +
                            '</div>' +
                        '</div>' +
                        '<div class="bgColor"></div>' +
                    '</div>';
        $('#sysConfirmId').remove();
        var $msg = $(html);
        $msg.find(".hint_l").click(function(){
            $msg.remove();
            if(yesCallback){
                yesCallback();
            }
        });

        $msg.find(".hint_r").click(function(){
            $msg.remove();
            if(noCallback){
                noCallback();
            }
        });

        $('body').append($msg);*/

        $.confirm(msg, "确认信息", function() {
            //点击确认后的回调函数
            if(yesCallback){
                yesCallback();
            }
        }, function() {
            //点击取消后的回调函数
            if(noCallback){
                noCallback();
            }
        });
    },
    /**
     * 系统交互提示框
     * @param msg 提示内容，如加载...
     */
    showProgress: function(msg){
        /*$('#progressDiv').remove();
        $('body').append('<div id="progressDiv" class="loading_con">' +
            '<div class="load-container load4">' +
            '<div class="loader"></div>' +
            '<p>'+msg+'</p>' +
            '</div>' +
            '</div>');*/
        $.showLoading(msg);
    },
    /**
     * 关闭系统交互提示框
     */
    colseProgress: function(){
        /*$("#progressDiv").fadeOut(300, function(){
            $(this).remove();
        });*/
        $.hideLoading();
    },
    isNotEmpty: function(value){
        return value && value != '' && $.trim(value).length > 0;
    },
    isEmpty: function(value){
        return !this.isNotEmpty(value);
    },
    goback: function(ctx){
        if(history.length <= 1){
            location.href = ctx + "/wx/index";
        }else{
            history.go(-1);
        }
    },
    isNumber: function(value){
        if (value == "")
            return true;
        return (/^\d+$/.test(value));
    },
    getNumberValue: function(value, defaultValue) {
        if(this.isNumber(value)) {
            if(typeof value == 'string')
                return parseInt(value);
            return value;
        }else {
            return defaultValue ? defaultValue : 0;
        }
    },
    /**
     * 获取当前网址的跟路径
     * @returns {string}
     */
    getRootPath: function(){
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPath=curWwwPath.substring(0,pos);
        var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
        projectName = projectName == '/stlife' ? '/stlife/' : '/';
        return localhostPath + projectName;
    },
    includeJS: function(js, isFullUrl){
        $('body').append('<script type="text/javascript" src="'+
            (isFullUrl ? '' : this.getRootPath()) + js +'"></script>');
    },
    includeCSS: function(css, isFullUrl){
        $('body').append('<link rel="stylesheet" type="text/css" href="'+
            (isFullUrl ? '' : this.getRootPath()) + css +'"/>');
    },
    appendQuestionMarkOrAnd : function(url, paramStr){
        if(url.indexOf("?") < 0){
            url += "?" + paramStr;
        }else{
            var arr = paramStr.split('&');
            for(var i = 0; i < arr.length; i++){
                var paramName = arr[i].split('=')[0];
                if(url.indexOf(paramName)<0){
                    url += "&" + arr[i];
                }
            }
        }
        return url;
    },
    login: function(){
        location.replace( this.appendQuestionMarkOrAnd(location.href, '&needAuth=true'));
    }
};

wxcommon.includeCSS('https://res.wx.qq.com/open/libs/weui/0.3.0/weui.min.css', true);
wxcommon.includeCSS('static/wx/js/weixin-jquery/css/jquery-weui.css');
wxcommon.includeJS('static/wx/js/weixin-jquery/js/jquery-weui.js');

// 添加顶部下拉刷新
//$('body').children().first().before(
//    '<div class="weui-pull-to-refresh-layer">' +
//        '<div class="pull-to-refresh-arrow"></div>' +
//        '<div class="pull-to-refresh-preloader"></div>' +
//        '<div class="down">下拉刷新</div>' +
//        '<div class="up">释放刷新</div>' +
//        '<div class="refresh">正在刷新</div>' +
//    '</div>');

$(document.body).pullToRefresh().on("pull-to-refresh", function() {
    if($('div.weui_toast_visible').length < 1){ // 当没有显示加载框时才可以刷新
        $(".weui-pull-to-refresh-layer").hide();
        location.reload(true);
    }else{
        $(document.body).pullToRefreshDone();
        $('.weui-pull-to-refresh-layer').removeClass('weui-pull-to-refresh-layer-border-bottom');
    }
});
