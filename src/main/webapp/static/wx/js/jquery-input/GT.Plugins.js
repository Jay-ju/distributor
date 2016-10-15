/*
jQuery插件 
开始日期:2015.05.30 
作者:GT
后语:这些插件有连贯性。有些不可分离。
*/

/*
手机触摸事件(Phone Touch Event)
版本1.0 时间:2015.06.16
单独性:可分离
*/
$.fn.GT_PTE = function(op) {
	var d = {
		events: 'click', //事件 slideLeft=左滑动 slideRight=右滑动 slideUp=上滑动 slideDown=下滑动 click=点击 down=按下 up=放开
		functions: null //函数
	},
		o = $.extend({}, d, op);
	return this.each(function() {
		if ($.isEmptyObject($(this)) || $.type(o.events) != 'string' || $.type(o.functions) != 'function' || !navigator.userAgent.match(/mobile/i)) return $(this);
		var co = $(this), //当前对象
			ev = o.events, //触发事件
			f = o.functions, //自定义函数
			sp, //开始坐标
			mp; //移动坐标
		//绑定事件
		co.get(0).addEventListener('touchstart', function(e) {
			sp = mp = e.touches[0];
			if (ev == 'down') return f(sp);
		}, false);
		co.get(0).addEventListener('touchmove', function(e) {
			mp = e.touches[0];
			if (mp.clientX - sp.clientX > 50 && ev == 'slideRight') return f(mp); //右滑动
			if (sp.clientX - mp.clientX > 50 && ev == 'slideLeft') return f(mp); //左滑动
			if (mp.clientY - sp.clientY > 50 && ev == 'slideUp') return f(mp); //上滑动
			if (sp.clientY - mp.clientY > 50 && ev == 'slideDown') return f(mp); //下滑动
		}, false);
		co.get(0).addEventListener('touchend', function(e) {
			if ((Math.abs(sp.clientX - mp.clientX) < 10 && Math.abs(sp.clientY - mp.clientY) < 10) && ev == 'click') return f(sp); //点击
			if (ev == 'up') return f(sp);
		}, false);
	});
};

