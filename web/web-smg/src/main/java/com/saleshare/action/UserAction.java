package com.saleshare.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.saleshare.commons.BusinessException;
import com.saleshare.commons.EncryptUtils;
import com.saleshare.commons.http.Result;
import com.saleshare.model.UserEntity;
import com.saleshare.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends BasicAction{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("index")
	public String index(){
		return "user/index";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST )
	@ResponseBody
	public Result register(HttpServletRequest req,UserInfo user){
		Result result = new Result();
		if(userService.isUserExist(user.getUser_name())){
			throw new BusinessException(getMessage(req, "user.register.exception.exist"));
		}
		UserEntity userEntity = new UserEntity();
		userEntity.setOrgCode("-1");
		userEntity.setUserName(user.getUser_name());
		userEntity.setPassword(EncryptUtils.digestWithMD5(user.getPassword()));
		userService.register(userEntity);
		return result;
	}
	
	public static class UserInfo {
		
		private String user_name;
		
		private String password;
		
		private String password_confirm;

		public String getUser_name() {
			return user_name;
		}

		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getPassword_confirm() {
			return password_confirm;
		}

		public void setPassword_confirm(String password_confirm) {
			this.password_confirm = password_confirm;
		}
		
	}
	
}
