package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.domain.Food;
import com.service.FoodService;
import com.util.Page;

@Controller
public class FoodController {

	@Resource
	private FoodService foodService;

	@RequestMapping("/")
	public String welcome() {
		return "welcome";
	}

//	@RequestMapping("display")
//	public String dispaly() {
//		return "display";
//	}

	@RequestMapping("/get")
	@ResponseBody
	public Map<String, Object> getAll(HttpServletRequest request) {

		Map<String, Object> map = new HashMap<>();
		String pageNow = request.getParameter("pn");
		int pn = 1;
		if (pageNow != "" & pageNow != null) {
			pn = new Integer(pageNow);
		}

		int size = foodService.getSize();
		Page page = new Page(size, pn);
		List<Food> foods = foodService.getAll(page.getStartPos(),
				page.getPageSize());
		map.put("page", page);
		map.put("foods", foods);
		return map;
	}

	@RequestMapping("/getById")
	@ResponseBody
	public Food getById(int id) {
		Food food = foodService.getById(id);
		return food;
	}

}
