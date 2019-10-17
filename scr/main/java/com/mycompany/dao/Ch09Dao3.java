package com.mycompany.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component("ch09Dao3")
public class Ch09Dao3 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Dao3.class);
	
	public Ch09Dao3() {
		log.info("Dao3 Construct");
	}
	
	public void insert() {
		log.info("3rd Start");
	}
}
