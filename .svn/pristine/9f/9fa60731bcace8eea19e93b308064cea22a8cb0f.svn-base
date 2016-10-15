lxfEndtime();
 //倒计时
    function lxfEndtime() {
            $(".lxftime").each(function () {
                var lxfday = $(this).attr("lxfday"); //用来判断是否显示天数的变量
                var endtime = new Date($(this).attr("endtime")).getTime(); //取结束日期(毫秒值)
                var nowtime = new Date($(this).attr("nowtime")).getTime();        //今天的日期(毫秒值)服务器时间
                var youtime = endtime - nowtime; //还有多久(毫秒值)
                var seconds = youtime / 1000;
                var minutes = Math.floor(seconds / 60);
                var hours = Math.floor(minutes / 60);
                var days = Math.floor(hours / 24);
                var CDay = days;
                var CHour = hours % 24;
                var CMinute = minutes % 60;
                var CSecond = Math.floor(seconds % 60); //"%"是取余运算，可以理解为60进一后取余数，然后只要余数。
                var CMSecond = Math.floor(seconds*100%100);// 计算100毫秒

                if (endtime <= nowtime) {
                    $(this).html("00:00:000"); //如果结束日期小于当前日期就提示过期啦
                } else {
                    if ($(this).attr("lxfday") == "no") {
                        $(this).html(CHour + "小时" + CMinute + "分" + CSecond + "秒"+(CMSecond<10?"0"+CMSecond:CMSecond)+"毫秒"); //输出没有天数的数据
                    } else {
                        if (days == 0&&CMSecond==0) {
                            if ($(this).attr('col') == 0) {
                                $(this).attr('col', '1');
                            } else {
                                $(this).attr('col', '0');
                            }
                        }
                        $(this).html((CMinute<10?"0"+CMinute:CMinute) + ":" + (CSecond<10?"0"+CSecond:CSecond) + ":"+(CMSecond<10?"0"+CMSecond:CMSecond)); //输出有天数的数据
                    }
                    //当前时间变化
                    $(this).attr("nowtime", zhtime(nowtime+100));
                }
            });
            setTimeout("lxfEndtime()", 100);
    }
    //js时间戳格式转05/20/2014 20:54:40
    function zhtime(needtime) {
        var oks = new Date(needtime);
        var year = oks.getFullYear();
        var month = oks.getMonth() + 1;
        var date = oks.getDate();
        var hour = oks.getHours();
        var minute = oks.getMinutes();
        var second = oks.getSeconds();
        var msecond=oks.getMilliseconds()
        return month + '/' + date + '/' + year + ' ' + hour + ':' + minute + ':' + second+'.'+msecond;
    }