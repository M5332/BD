package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import ch.qos.logback.core.joran.spi.HttpUtil.RequestMethod;

@RestController
public class controller {
	
	@GetMapping("Shello")
	public String get()
	{
		return "hello";
	}

}
