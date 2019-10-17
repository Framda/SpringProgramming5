package com.mycompany.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Ch09Dao4 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Dao4.class);
	
	public void insert() {
		log.info("I love NULL");
	}
}
