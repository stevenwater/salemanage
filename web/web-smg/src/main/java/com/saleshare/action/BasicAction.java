package com.saleshare.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.support.RequestContext;

public class BasicAction {
	
	private Logger logger;
	
	private RequestContext requestContext;
	
	public Logger getLogger(){
		if(logger == null){
			logger = Logger.getLogger(getClass());
		}
		return logger;
	}
	
	/**
	 * 
	 * @param req
	 * @param code
	 * @return
	 */
	public String getMessage(HttpServletRequest req,String code){
		if(requestContext == null){
			requestContext = new RequestContext(req);
		}
		return requestContext.getMessage(code);
	}

}
