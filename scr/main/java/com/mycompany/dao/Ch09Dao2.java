package com.mycompany.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component("ch09Dao2")
public class Ch09Dao2 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Dao2.class);
	
	public Ch09Dao2() {
		log.info("Joker");
	}
	
	public void insert() {
		log.info("joaquin phoenix");
	}
}
