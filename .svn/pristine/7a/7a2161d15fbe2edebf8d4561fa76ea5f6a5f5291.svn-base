jQuery(document).ready(function($) {
    $('.moy').click(function(event) {
         var display =$('.goodsDetail').css('display');
        $('.goodsDetail').slideToggle(200);
        if(display == 'block'){
          /*  console.log(display+"....");*/
          $('.moy').children('em').children('i').stop(100).removeClass('se');
        }
        else{
          $('.moy').children('em').children('i').stop(100).addClass('se');
         /*console.log(display);*/
        }/*判断.goodsDetail(商品)显示隐藏选择*/
      });

     $('.hot').click(function(event) {
         var show =$('.h_hot').css('display');
        $('.h_hot').slideToggle(200);
        if(show == 'block'){
           /* console.log(+"....");*/
          $('.hot').children('em').children('i').stop(100).removeClass('se');
        }
        else{
          $('.hot').children('em').children('i').stop(100).addClass('se');
          /*console.log(display);*/
        }/*判断.goodsDetail(商品)显示隐藏选择*/
      });
  
      $('html').click(function(event) {
        $('.h_number').hide(500);
        $('.bgColor').slideUp(100);
      });

      /*选择充值金额*/
      $('.money_in').children('li').each(function(index, el) {
         $(this).click(function(event) {
          $(this).addClass('hotLine').siblings('li').removeClass('hotLine');
         });
      });
});