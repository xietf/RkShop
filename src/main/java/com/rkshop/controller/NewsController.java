package com.rkshop.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.News;
import com.rkshop.entity.NewsCatalog;
import com.rkshop.service.NewsCatalogService;
import com.rkshop.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController{
	
	@Autowired
	private NewsService newsService;
	@Autowired
	private NewsCatalogService newsCatalogService;
	
	@RequestMapping("/list")
	public String listByPage(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			News record, String admin, ModelMap modelmap) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<News> list = newsService.select(record);
		PageInfo<News> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);
		
		if(admin!=null) {
			return "/WEB-INF/page/admin/joint/new/newsList";
		}else if(record.getId()!=null) {
			return "/page/newsInfo";
		}else {
			return "/page/news2";
		}
	}
	
	@RequestMapping("/toinsert")
	public String toinsert(News record, ModelMap modelmap) {
		NewsCatalog newsCatalog = new NewsCatalog();
		List<NewsCatalog> list = newsCatalogService.select(newsCatalog);
		modelmap.put("list", list);
		return "/WEB-INF/page/admin/joint/new/newsAdd";
	}
	
	@RequestMapping("/insert")
	public String insert(News record, HttpSession session, @RequestParam("imgfile") MultipartFile imgfile) throws Exception {
		String filename = imgfile.getOriginalFilename();

		String fileName = record.getNewsTitle() + filename.substring(filename.lastIndexOf("."));
		String basePath = session.getServletContext().getRealPath("/public/images/");
		File baseFile = new File(basePath);
		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		String savePath = basePath + fileName;
		imgfile.transferTo(new File(savePath));

		record.setNewsImg(fileName);
		record.setAddTime(new Date());
		record.setCountClick(0);
		record.setCommentCount(0);
		int rowcount = newsService.insert(record);
		return "/WEB-INF/page/admin/index";
	}
	
	
	@RequestMapping("/update")
	public int update(News record) {
		return newsService.update(record);
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return newsService.delete(id);
	}
	
}
