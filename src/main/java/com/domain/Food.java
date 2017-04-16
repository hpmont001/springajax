package com.domain;

public class Food {

	public int id;
	public String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Food [id=" + id + ", name=" + name + "]";
	}

	public Food(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Food(String name) {
		super();
		this.name = name;
	}

	public Food() {
		super();
	}

}