/*
万能图片切换(Universal Picture Switching) 
版本:1.0 时间:2015.06.16
单独性:不可与GT_PTE分离
*/
$.fn.GT_UPS = function(op) {
	var d = {
		img: null, //图片对象(建议传入)
		switchSpeed: 0.5, //图片切换速度(秒)
		switchInterval: 3, //图片切换间隔(秒)
		sBarAuto: false, //启动自动状态栏(启动后状态栏参数和状态栏样式参数无效)
		statusBar: null, //状态栏
		statusBarCss: null, //状态栏样式
		btnAuto: false, //启动自动按钮(电脑版下有效, 启动后上一张按钮参数和下一张按钮参数无效)
		lastBtn: null, //上一张按钮
		nextBtn: null, //下一张按钮
		defaultDir: true //默认滚动方向(true 左右 false 上下)
	},
		o = $.extend({}, d, op);
	return this.each(function() {
		if ($.isEmptyObject($(this))) return $(this); //判断对象是否为空
		var to = function(e) { //检测对象
			return !e || $.type(e) != 'object' || $.isEmptyObject(e);
		},
			co = $(this), //当前对象
			img = to(o.img) ? co.children() : o.img, //图片对象
			ipc = !navigator.userAgent.match(/mobile/i), //是否为电脑设备
			ss = $.isNumeric(o.switchSpeed) ? o.switchSpeed * 1000 : 500, //图片切换速度(毫秒)
			si = $.isNumeric(o.switchInterval) ? o.switchInterval * 1000 : 3000, //图片切换间隔(毫秒)
			sba = $.type(o.sBarAuto) != 'boolean' ? false : o.sBarAuto, // 启动自动状态栏
			sb = sba ? new function() {
				co.append('<div class="gt_statusBar"></div>');
				return co.find('.gt_statusBar');
			} : to(o.statusBar) ? null : o.statusBar, //状态栏
			sbc = sba ? 'gt_statusBarSelect' : ($.type(o.statusBarCss) == 'string' ? o.statusBarCss : 'gt_statusBarSelect'), //状态栏样式
			ba = $.type(o.btnAuto) != 'boolean' ? false : o.btnAuto, //启动自动按钮
			lb = to(o.lastBtn) ? null : o.lastBtn, //上一张按钮
			nb = to(o.nextBtn) ? null : o.nextBtn, //下一张按钮
			dd = $.type(o.defaultDir) != 'boolean' ? true : o.defaultDir, //默认滚动方向
			time, //计时器
			ssa = false, //开始动画
			gpc = function() {
				var idx;
				img.each(function(i) {
					if (img.eq(i).attr('gt_ups') == 'show') idx = i;
				});
				return idx;
			},
			sa = function(e, ov, nov, q) { //切换动画
				clearInterval(time);
				var oi, noi; //当前图片下标
				oi = q ? oi = ov : gpc();
				noi = q ? nov : oi + 1 > img.length - 1 ? 0 : oi + 1;
				if (sb) ssb(noi);
				ssa = true;
				//自动切换
				img.eq(oi).css({
					'left': 0,
					'top': 0
				});
				img.eq(noi).css({
					'left': (dd ? !e ? img.width() : img.width() * -1 : 0),
					'top': (dd ? 0 : !e ? img.height() : img.height() * -1)
				}).show();
				img.eq(oi).stop().animate({
					'left': (dd ? parseInt(img.eq(oi).css('left')) + (!e ? img.width() * -1 : img.width()) : 0),
					'top': (dd ? 0 : parseInt(img.eq(oi).css('top')) + (!e ? img.height() * -1 : img.height()))
				}, ss, function() {
					img.eq(oi).hide().removeAttr('gt_ups');
				});
				img.eq(noi).stop().animate({
					'left': (dd ? parseInt(img.eq(noi).css('left')) + (!e ? img.width() * -1 : img.width()) : 0),
					'top': (dd ? 0 : parseInt(img.eq(noi).css('top')) + (!e ? img.height() * -1 : img.height()))
				}, ss, function() {
					img.eq(noi).attr('gt_ups', 'show');
					time = setInterval(sa, si);
					ssa = false;
				});
			},
			ssb = function(e) { //状态栏显示
				if (!$.isNumeric(e)) return;
				var oi = sba ? Math.abs(e - (img.length - 1)) : e;
				sb.children().eq(oi).addClass(sbc).siblings().removeClass(sbc);
			};
		if (img.length <= 1) return;
		co.height(img.height()).css({
			'position': 'relative',
			'overflow': 'hidden'
		});
		img.each(function(i) {
			$(this).css({
				'position': 'absolute',
				'left': 0,
				'top': 0
			});
			i > 0 ? $(this).hide() : $(this).attr('gt_ups', 'show');
		});
		if (sba) { //自动生成状态栏
			sb.width(co.width()).height(20).css({
				'background': '#000',
				'opacity': 0.5,
				'bottom': 0,
				'position': 'absolute',
				'z-index': 999999
			});
			$('head').append('<style type="text/css">.gt_statusBar p{ width: 10px; height: 10px; background: #FFF; margin: 5px 2px; float: right; padding: 0; border-radius: 50%;}\n.gt_statusBarSelect{ background: #F60 !important;}</style>');
			img.each(function(i) {
				sb.append('<p ' + (i == img.length - 1 ? 'class="' + sbc + '"' : '') + '></p>');
			});
		}
		time = setInterval(sa, si);
		if (ipc) { //电脑设备
			if (sb) sb.children().hover(function(e) { //状态栏悬浮
				if (ssa) return;
				var ov = gpc(),
					nov = (sba ? Math.abs($(this).index() - (img.length - 1)) : $(this).index());
				if (ov == nov) return;
				sa(false, ov, nov, true);
			});
			if (ba) { //生成自动按钮
				$('head').append('<style type="text/css">.gt_btn{ width: 30px; height: ' + (co.height() - (sb ? sb.height() : 0)) + 'px; position: absolute; z-index: 99999; background: #000; opacity: 0;}\n.gt_btn:hover{ opacity: 0.5;}\n.gt_btn .gt_switchBtn{ -webkit-user-select:none; -moz-user-select:none; -ms-user-select:none; user-select:none; color: #000; font-family: -webkit-body; cursor: pointer; line-height: 20px; text-align: center; width: 20px; height: 20px; background: #FFF; border-radius: 50%; margin: ' + ((co.height() - (sb ? sb.height() : 0)) / 2) + 'px 5px;}\n.gt_btn .gt_switchBtn:hover{ background: #666;}</style>');
				co.append('<div class="gt_btn" style="left: 0;"><div class="gt_switchBtn gt_btnLeft"><</div></div><div class="gt_btn" style="right: 0;"><div class="gt_switchBtn gt_btnRight">></div></div>');
				lb = co.find('.gt_btn .gt_btnLeft');
				nb = co.find('.gt_btn .gt_btnRight');
			}
			if (lb) lb.click(function(e) { //上一张
				if (!ssa) sa(true, gpc(), (gpc() - 1 < 0 ? img.length - 1 : gpc() - 1), true);
			});
			if (nb) nb.click(function(e) { //下一张
				if (!ssa) sa(false, gpc(), (gpc() + 1 > img.length - 1 ? 0 : gpc() + 1), true);
			});
			return;
		}
		//平板或手机
		co.GT_PTE({
			events: 'slideLeft',
			functions: function(e) {
				var ov = gpc(),
					nov = ov + 1 > img.length - 1 ? 0 : ov + 1;
				sa(false, ov, nov, true);
			}
		});
		co.GT_PTE({
			events: 'slideRight',
			functions: function(e) {
				var ov = gpc(),
					nov = ov - 1 < 0 ? img.length - 1 : ov - 1;
				sa(true, ov, nov, true);
			}
		});
	});
};

