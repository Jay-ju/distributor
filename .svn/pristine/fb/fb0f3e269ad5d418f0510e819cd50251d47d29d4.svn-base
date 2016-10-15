jQuery(document).ready(function($) {
  
    /*积分抽奖*/
    $('.promptly').click(function(event) {
        $('.bgColor,.bgpic,.bgpic span,.bgpic button').stop().show();
    });
     $('.bgColor,.bgpic').click(function(event) {
        $('.bgpic,.bgpic span,.bgpic button').stop().hide();
        $('.bgColor').stop().slideUp(100);
      });

     $('.content li h6').each(function(index, el) {
        $(this).click(function(event) {
          $('.txt').eq(index).slideToggle();
        });
    });

  /*计算详情*/
  $('.open').click(function(event) {
         var display =$('.m-calc-resultList').css('display');
        $('.m-calc-resultList').slideToggle(100);
        if(display == 'none'){
           /* console.log(display+"....");*/
          $('.open').stop(100).addClass('open2');
          $('.open').text('收起');
        }
        else{
          $('.open').stop(100).removeClass('open2');
          $('.open').text('展开');
         /*console.log(display);*/
        }/*判断.goodsDetail(商品)显示隐藏选择*/
      });
});