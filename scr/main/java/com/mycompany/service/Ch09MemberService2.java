package com.mycompany.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("ch09MemberService")
public class Ch09MemberService2 implements Ch09MemberService {
	private static final Logger log = LoggerFactory.getLogger(Ch09MemberService2.class);
	
	@Override
	public void join() {
		log.info("join method");	
	}
	@Override
	public void login() {
		log.info("login method");
	}
}
