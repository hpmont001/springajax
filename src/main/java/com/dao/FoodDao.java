package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.domain.Food;

public interface FoodDao {

	public List<Food> getAll(@Param("startPos") int startPos,
			@Param("pageSize") int pageSize);

	public int getSize();

	public Food getById(@Param("id") int id);
}
