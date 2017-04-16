package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.FoodDao;
import com.domain.Food;
import com.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {

	@Resource
	private FoodDao foodDao;

	@Override
	public int getSize() {
		return foodDao.getSize();
	}

	@Override
	public List<Food> getAll(int startPos, int pageSize) {
		return foodDao.getAll(startPos, pageSize);
	}

	@Override
	public Food getById(int id) {
		return foodDao.getById(id);
	}

}
