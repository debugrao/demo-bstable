package com.xe.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.model.AuthUser;
import com.xe.demo.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/queryPage")
	public PageAjax<AuthUser> queryPage(){
		return userService.findPage("UserMapper.queryPage", null);
	}

	@ResponseBody
	@RequestMapping("/addUser")
	public AjaxResult addUser(AuthUser user){
		return userService.save("UserMapper.addUser", null);
	}
	
	@ResponseBody
	@RequestMapping("/delUser")
	public AjaxResult delUser(Integer[] ids){
		return userService.batchDelete("UserMapper.delUsers", ids);
	}
	
	@ResponseBody
	@RequestMapping("/updateUser")
	public AjaxResult updateUser(AuthUser user){
		return userService.update("UserMapper.updateUser", null);
	}

}
