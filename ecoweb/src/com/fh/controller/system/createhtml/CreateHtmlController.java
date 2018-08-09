package com.fh.controller.system.createhtml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.web.aboutus.AboutusManager;
import com.fh.service.web.contactus.ContactusManager;
import com.fh.service.web.contents.ContentsManager;
import com.fh.service.web.cooperation.CooperationManager;
import com.fh.service.web.corporatephilosophy.CorporatephilosophyManager;
import com.fh.service.web.image.ImageManager;
import com.fh.service.web.information.InformationManager;
import com.fh.service.web.news.NewsManager;
import com.fh.service.web.ourbusiness.OurBusinessManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.Freemarker;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;

/** 
 * 类名称： 页面静态化
 * 创建人：FH Q313596790
 * 修改时间：2016年12月27日
 * @version
 */
@Controller
@RequestMapping(value="/createHtml")
public class CreateHtmlController extends BaseController {
	
	@Resource(name="informationService")
	private InformationManager informationService;
	@Resource(name="imageService")
	private ImageManager imageService;
	@Resource(name="ourbusinessService")
	private OurBusinessManager ourbusinessService;
	@Resource(name="corporatephilosophyService")
	private CorporatephilosophyManager corporatephilosophyService;
	@Resource(name="contactusService")
	private ContactusManager contactusService;
	@Resource(name="aboutusService")
	private AboutusManager aboutusService;
	@Resource(name="cooperationService")
	private CooperationManager cooperationService;
	@Resource(name="newsService")
	private NewsManager newsService;
	@Resource(name="contentsService")
	private ContentsManager contentsService;
	