/*
图片滚动(Picture Scrolling)
版本:1.0 时间:2015.06.17
单独性:不可与GT_PTE分离
*/
$.fn.GT_PS = function(op) {
	var d = {
		scrollObj: null, //滚动对象(建议传入)
		defaultDir: true, //默认滚动方向(true 左右 false 上下)
		scrollSpeed: 100, //滚动速度(像素/秒)
		width: null, //容器宽度
		height: null, //容器高度
		btnAuto: false, //启动自动按钮(电脑版下有效, 启动后左(上)按钮参数和右(下)按钮参数无效)
		leftBtn: null, //左(上)按钮
		rightBtn: null, //右(下)按钮
	},
		o = $.extend({}, d, op);
	return this.each(function() {
		if ($.isEmptyObject($(this))) return $(this); //判断对象是否为空
		var to = function(e) { //检测对象
			return !e || $.type(e) != 'object' || $.isEmptyObject(e);
		}, //检测对象
			co = $(this), //当前对象
			so = to(o.scrollObj) ? co.children() : o.scrollObj, //滚动对象
			dd = $.type(o.defaultDir) != 'boolean' ? true : o.defaultDir, //默认滚动方向
			ddc = true, //滚动方向子级
			ss = $.isNumeric(o.scrollSpeed) ? 1000 / o.scrollSpeed : 100, //滚动速度
			ipc = !navigator.userAgent.match(/mobile/i), //是否为电脑设备
			w = !o.width ? $(window).width() : o.width, //容器宽度
			h = !o.height ? $(window).height() : o.height, //容器高度
			ba = $.type(o.btnAuto) != 'boolean' ? false : o.btnAuto, //启动自动按钮
			lb = to(o.leftBtn) ? null : o.leftBtn, //左(上)按钮
			rb = to(o.rightBtn) ? null : o.rightBtn, //右(下)按钮
			time, //计时器对象
			scr = function() { //滚动事件
				nsco.each(function(i) {
					if ((dd ? (ddc ? parseInt($(this).css('left')) <= nsco.outerWidth() * -1 : parseInt($(this).css('left')) >= nso.outerWidth()) : (ddc ? parseInt($(this).css('top')) <= nsco.outerHeight() * -1 : parseInt($(this).css('top')) >= nsco.outerHeight()))) dd ? $(this).css('left', (ddc ? nsco.outerWidth() * (scn - 1) : (nsco.outerWidth() * scn - nso.outerWidth()) * -1)) : $(this).css('top', nsco.outerHeight() * (scn - 1) * (ddc ? 1 : -1));
					dd ? $(this).css('left', parseInt($(this).css('left')) + (ddc ? -1 : 1)) : $(this).css('top', parseInt($(this).css('top')) + (ddc ? -1 : 1));
				});
			},
			gi = function(e, v) { //获取下标
				return e ? (v - 1 < 0 ? nsco.length - 1 : v - 1) : (v + 1 > nsco.length - 1 ? 0 : v + 1);
			},
			ap = function() { //调整位置
				nsco.each(function(i) {
					if ((dd ? (ddc ? parseInt($(this).css('left')) <= nsco.outerWidth() * -1 : parseInt($(this).css('left')) >= nso.outerWidth()) : (ddc ? parseInt($(this).css('top')) <= nsco.outerHeight() * -1 : parseInt($(this).css('top')) >= nso.outerHeight()))) dd ? $(this).css('left', parseInt(nsco.eq(gi(ddc, $(this).index())).css('left')) + (nsco.outerWidth() * (ddc ? 1 : -1))) : $(this).css('top', parseInt(nsco.eq(gi(ddc, $(this).index())).css('top')) + (nsco.outerHeight() * (ddc ? 1 : -1)));
				});
			};
		co.width(so.outerWidth(true) * (dd ? so.length : 1)).height(so.outerHeight(true) * (dd ? 1 : so.length));
		co.after('<div class="gt_ps"></div>');
		var nso = $('.gt_ps').last(), //新的滚动对象
			//新的子滚动对象数量
			scn = (dd ? parseInt($(window).outerWidth() / co.outerWidth()) < 1 ? 1 : ($(window).outerWidth() / co.outerWidth() > parseInt($(window).outerWidth() / co.outerWidth()) ? parseInt($(window).outerWidth() / co.outerWidth()) + 1 : parseInt($(window).outerHeight() / co.outerHeight())) : parseInt($(window).outerHeight() / co.outerHeight()) < 1 ? 1 : ($(window).outerHeight() / co.outerHeight() > parseInt($(window).outerHeight() / co.outerHeight()) ? parseInt($(window).outerHeight() / co.outerHeight()) + 1 : parseInt($(window).outerHeight() / co.outerHeight()))) + 1;
		for (var i = 0; i < scn; i++) {
			nso.append(co.clone());
		};
		co.hide();
		var nsco = nso.children(); //新的滚动子对象
		nso.width(dd ? w : co.outerWidth()).height(dd ? co.outerHeight(true) : h).css({
			'overflow': 'hidden',
			'position': 'relative'
		});
		dd ? nsco.css({
			'margin-left': 0,
			'margin-right': 0,
			'padding-left': 0,
			'padding-right': 0
		}) : nsco.css({
			'margin-top': 0,
			'margin-bottom': 0,
			'padding-top': 0,
			'padding-bottom': 0
		})
		nsco.each(function(i) {
			$(this).css({
				'position': 'absolute',
				'top': dd ? 0 : i * nsco.eq(i).outerHeight(),
				'left': dd ? i * $(this).outerWidth() : 0,
			});
		});
		time = setInterval(scr, ss);
		ap();
		if (ipc) { //电脑设备
			nso.hover(function() {
				clearInterval(time);
			}, function() {
				clearInterval(time);
				time = setInterval(scr, ss);
			});
			nso.mouseover(function(e) {
				clearInterval(time);
			});
			if (ba) { //生成自动按钮
				$('head').append('<style type="text/css">.gt_btn{ width: 30px; height: ' + nso.height() + 'px; position: absolute; z-index: 99999; background: #000; opacity: 0;}\n.gt_btn:hover{ opacity: 0.5;}\n.gt_btn .gt_scrollBtn{ -webkit-user-select:none; -moz-user-select:none; -ms-user-select:none; user-select:none; color: #000; font-family: -webkit-body; cursor: pointer; line-height: 20px; text-align: center; width: 20px; height: 20px; background: #FFF; border-radius: 50%; margin: ' + (nso.height() / 2) + 'px 5px;}\n.gt_btn .gt_switchBtn:hover{ background: #666;}</style>');
				nso.append('<div class="gt_btn" style="left: 0;"><div class="gt_scrollBtn gt_btnLeft"><</div></div><div class="gt_btn" style="right: 0;"><div class="gt_scrollBtn gt_btnRight">></div></div>');
				lb = nso.find('.gt_btn .gt_btnLeft');
				rb = nso.find('.gt_btn .gt_btnRight');
			}
			if (lb) lb.click(function(e) {
				ddc = true;
				ap();
				time = setInterval(scr, ss);
			});
			if (rb) rb.click(function(e) {
				ddc = false;
				ap();
				time = setInterval(scr, ss);
			});
			return;
		}
		//平板或手机
		nso.GT_PTE({
			events: 'down',
			functions: function(e) {
				clearInterval(time);
			}
		});
		nso.GT_PTE({
			events: 'up',
			functions: function(e) {
				time = setInterval(scr, ss);
			}
		});
		if (dd) { //左右滚动
			nso.GT_PTE({
				events: 'slideLeft',
				functions: function(e) {
					ddc = true;
					ap();
				}
			});
			nso.GT_PTE({
				events: 'slideRight',
				functions: function(e) {
					ddc = false;
					ap();
				}
			});
			return;
		}
		//上下滚动
		nso.GT_PTE({
			events: 'slideUp',
			functions: function(e) {
				ddc = false;
				ap();
			}
		});
		nso.GT_PTE({
			events: 'slideDown',
			functions: function(e) {
				ddc = true;
				ap();
			}
		});
	});
};

