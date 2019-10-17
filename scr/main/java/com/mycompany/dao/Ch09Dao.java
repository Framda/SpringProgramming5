package com.mycompany.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Ch09Dao {
	private static final Logger log = LoggerFactory.getLogger(Ch09Dao.class);
	
	public Ch09Dao() {
		log.info("Joker");
	}
	
	public void insert() {
		log.info("joaquin phoenix");
	}
}
