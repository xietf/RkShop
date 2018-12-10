package com.rkshop.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.rkshop.service.BaseService;

public class BaseController<T> {
	
	@Autowired
	protected T baseService;
	
}
