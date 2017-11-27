package com.saleshare.service;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.saleshare.commons.service.BasicService;
import com.saleshare.model.UserEntity;

@Service
public class UserService extends BasicService<UserEntity> {

	public boolean isLogin(String userName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class, RuntimeException.class })
	public void register(UserEntity user) {
		if(user != null){
			save(user);
		}
	}
	
	/**
	 * 判断用户是否存在
	 * @param userName
	 * @return
	 */
	@Transactional(readOnly=true)
	public boolean isUserExist(String userName){
		if(!StringUtils.isEmpty(userName)){
			String hql = "from UserEntity user where user.userName = :userName ";
			Query query =getSession().createQuery(hql);
			query.setParameter("userName", userName);
			if(query.list().size() == 0){
				return false;
			}
		}
		return true;
	}

}
