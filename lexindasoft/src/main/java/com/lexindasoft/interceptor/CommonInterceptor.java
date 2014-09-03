package com.lexindasoft.interceptor;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.log4j.Logger;  
import org.springframework.web.servlet.HandlerInterceptor;  
import org.springframework.web.servlet.ModelAndView;  

import com.lexindasoft.utils.UserUtils;
  
public class CommonInterceptor implements HandlerInterceptor {  
  
    private Logger log = Logger.getLogger(CommonInterceptor.class);  
      
    public CommonInterceptor() {  
        // TODO Auto-generated constructor stub  
    }  
  
    private String mappingURL;//��������ӳ�䵽��Ҫ���ص�·��    
        public void setMappingURL(String mappingURL) {    
               this.mappingURL = mappingURL;    
       }   
  
    public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception {  
        // TODO Auto-generated method stub  
        log.info("============step 1================"); 
        int id = UserUtils.getId(request);
        String url=request.getRequestURL().toString();
        if(url.contains("login")){
        	return true;
        }else{
        	if(id>0){
	        	return true;
	        }else{    
	            request.getRequestDispatcher("/views/login.jsp").forward(request, response);  
	            return false;   
	        }
        }
    }  
  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {  
        // TODO Auto-generated method stub  
    	log.info("============step 2================"); 
    }  
  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
        // TODO Auto-generated method stub  
    	log.info("============step 3================");   
    }  
  
}  