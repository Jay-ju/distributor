var i=43200;//43200/3600=12分鐘  這是控制倒計時時間
var time;
function A()
{
    var m1=Math.floor(i/3600);
    var s1=Math.floor(i%3600/60);
    var ms1=Math.floor(i%60);

    //分
    var m="";
    if(m1>=0&&m1<10)
    {
        m="0"+m1;
    }
    else
    {
        m=m1;
    }

    //秒
    var s="";
    if(s1>=0&&s1<10)
    {
        s="0"+s1;
    }
    else
    {
        s=s1;
    }

    //毫秒
    var ms="";
    if(ms1>=0&&ms1<10)
    {
        ms="0"+ms1;
    }
    else
    {
        ms=ms1;
    }
    var div=document.getElementById("c2");
    div.innerHTML=+m+":"+s+"."+ms;
    i--;
    time=window.setTimeout(A,15);

    if(i==-1)
    {
        window.clearTimeout(time);
    }
}