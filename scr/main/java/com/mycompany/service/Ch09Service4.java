package com.mycompany.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.Ch09Dao4;

@Service
public class Ch09Service4 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Service4.class);
	
	@Autowired
	private Ch09Dao4 ch09Dao4;
	
	public void method4() {
		log.info("method4 Run");
		ch09Dao4.insert();
	}
}