package com.mycompany.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.Ch09Dao2;

@Service
public class Ch09Service2 {
	private static final Logger log = LoggerFactory.getLogger(Ch09Service2.class);

	@Autowired
	private Ch09Dao2 ch09Dao2;
	
	
	public void method2() {
		log.info("method2 Run");
		ch09Dao2.insert();
	}
}