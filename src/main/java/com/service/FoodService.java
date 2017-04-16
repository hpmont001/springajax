package com.service;

import java.util.List;

import com.domain.Food;

public interface FoodService {

	public List<Food> getAll(int size, int pn);
	
	public int getSize();

	public Food getById(int id);
}
