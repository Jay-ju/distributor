package com.zx.stlife.controller.wx;

import com.base.jpa.query.Page;
import com.zx.stlife.base.UserWxUtils;
import com.zx.stlife.constant.Const;
import com.zx.stlife.controller.app.base.JsonResult;
import com.zx.stlife.controller.app.base.JsonResultUtils;
import com.zx.stlife.controller.common.BizCommon;
import com.zx.stlife.controller.web.BaseController;
import com.zx.stlife.entity.goods.GoodsImage;
import com.zx.stlife.entity.goods.GoodsTimes;
import com.zx.stlife.entity.order.SnatchListItem;
import com.zx.stlife.entity.order.SnatchRecordDetail;
import com.zx.stlife.service.goods.GoodsService;
import com.zx.stlife.service.goods.GoodsTimesService;
import com.zx.stlife.service.order.SnatchListItemService;
import com.zx.stlife.service.order.SnatchNumService;
import com.zx.stlife.service.order.SnatchRecordDetailService;
import com.zx.stlife.service.order.SnatchRecordService;
import com.zx.stlife.service.sys.ImageSettingService;
import com.zx.stlife.tools.DateUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/wx")
public class IndexWxController extends BaseController<GoodsTimes>{
	
	@Autowired
	private GoodsTimesService goodsTimesService;
	@Autowired
	private ImageSettingService imageSettingService;
	@Autowired
    private SnatchListItemService snatchListItemService;

	@RequestMapping("/index")
	public String index(Model model,Page<GoodsTimes> page){ 
		model.addAttribute("goodsTimeList", goodsTimesService.findTop());
		Date date = DateUtils.getNow();
//		Page<GoodsTimes> page=new Page<GoodsTimes>();
		page.setPageSize(10);
		goodsTimesService.findGoodsTimesByAttr(page, date, null, null);
		model.addAttribute("page", page);
		
		String timestamp = DateUtils.dateToYYYYMMDDHHMMSSSSSString(date);
		model.addAttribute("page", page)
		.addAttribute("timestamp", timestamp).addAttribute("listCount", 0);
		bindData(model);
		return "wx/index";
	}
	
	@RequestMapping("allByJson")
	@ResponseBody
	public JsonResult allByJson(Page<GoodsTimes> page,
			 @RequestParam("timestamp") String timestamp){ 
		page.setAutoCount(false);
		return BizCommon.getGoodsTimesByAttr(
				page, timestamp, null, null, goodsTimesService);
	}
	
	private void bindData(Model model) {
		Integer userId = UserWxUtils.getCurrUserId();

		Integer listCount=0;
		if(userId!=null){
			listCount= snatchListItemService.getUserListCount(userId); //获取清单总数（购物车）
		}
		model.addAttribute("userId", userId)
				.addAttribute("listCount", listCount)
				.addAttribute("lastWinngUserList", goodsTimesService.winngUser())
				.addAttribute("imageList", imageSettingService.findAllWithCache(Const.ImageCategory.INDEX_TOP_SWITCH));
	}
}