	/**选择模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/setMoban")
	@ResponseBody
	public Object setMoban() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"选择模版");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.FTLPATH,pd.getString("moban"));	//模版配置
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**一键生成入口
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proHome")
	@ResponseBody
	public Object proCode(HttpServletResponse response,Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getCp(root);				//公司理念
		this.getImg(root,"1");			//首页轮播图
		this.getDate(root,page,"xyxw","");	//学院新闻
		this.getDate(root,page,"tzgg","0");//通知公告
		this.getDate(root,page,"dj","1");//党建
		this.getDate(root,page,"sz","2");//思政
		this.getDate(root,page,"jx","");//教学
		this.getDate(root,page,"ky","");//科研
		this.getDate(root,page,"bksglxt","");//专题-本科生导师管理系统
		this.getDate(root,page,"xyxw","");//校园新闻
		this.getDate(root,page,"xxjj","");//学校简介
		this.getDate(root,page,"xrld","");//现任领导
		this.getDate(root,page,"zzjg","");//组织机构
		this.getDate(root,page,"xyjj","");//校园简介
		this.getDate(root,page,"pyfa","");//培养方案
		this.getDate(root,page,"gzzd","");//规章制度
		this.getDate(root,page,"zyjs","");//专业介绍
		this.getDate(root,page,"zyjs_y","");//专业介绍
		this.getDate(root,page,"pyfa_y","");//培养方案
		this.getDate(root,page,"gzzd_y","");//规章制度
		this.getDate(root,page,"jsdw","");//师之队伍
		this.getDate(root,page,"zxxx","");//关注团青
		this.getDate(root,page,"gjjl","");//新闻动态
		this.getDate(root,page,"xsjl","");//文件下载
		this.getDate(root,page,"zxxx_d","");//
		this.getDate(root,page,"ghzs_d","");//工会之声
		this.getDate(root,page,"llxx_d","");//理论学习
		this.getDate(root,page,"dwgz_d","");//党务工作
		this.getDate(root,page,"zxxx_s","");//
		this.getDate(root,page,"k_zxxx","");//
		this.getDate(root,page,"djzx_s","");//党建中心
		this.getDate(root,page,"djgz","");//党建工作
		this.getDate(root,page,"xyfc","");//校友风采
		this.getDate(root,page,"xsgz_s","");//学生工作
		this.getDate(root,page,"twgz_s","");//党委工作
		this.getDate(root,page,"xsxyj","");//	习新思想
		this.getDate(root,page,"pwdx","");//品味大学
		this.getDate(root,page,"hswc","");//红色文才
		this.getDate(root,page,"yjsxslt","");//研究生学术论坛  
		DelAllFile.delFolder(PathUtil.getClasspath()+"index.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("indexTemplate.ftl", root, "index.html", "", getFtlPath());
//		//校园新闻
		DelAllFile.delFolder(PathUtil.getClasspath()+"webNews.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newsTemplate.ftl", root, "webNews.html", "", getFtlPath());
//		//通知公告
		DelAllFile.delFolder(PathUtil.getClasspath()+"webNotice.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("tzggTemplate.ftl", root, "webNotice.html", "", getFtlPath());
//		//党建
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdj.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("djTemplate.ftl", root, "webdj.html", "", getFtlPath());
//		//思政
		DelAllFile.delFolder(PathUtil.getClasspath()+"websz.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("szTemplate.ftl", root, "websz.html", "", getFtlPath());
		//教学
		DelAllFile.delFolder(PathUtil.getClasspath()+"webjx.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("jxTemplate.ftl", root, "webjx.html", "", getFtlPath());
		//科研
		DelAllFile.delFolder(PathUtil.getClasspath()+"webky.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("kyTemplate.ftl", root, "webky.html", "", getFtlPath());
//		//学院简介
		DelAllFile.delFolder(PathUtil.getClasspath()+"webIntro.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("introTemplate.ftl", root, "webIntro.html", "", getFtlPath());
//		//现任领导
		DelAllFile.delFolder(PathUtil.getClasspath()+"webLeader.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("leaderTemplate.ftl", root, "webLeader.html", "", getFtlPath());
//		//组织机构
		DelAllFile.delFolder(PathUtil.getClasspath()+"webOrg.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("orgTemplate.ftl", root, "webOrg.html", "", getFtlPath());
//	    //专业介绍
		DelAllFile.delFolder(PathUtil.getClasspath()+"webprof.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("profTemplate.ftl", root, "webprof.html", "", getFtlPath());
//		//培养方案
		DelAllFile.delFolder(PathUtil.getClasspath()+"webplan.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("planTemplate.ftl", root, "webplan.html", "", getFtlPath());
		//规章制度
		DelAllFile.delFolder(PathUtil.getClasspath()+"webregu.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("reguTemplate.ftl", root, "webregu.html", "", getFtlPath());
		//专业介绍-y
		DelAllFile.delFolder(PathUtil.getClasspath()+"webprof_y.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("yprofTemplate.ftl", root, "webprof_y.html", "", getFtlPath());
//		//培养方案-y
		DelAllFile.delFolder(PathUtil.getClasspath()+"webplan_y.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("yplanTemplate.ftl", root, "webplan_y.html", "", getFtlPath());
//		//规章制度-y
		DelAllFile.delFolder(PathUtil.getClasspath()+"webregu_y.html"); 
		Freemarker.printFile("yreguTemplate.ftl", root, "webregu_y.html", "", getFtlPath());
		//师资队伍
		DelAllFile.delFolder(PathUtil.getClasspath()+"webjsdw.html"); 
		Freemarker.printFile("jsdwTemplate.ftl", root, "webjsdw.html", "", getFtlPath());
//		//最新消息
		DelAllFile.delFolder(PathUtil.getClasspath()+"webzxxx.html"); 
		Freemarker.printFile("zxxxTemplate.ftl", root, "webzxxx.html", "", getFtlPath());
//		//国际交流
		DelAllFile.delFolder(PathUtil.getClasspath()+"webinternation.html"); 
		Freemarker.printFile("internationalTemplate.ftl", root, "webinternation.html", "", getFtlPath());
//		//学术交流
		DelAllFile.delFolder(PathUtil.getClasspath()+"webacademic.html"); 
		Freemarker.printFile("academicTemplate.ftl", root, "webacademic.html", "", getFtlPath());
		//
		DelAllFile.delFolder(PathUtil.getClasspath()+"webzxxx_d.html"); 
		Freemarker.printFile("d_zxxxTemplate.ftl", root, "webzxxx_d.html", "", getFtlPath());
//		map.put("result", "success");
		//党务工作
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdwgz_d.html"); 
		Freemarker.printFile("d_dwgzTemplate.ftl", root, "webdwgz_d.html", "", getFtlPath());
//		//工会之声
		DelAllFile.delFolder(PathUtil.getClasspath()+"webghzs_d.html"); 
		Freemarker.printFile("d_ghzsTemplate.ftl", root, "webghzs_d.html", "", getFtlPath());
		//理论学习
		DelAllFile.delFolder(PathUtil.getClasspath()+"webllxx_d.html"); 
		Freemarker.printFile("d_llxxTemplate.ftl", root, "webllxx_d.html", "", getFtlPath());
		//党建中心
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdjgz_d.html"); 
		Freemarker.printFile("d_djgzTemplate.ftl", root, "webdjgz_d.html", "", getFtlPath());
		//校友风采
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdxyfc.html"); 
		Freemarker.printFile("xyfcTemplate.ftl", root, "webxyfc.html", "", getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath()+"webzxxx_k.html"); 
		Freemarker.printFile("k_zxxxTemplate.ftl", root, "webzxxx_k.html", "", getFtlPath());
		//学科建设
		DelAllFile.delFolder(PathUtil.getClasspath()+"webxkjs.html"); 
		Freemarker.printFile("xkjsTemplate.ftl", root, "webxkjs.html", "", getFtlPath());
		//科研动态
		DelAllFile.delFolder(PathUtil.getClasspath()+"webkydt.html"); 
		Freemarker.printFile("kydtTemplate.ftl", root, "webkydt.html", "", getFtlPath());
		//最新消息
		DelAllFile.delFolder(PathUtil.getClasspath()+"webzxxx_s.html"); 
		Freemarker.printFile("s_zxxxTemplate.ftl", root, "webzxxx_s.html", "", getFtlPath());
		//党建中心
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdjgz_s.html"); 
		Freemarker.printFile("s_djgzTemplate.ftl", root, "webdjgz_s.html", "", getFtlPath());
		//学生工作
		DelAllFile.delFolder(PathUtil.getClasspath()+"webxsgz_s.html"); 
		Freemarker.printFile("s_xsgzTemplate.ftl", root, "webxsgz_s.html", "", getFtlPath());
		//团委工作
		DelAllFile.delFolder(PathUtil.getClasspath()+"webtwgz_s.html"); 
		Freemarker.printFile("s_twgzTemplate.ftl", root, "webtwgz_s.html", "", getFtlPath());
		//习新思想
		DelAllFile.delFolder(PathUtil.getClasspath()+"weblist_1.html"); 
		Freemarker.printFile("nav1Template.ftl", root, "weblist_1.html", "", getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath()+"weblist_2.html"); 
		Freemarker.printFile("nav2Template.ftl", root, "weblist_2.html", "", getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath()+"weblist_3.html"); 
		Freemarker.printFile("nav3Template.ftl", root, "weblist_3.html", "", getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath()+"weblist_4.html"); 
		Freemarker.printFile("nav4Template.ftl", root, "weblist_4.html", "", getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdetail.html"); 
		Freemarker.printFile("detailTemplate.ftl", root, "webdetail.html", "", getFtlPath());
		//书记信箱
		DelAllFile.delFolder(PathUtil.getClasspath()+"websjemail.html"); 
		Freemarker.printFile("sjemailTemplate.ftl", root, "websjemail.html", "", getFtlPath());
		//院长信箱
		DelAllFile.delFolder(PathUtil.getClasspath()+"webyzemail.html"); 
		Freemarker.printFile("yzemailTemplate.ftl", root, "webyzemail.html", "", getFtlPath());
		//
		DelAllFile.delFolder(PathUtil.getClasspath()+"webdetail.html"); 
		Freemarker.printFile("detailTemplate.ftl", root, "webdetail.html", "", getFtlPath());
		//领导详情
		DelAllFile.delFolder(PathUtil.getClasspath()+"webleaderDetail.html"); 
		Freemarker.printFile("leaderDetailTemplate.ftl", root, "webleaderDetail.html", "", getFtlPath());
		//
		DelAllFile.delFolder(PathUtil.getClasspath()+"websearch.html"); 
		Freemarker.printFile("searchTemplate.ftl", root, "websearch.html", "", getFtlPath());
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成关于我们页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proAboutus")
	@ResponseBody
	public Object proAboutus(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("ABOUTUS_ID", "1");
		pdC = aboutusService.findById(pdC);
		root.put("ABOUTUS", pdC.getString("CONTENT")); //联系我们
		DelAllFile.delFolder(PathUtil.getClasspath()+"webaboutus.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("aboutusTemplate.ftl", root, "webaboutus.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成产品案例页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proProduct")
	@ResponseBody
	public Object proProduct(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		this.getImg(root,"5");			//产品案例
		DelAllFile.delFolder(PathUtil.getClasspath()+"webproduct.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("productTemplate.ftl", root, "webproduct.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成合作共赢页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proCooperation")
	@ResponseBody
	public Object proCooperation(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("COOPERATION_ID", "1");
		pdC = cooperationService.findById(pdC);
		root.put("cooperation", pdC.getString("CONTENT")); //联系我们
		DelAllFile.delFolder(PathUtil.getClasspath()+"webcooperation.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("cooperationTemplate.ftl", root, "webcooperation.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成新闻动态页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proNews")
	@ResponseBody
	public Object proNews(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		this.getNews(root);				//新闻列表
		DelAllFile.delFolder(PathUtil.getClasspath()+"webnews.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newsTemplate.ftl", root, "webnews.html", "", getFtlPath());
		this.proNewsdetail();			//生成新闻明细页
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成新闻动态详细页面
	 * @param response
	 * @throws Exception
	 */
	public void proNewsdetail() throws Exception{
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		DelAllFile.delFolder(PathUtil.getClasspath()+"webnewsdetail.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newsdetailTemplate.ftl", root, "webnewsdetail.html", "", getFtlPath());
	}
	
