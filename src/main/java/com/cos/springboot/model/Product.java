package com.cos.springboot.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int id;
	private String name;
	private int price;
	private int orderCount;
	private String type;
	private Timestamp createDate;
	
	@Builder
	public Product(String name, int price, int orderCount, String type, Timestamp createDate) {
		super();
		this.name = name;
		this.price = price;
		this.orderCount = orderCount;
		this.type = type;
		this.createDate = createDate;
	}
	
}
