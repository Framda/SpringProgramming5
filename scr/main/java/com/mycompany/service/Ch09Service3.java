package com.mycompany.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.Ch09Dao3;

@Service
public class Ch09Service3 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Service3.class);

	@Autowired
	private Ch09Dao3 ch09Dao3;
	
	
	public void method3() {
		log.info("method3 Run");
		ch09Dao3.insert();
	}
}