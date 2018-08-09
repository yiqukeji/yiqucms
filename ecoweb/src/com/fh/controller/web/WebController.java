package com.fh.controller.web;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Menu;
import com.fh.service.system.blacklist.BlacklistManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.statistics.StatisticsManager;
import com.fh.service.web.contents.ContentsManager;
import com.fh.service.web.leavemsg.LeavemsgManager;
import com.fh.service.web.message.MessageManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Counter;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：访问首页)
 * 创建人：FH Q313596790
 * 创建时间：2016-03-30
 */
@Controller
@RequestMapping(value="/web")
public class WebController extends BaseController {

	@Resource(name="leavemsgService")
	private LeavemsgManager leavemsgService;
	@Resource(name="statisticsService")
	private StatisticsManager statisticsService;
	@Resource(name="blacklistService")
	private BlacklistManager blacklistService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="contentsService")
	private ContentsManager contentsService;
	@Resource(name="messageService")
	private MessageManager messageService;
	
	/**访问首页(废弃,默认访问的首页是根目录index.html)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("web/index");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**保存访客留言
	 * @return
	 */
	@RequestMapping(value="/saveLeavemsg")
	@ResponseBody
	public Object saveLeavemsg(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("LEAVEMSG_ID", this.get32UUID());		//主键
			pd.put("CTIME", Tools.date2Str(new Date()));	//提交时间
			leavemsgService.save(pd);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**访问记录
	 * @return
	 */
	@RequestMapping(value="/addStatistics")
	public void addStatistics(){
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		String path="http://ip.taobao.com/service/getIpInfo.php?ip="+ip;
		try {
			URL url=new URL(path);
			HttpURLConnection http = (HttpURLConnection)url.openConnection();
			http.setDoOutput(true);
			http.setDoInput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.connect();
			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] bt = new byte[size];
			is.read(bt);
			String message=new String(bt,"UTF-8");
			JSONObject jsonMsg = JSONObject.fromObject(message);
			JSONObject jsonMsg2 = JSONObject.fromObject(jsonMsg.getString("data"));
			String country = jsonMsg2.getString("country");
			String area = jsonMsg2.getString("area");
			String region = jsonMsg2.getString("region");
			String city = jsonMsg2.getString("city");
			String isp = jsonMsg2.getString("isp");
			String AREA = country+" "+area+" "+region+" "+city;
			pd.put("STATISTICS_ID", this.get32UUID());		//主键
			pd.put("IP", ip);			//IP
			pd.put("AREA", AREA);		//地区
			pd.put("OPERATOR", isp);	//运营商
			pd.put("CDATE", DateUtil.getDay());				//日期
			pd.put("CTIME", Tools.date2Str(new Date()));	//时间
			try {
				statisticsService.save(pd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**判断访客IP是否在黑名单
	 * @return
	 */
	@RequestMapping(value="/isBlack")
	@ResponseBody
	public Object isBlack(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String IP = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			IP = request.getRemoteAddr();  
	    }else{
	    	IP = request.getHeader("x-forwarded-for");  
	    }
		String result = "OK";
		try{
			pd.put("IP", IP);
			List<PageData>	varList = blacklistService.listAll(pd);
			if(varList.size() > 0){
				result = "NO";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 传递首页菜单数据
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/muneList")
	public @ResponseBody Object getMuneList() throws Exception{
		List<Menu> menulist = new ArrayList<Menu>(); 
		//获取导航菜单数据
		menulist = menuService.listByStateMenu("1");
		JSONArray arr = JSONArray.fromObject(menulist);
		String menuJson = arr.toString();
		menuJson = menuJson.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("MENU_NAME", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked").replaceAll("MENU_URL", "url");
		return menulist;
	}
	/**
	 * //获取除首页导航其他外的数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/subMuneList")
	public @ResponseBody Object getSubMenuList() throws Exception{
		List<Menu> menulist = new ArrayList<Menu>(); 
		menulist = menuService.listByF_StateMenu("1");
		JSONArray arr = JSONArray.fromObject(menulist);
		String menuJson = arr.toString();
		menuJson = menuJson.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("MENU_NAME", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked").replaceAll("MENU_URL", "url");
		return menulist;
	}
	/**
	 * 获取页面内容信息数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="menuDate")
	public @ResponseBody List getMenuDate(Page page) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = contentsService.list(page);	//列出Contents列表
		return varList;
	}
	/**
	 * 查询新闻详情
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getNewDetail")
	@ResponseBody
	public Object getNewDetail(HttpServletResponse  res) throws Exception{
		res.addHeader("Access-Control-Allow-Origin", "*");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();
		String count = null;
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("CONTENTS_ID", pd.getString("CONTENTS_ID"));
				pd = contentsService.findById(pd);
				count = Counter.getCounts(pd.getString("NUMBER"));//获取被点击次数
				pd.put("NUMBER", count);
				contentsService.editByCount(pd);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		PageData pds = new PageData();
		Session session = Jurisdiction.getSession();
		pds = (PageData)session.getAttribute(Const.SESSION_userpds);
		map.put("data", pd);
		map.put("pds", pds);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 分页查询
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/pageHtml")
	@ResponseBody
	public Object pageHtml(Page page,HttpServletResponse  res) throws Exception{
		res.addHeader("Access-Control-Allow-Origin", "*");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pdC = new PageData();
		List<PageData> list=null;
		//分页查询
		pdC = this.getPageData();
		page.setPd(pdC);
		String type = pdC.getString("PUB_TYPE");
		if(type.equals("eo02")){
			page.setShowCount(6);
			list = contentsService.list(page);
		}else if(type.equals("djtx")||type.equals("jxky")||type.equals("eo11_eo12")||type.equals("eo11_eo10")||type.equals("eo11_eo16")||type.equals("eo11_eo18")){
			list = contentsService.list0(page);
		}else{
			page.setShowCount(10);
			list = contentsService.list(page);
		};
		map.put("list", list);
		map.put("result", "success");
		map.put("page", page);
		return AppUtil.returnObject(new PageData(), map);
	}
	@RequestMapping(value="/savaMessage")
	@ResponseBody
	public Object savaMessage() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MESSAGE_ID", this.get32UUID());	//主键
		pd.put("C_TIME", Tools.date2Str(new Date()));	//创建时间
		messageService.save(pd);
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list(Page page,HttpServletResponse  res) throws Exception{
		res.addHeader("Access-Control-Allow-Origin", "*");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pdC = new PageData();
		//分页查询
		pdC = this.getPageData();
		String keywords = pdC.getString("keywords");
		if(null != keywords && !"".equals(keywords)){
			pdC.put("keywords", keywords.trim());
		}
		page.setPd(pdC);
		List<PageData>	list = contentsService.list(page);
		map.put("list", list);
		map.put("result", "success");
		map.put("page", page);
		map.put("totalPage", page.getTotalPage());
		map.put("totalSize",page.getTotalResult());
		map.put("currentPage",  page.getCurrentPage());
		return AppUtil.returnObject(new PageData(), map);
	}
}
