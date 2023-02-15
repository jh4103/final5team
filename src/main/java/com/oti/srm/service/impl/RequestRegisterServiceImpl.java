package com.oti.srm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.srm.dao.IRequestDao;
import com.oti.srm.dto.Request;
import com.oti.srm.service.IRequestRegisterService;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RequestRegisterServiceImpl implements IRequestRegisterService {
	
	@Autowired
	private IRequestDao requestDao;
	
	
	@Override
	public int request(Request request) {
	log.info("가입 실행");
	System.out.println(request.toString());
	try {
		int rows = requestDao.request(request);
		return REQUEST_SUCCESS;
	} catch(Exception e) {
		log.error(e.toString());
		return REQUEST_FAIL;
	}
	}
	
	

}
