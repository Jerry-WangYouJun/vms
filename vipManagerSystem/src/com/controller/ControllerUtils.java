package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerUtils {
	
  @RequestMapping("/init/{viewName}")
  public String initView(@PathVariable String viewName){
	  return  viewName ;
  }
}
