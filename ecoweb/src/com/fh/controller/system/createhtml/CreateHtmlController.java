package com.fh.controller.system.createhtml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.web.aboutus.AboutusManager;
import com.fh.service.web.contents.ContentsManager;
import com.fh.service.web.image.ImageManager;
import com.fh.service.web.information.InformationManager;
import com.fh.service.web.xiehonglun.XiehonglunManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.Freemarker;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;

/**
 * 类名称： 页面静态化 创建人： 修改时间：2016年12月27日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/createHtml")
public class CreateHtmlController extends BaseController {
	@Resource(name = "informationService")
	private InformationManager informationService;
	@Resource(name = "imageService")
	private ImageManager imageService;
	@Resource(name = "aboutusService")
	private AboutusManager aboutusService;
	@Resource(name = "contentsService")
	private ContentsManager contentsService;
	@Resource(name = "xiehonglunService")
	private XiehonglunManager xiehonglunService;

	/**
	 * 选择模版
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/setMoban")
	@ResponseBody
	public Object setMoban() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "选择模版");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.FTLPATH, pd.getString("moban")); // 模版配置
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 生成首页html
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/proHome")
	@ResponseBody
	public Object proCode(
			HttpServletResponse response,
			Page page,
			@RequestParam(required = false, value = "typeArr[]") List<String> typeArr)
			throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "执行页面静态化");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> root = new HashMap<String, Object>(); // 创建数据模型
		this.getInfo(root); // 网站基本信息
		this.getImg(root, "1"); // 首页轮播图
		this.boBao(root);
		this.newsImg(root, page);
		// 获取页面数据
		if (typeArr.size() > 0) {
			for (int i = 0; i < typeArr.size(); i++) {
				this.getDate(root, page, typeArr.get(i), "");
			}
		}
		DelAllFile.delFolder(PathUtil.getClasspath() + "index.html"); // 生成代码前,先清空之前生成的文件
		Freemarker.printFile("indexTemplate.ftl", root, "index.html", "",
				getFtlPath());
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webnew.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("newListTemplate.ftl", root, "webnew.html", "",
		// getFtlPath());
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webdetail.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("detailTemplate.ftl", root, "webdetail.html",
		// "", getFtlPath());
		// DelAllFile.delFolder(PathUtil.getClasspath()+"websub.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("subMenuTemplate.ftl", root, "websub.html", "",
		// getFtlPath());
		DelAllFile.delFolder(PathUtil.getClasspath() + "webindex.html"); // 生成代码前,先清空之前生成的文件
		Freemarker.printFile("leaderTemplate.ftl", root, "webindex.html", "",
				getFtlPath());
		// 简介
		DelAllFile.delFolder(PathUtil.getClasspath() + "webnews1.html"); // 生成代码前,先清空之前生成的文件
		Freemarker.printFile("news1Template.ftl", root, "webnews1.html", "",
				getFtlPath());
		// 组织机构
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webnews2.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("news2Template.ftl", root, "webnews2.html", "",
		// getFtlPath());
		// //领导详情
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webleaderdetail.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("leaderDetailTemplate.ftl", root,
		// "webleaderdetail.html", "", getFtlPath());
		// //师之队伍
		// DelAllFile.delFolder(PathUtil.getClasspath()+"websz.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("teacherTemplate.ftl", root, "websz.html", "",
		// getFtlPath());
		// //搜索页面
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webseach.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("seacherListTemplate.ftl", root,
		// "webseach.html", "", getFtlPath());
		// //信箱
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webxx.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("xinxiangTemplate.ftl", root, "webxx.html", "",
		// getFtlPath());
		// //经济系
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webj.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("jTemplate.ftl", root, "webj.html", "",
		// getFtlPath());
		// //
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webc.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("cTemplate.ftl", root, "webc.html", "",
		// getFtlPath());
		// //
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webg.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("gTemplate.ftl", root, "webg.html", "",
		// getFtlPath());
		// //
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webk.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("kTemplate.ftl", root, "webk.html", "",
		// getFtlPath());
		// //
		// DelAllFile.delFolder(PathUtil.getClasspath()+"webx.html");
		// //生成代码前,先清空之前生成的文件
		// Freemarker.printFile("xTemplate.ftl", root, "webx.html", "",
		// getFtlPath());
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 图片
	 * 
	 * @param root
	 * @throws Exception
	 */
	public void getImg(Map<String, Object> root, String TYPE) throws Exception {
		PageData pdImg = new PageData();
		pdImg.put("TYPE", TYPE);
		List<PageData> listImg1 = imageService.listAll(pdImg);
		List<String[]> fieldList = new ArrayList<String[]>();
		for (int i = 0; i < listImg1.size(); i++) {
			String[] array = new String[4];
			array[0] = listImg1.get(i).getString("TITLE"); // 图片标题
			array[1] = listImg1.get(i).getString("IMGURL"); // 图片地址
			array[2] = listImg1.get(i).getString("TOURL"); // 图片链接
			array[3] = listImg1.get(i).getString("BZ"); // 图片备注
			fieldList.add(array);
		}
		root.put("fieldList" + TYPE, fieldList);
	}

	/**
	 * 最新播报
	 */
	public void boBao(Map<String, Object> root) throws Exception {
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		List<PageData> listDate = null;
		listDate = contentsService.listByTime(pdDate);
		List<String[]> fieldList = new ArrayList<String[]>();
		for (int i = 0; i < listDate.size(); i++) {
			String[] array = new String[4];
			array[0] = listDate.get(i).getString("CONTENTS_ID"); // id
			array[1] = listDate.get(i).getString("TITLE"); // 标题
			array[2] = listDate.get(i).getString("PUB_TIME"); // 标题
			array[3] = listDate.get(i).getString("PUB_TYPE");
			fieldList.add(array);
		}
		root.put("fieldListbb", fieldList);
	}

	/**
	 * 图片新闻
	 */
	public void newsImg(Map<String, Object> root, Page page) throws Exception {
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = contentsService.list1(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		for (int i = 0; i < listDate.size(); i++) {
			String[] array = new String[4];
			array[0] = listDate.get(i).getString("CONTENTS_ID"); // id
			array[1] = listDate.get(i).getString("TITLE"); // 标题
			array[2] = listDate.get(i).getString("THUMNAIL"); // 标题
			array[3] = listDate.get(i).getString("PUB_TYPE"); // 类型
			fieldList.add(array);
		}
		root.put("fieldListNewsImg", fieldList);
	}

	/**
	 * 信息维护
	 * 
	 * @param root
	 * @param page
	 * @param TYPE
	 * @throws Exception
	 */
	public void infoMaintain(Map<String, Object> root, Page page, String TYPE)
			throws Exception {
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("TYPE", TYPE);
		page.setPd(pdDate);
		List<PageData> listDate = null;
		listDate = xiehonglunService.list(page);
		List<String[]> fieldList = new ArrayList<String[]>();
		if (listDate != null) {
			for (int i = 0; i < listDate.size(); i++) {
				String[] array = new String[4];
				array[0] = listDate.get(i).getString("XIEHONGLUN_ID"); // id
				array[1] = listDate.get(i).getString("IMGICON"); // 标题
				array[2] = listDate.get(i).getString("TYPE"); // 图片
				array[3] = listDate.get(i).getString("TITLE"); //
				fieldList.add(array);
			}
		}
		root.put("fieldList" + TYPE, fieldList);
	}

	public void getDate(Map<String, Object> root, Page page, String TYPE,
			String j) throws Exception {
		PageData pdDate = new PageData();
		pdDate = this.getPageData();
		pdDate.put("PUB_TYPE", TYPE);
		page.setPd(pdDate);
		List<PageData> listDate = null;
		if (TYPE.equals("bbjj")) {
			listDate = contentsService.listByType(pdDate);
		} else if (TYPE.equals("djtx") || TYPE.equals("jxky")) {// 党建团学、教学科研
			listDate = contentsService.list0(page);
		} else if (TYPE.equals("eo02")) {
			page.setShowCount(6);
			listDate = contentsService.list(page);
		} else if (TYPE.equals("eo10") || TYPE.equals("eo33")
				|| TYPE.equals("eo34") || TYPE.equals("eo35")
				|| TYPE.equals("eo36")) {
			page.setShowCount(1000);
			listDate = contentsService.list(page);
		} else if (TYPE.equals("z0") || TYPE.equals("z1") || TYPE.equals("z2")
				|| TYPE.equals("z3")) {
			listDate = contentsService.list0(page);
		} else {
			page.setShowCount(10);
			listDate = contentsService.list(page);
		}
		List<String[]> fieldList = new ArrayList<String[]>();
		if (listDate != null) {
			for (int i = 0; i < listDate.size(); i++) {
				String[] array = new String[9];
				array[0] = listDate.get(i).getString("CONTENTS_ID"); // id
				array[1] = listDate.get(i).getString("TITLE"); // 标题
				if (TYPE.equals("eo02")) {
					array[2] = listDate.get(i).getString("CONTENT")
							.replaceAll("</?[^>]+>", "").trim(); // 内容
				} else {
					array[2] = listDate.get(i).getString("CONTENT"); // 内容
				}
				array[3] = listDate.get(i).getString("THUMNAIL"); // 图片
				array[4] = listDate.get(i).getString("PUB_TIME"); // 发布时间
				array[5] = listDate.get(i).getString("PUB_LINK"); // 链接
				array[6] = listDate.get(i).getString("DESCRIPTION"); // 描述
				array[7] = listDate.get(i).getString("PUB_TYPE"); // 描述
				array[8] = listDate.get(i).getString("JOB"); // 描述
				fieldList.add(array);
			}
		}
		root.put("fieldList" + TYPE, fieldList);
		root.put("totalPage" + TYPE, page.getTotalPage());
		root.put("totalResult" + TYPE, page.getTotalResult());
		root.put("currentPage" + TYPE, page.getCurrentPage());
		root.put("page", page);
	}

	/**
	 * 网站基本信息
	 * 
	 * @param root
	 * @throws Exception
	 */
	public void getInfo(Map<String, Object> root) throws Exception {
		PageData pdInfo = new PageData();
		pdInfo.put("INFORMATION_ID", "1");
		pdInfo = informationService.findById(pdInfo);
		root.put("NAME", pdInfo.getString("NAME")); // 网站名称
		root.put("TITLE", pdInfo.getString("TITLE")); // 网站标题
		root.put("KEYWORDS", pdInfo.getString("KEYWORDS")); // 网站关键词
		root.put("DESCRIPTION", pdInfo.getString("DESCRIPTION")); // 网站描述
		root.put("LOGO", pdInfo.getString("LOGO")); // LOGO
		root.put("TEL", pdInfo.getString("TEL")); // 电话
		root.put("EMAIL", pdInfo.getString("EMAIL")); // 邮箱
		root.put("QQ", pdInfo.getString("QQ")); // QQ
		root.put("FAX", pdInfo.getString("FAX")); // 传真
		root.put("WEBURL", pdInfo.getString("WEBURL")); // 官网
		root.put("ADDRESS", pdInfo.getString("ADDRESS")); // 地址
		root.put("COPYRIGHT", pdInfo.getString("COPYRIGHT")); // 版权
		root.put("TECHNOLOGY", pdInfo.getString("TECHNOLOGY")); // 技术支持
		root.put("BEIAN", pdInfo.getString("BEIAN")); // 备案
		root.put("ABOUTUS1", pdInfo.getString("ABOUTUS1")); // 关于我们上
		root.put("ABOUTUS2", pdInfo.getString("ABOUTUS2")); // 关于我们下
		root.put("NEW1", pdInfo.getString("NEW1")); // 最新消息1
		root.put("NEW2", pdInfo.getString("NEW2"));
		root.put("BACK_IMGS", pdInfo.getString("BACK_IMGS")); // 网站登陆背景图
	}

	/**
	 * 获取路径
	 */
	public String getFtlPath() {
		return Tools.readTxtFile(Const.FTLPATH);
	}

}