	/**生成联系我们页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proContactus")
	@ResponseBody
	public Object proContactus(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("CONTACTUS_ID", "1");
		pdC = contactusService.findById(pdC);
		root.put("CONTACTUS", pdC.getString("CONTENT")); //联系我们
		DelAllFile.delFolder(PathUtil.getClasspath()+"webcontactus.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("contactusTemplate.ftl", root, "webcontactus.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	/** 获取新闻列表
	 * @param root
	 * @throws Exception
	 */
	public void getNews(Map<String,Object> root) throws Exception{
		PageData pdNews = new PageData();
		List<PageData> listNews = newsService.listAll(pdNews);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listNews.size();i++){
			String[] array = new String[6]; 
			array[0] = listNews.get(i).getString("NEWS_ID");		//ID
			array[1] = listNews.get(i).getString("TITLE");			//标题
			array[2] = listNews.get(i).getString("CTIME");			//发表时间
			array[3] = listNews.get(i).getString("STEMFROM");		//来源
			array[4] = listNews.get(i).getString("IMAGE");			//图片
			array[5] = listNews.get(i).getString("SHORTCONTENT");	//简述
			fieldList.add(array);
		}
		root.put("listNews", fieldList);	
	}
	
	/** 图片
	 * @param root
	 * @throws Exception
	 */
	public void getImg(Map<String,Object> root, String TYPE) throws Exception{
		PageData pdImg = new PageData();
		pdImg.put("TYPE", TYPE);
		List<PageData> listImg1 = imageService.listAll(pdImg);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listImg1.size();i++){
			String[] array = new String[4]; 
			array[0] = listImg1.get(i).getString("TITLE");	//图片标题
			array[1] = listImg1.get(i).getString("IMGURL");	//图片地址
			array[2] = listImg1.get(i).getString("TOURL");	//图片链接
			array[3] = listImg1.get(i).getString("BZ");		//图片备注
			fieldList.add(array);
		}
		root.put("fieldList"+TYPE, fieldList);	
	}
	public void getDate(Map<String,Object> root,Page page,String TYPE,String j) throws Exception{
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("PUB_TYPE", TYPE);
		page.setPd(pdDate);
		List<PageData> listDate = null;
		if(TYPE.equals("bbjj")){
			 listDate = contentsService.listByType(pdDate);
		}else if(TYPE.equals("bksglxt")||TYPE.equals("xyjj")||TYPE.equals("zzjg")){
			 listDate = contentsService.listByType(pdDate);
		}else if(TYPE.equals("dj")||TYPE.equals("sz")||TYPE.equals("jx")||TYPE.equals("ky")||TYPE.equals("zxxx")||TYPE.equals("zxxx_d")||TYPE.equals("zxxx_s")||TYPE.equals("k_zxxx")){
			 listDate = contentsService.list0(page);
		}else {
			 page.setShowCount(10);
			 listDate = contentsService.list(page);
		}
		List<String[]> fieldList = new ArrayList<String[]>();
		if(listDate!=null){
		for(int i=0;i<listDate.size();i++){
			String[] array = new String[7]; 
			array[0] = listDate.get(i).getString("CONTENTS_ID");	//id
			array[1] = listDate.get(i).getString("TITLE");	//标题
			if(TYPE.equals("xrld")){
				array[2] = listDate.get(i).getString("CONTENT").replaceAll("</?[^>]+>", "").trim();	//内容
			}else{
				array[2] = listDate.get(i).getString("CONTENT");	//内容
			}
			array[3] = listDate.get(i).getString("THUMNAIL");		//图片
			array[4] = listDate.get(i).getString("PUB_TIME");		//发布时间
			array[5] = listDate.get(i).getString("PUB_LINK");		//链接
			array[6] = listDate.get(i).getString("DESCRIPTION");	//描述
			fieldList.add(array);
		}
		}
		root.put("fieldList"+TYPE, fieldList);	
		root.put("totalPage"+TYPE, page.getTotalPage());
		root.put("totalResult"+TYPE, page.getTotalResult());
		root.put("currentPage"+TYPE, page.getCurrentPage());
		root.put("page", page);
	}
	/** 网站基本信息
	 * @param root
	 * @throws Exception
	 */
	public void getInfo(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("INFORMATION_ID", "1");
		pdInfo = informationService.findById(pdInfo);
		root.put("NAME", pdInfo.getString("NAME"));					//网站名称
		root.put("TITLE", pdInfo.getString("TITLE"));				//网站标题
		root.put("KEYWORDS", pdInfo.getString("KEYWORDS"));			//网站关键词
		root.put("DESCRIPTION", pdInfo.getString("DESCRIPTION"));	//网站描述
		root.put("LOGO", pdInfo.getString("LOGO"));					//LOGO
		root.put("TEL", pdInfo.getString("TEL"));					//电话
		root.put("EMAIL", pdInfo.getString("EMAIL"));				//邮箱
		root.put("QQ", pdInfo.getString("QQ"));						//QQ
		root.put("FAX", pdInfo.getString("FAX"));					//传真
		root.put("WEBURL", pdInfo.getString("WEBURL"));				//官网
		root.put("ADDRESS", pdInfo.getString("ADDRESS"));			//地址
		root.put("COPYRIGHT", pdInfo.getString("COPYRIGHT"));		//版权
		root.put("TECHNOLOGY", pdInfo.getString("TECHNOLOGY"));		//技术支持
		root.put("BEIAN", pdInfo.getString("BEIAN"));				//备案
		root.put("ABOUTUS1", pdInfo.getString("ABOUTUS1"));			//关于我们上
		root.put("ABOUTUS2", pdInfo.getString("ABOUTUS2"));			//关于我们下
		root.put("NEW1", pdInfo.getString("NEW1"));					//最新消息1
		root.put("NEW2", pdInfo.getString("NEW2"));	
		root.put("BACK_IMGS", pdInfo.getString("BACK_IMGS"));	//网站登陆背景图
	}
	
	/** 网站首页我们的业务
	 * @param root
	 * @throws Exception
	 */
	public void getOurbusiness(Map<String,Object> root) throws Exception{
		PageData pdOb = new PageData();
		pdOb.put("OURBUSINESS_ID", "1");
		pdOb = ourbusinessService.findById(pdOb);
		root.put("TITLE1", pdOb.getString("TITLE1"));				//介绍上
		root.put("TITLE2", pdOb.getString("TITLE2"));				//介绍下
		root.put("CONTENT1", pdOb.getString("CONTENT1"));			//内容上
		root.put("CONTENT2", pdOb.getString("CONTENT2"));			//内容上
		root.put("TOURL", pdOb.getString("TOURL"));					//内容链接
		root.put("OTHER1", pdOb.getString("OTHER1"));				//其他1
		root.put("OTHER2", pdOb.getString("OTHER2"));				//其他2
		root.put("IMG1", pdOb.getString("IMG1"));					//图1
		root.put("IMG2", pdOb.getString("IMG2"));					//图2
		root.put("M3_TITLE", pdOb.getString("M3_TITLE"));			//标题
		root.put("M3_CONTENT1", pdOb.getString("M3_CONTENT1"));		//内容1
		root.put("M3_CONTENT2", pdOb.getString("M3_CONTENT2"));		//内容2
		root.put("M3_CONTENT3", pdOb.getString("M3_CONTENT3"));		//内容3
	}
	
	/** 公司理念
	 * @param root
	 * @throws Exception
	 */
	public void getCp(Map<String,Object> root) throws Exception{
		for(int i=1;i<5;i++){
			PageData pdCp = new PageData();
			pdCp.put("CORPORATEPHILOSOPHY_ID", i);
			pdCp = corporatephilosophyService.findById(pdCp);
			root.put("CPTITLE"+i, pdCp.getString("TITLE"));		//标题
			root.put("CPCONTENT"+i, pdCp.getString("CONTENT"));	//内容
			root.put("CPTOURL"+i, pdCp.getString("TOURL"));		//链接
		}
	}
	
	/**
	 * 获取路径
	 */
	public String getFtlPath(){
		return Tools.readTxtFile(Const.FTLPATH);
	}
	
}
