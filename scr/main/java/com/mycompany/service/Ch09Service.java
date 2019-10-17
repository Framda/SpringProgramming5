package com.mycompany.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.Ch09Dao;

@Service
public class Ch09Service {
	private static final Logger log = LoggerFactory.getLogger(Ch09Service.class);
	
	@Autowired
	private Ch09Dao ch09Dao;
	
	
	public void method1() {
		log.info("Joker");
		ch09Dao.insert();
	}
}