/*
输入框显示文字(Display Text)
版本: 1.0 时间:2015.06.19
单独性:可分离
*/
$.fn.GT_DT = function(op) {
	var d = {
		textBox: true, //开启文本框
		passWord: true //开启密码框
	},
		o = $.extend({}, d, op);
	return this.each(function() {
		if ($.type(o.textBox) != 'boolean' || $.type(o.passWord) != 'boolean' || (!(o.textBox && o.passWord)) || $.isEmptyObject($(this))) return;
		var co = $(this), //调用对象
			tb = o.textBox ? co.find('input[type="textbox"]') : null,
			pd = o.textBox ? co.find('input[type="password"]') : null;
		$('head').append('<style>\n.js_input{ color: #BBB !important;}\n</style>');
		if (o.textBox) tb.each(function(){
			$(this).val($(this).attr('js_input'));
		}).addClass('js_input').focus(function() {
			if ($(this).val() == $(this).attr('js_input')) $(this).val('').removeClass('js_input');
			tb.blur(function() {
				if ($(this).val() == '') $(this).val($(this).attr('js_input')).addClass('js_input');
			});
		});
		if (o.passWord) pd.each(function(){
			$(this).val($(this).attr('js_input'));
		}).attr('type', 'textbox').addClass('js_input').focus(function() {
			if ($(this).val() == $(this).attr('js_input')) $(this).attr('type', 'password').val('').removeClass('js_input');
			pd.blur(function() {
				if ($(this).val() == '') $(this).attr('type', 'textbox').val($(this).attr('js_input')).addClass('js_input');
			});
		});
	});
}

/*
选择日期(Selection Date)
版本:1.0 时间:
介绍:调用对象内所有包含selectionDate=true的元素获取焦点时出现选择日期框
*/
$.fn.GT_SD = function(op) {
	var d = {

	},
		o = $.extend({}, d, op);
	return this.each(function() {
		if ($.isEmptyObject($(this))) return $(this); //判断对象是否为空
		var to = function(e) { //检测对象
			return !e || $.type(e) != 'object' || $.isEmptyObject(e);
		}, //检测对象
			co = $(this), //当前对象
			ol = co.find('*[selectionDate="true"]'); //对象集
		ol.focus(function() {});
	});
};