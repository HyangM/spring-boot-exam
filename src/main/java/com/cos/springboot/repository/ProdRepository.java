package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.model.Product;

public interface ProdRepository {
	// 전체보기
	List<Product> findAll();
	// 욕실용품, 음식 찾기
	List<Product> findByOneType(String type);
	// 전체 가격순 찾기
	List<Product> findPriceAllSort();
	// 전체,선택한 용품의 가격순 찾기
	List<Product> findTypePriceSort(String type);
	// 전체,선택한 용품의 주문순 찾기
	List<Product> findTypeOrderSort(String type);
}
