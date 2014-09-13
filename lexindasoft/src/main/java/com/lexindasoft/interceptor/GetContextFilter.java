package com.lexindasoft.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* @Description: 云平台割接过滤器
* @author 柯颖波
* @date 2014-4-1 下午03:04:34 
* @version v1.0
 */
public class GetContextFilter implements Filter {
 
    public void destroy() {
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        SysContext.setRequest((HttpServletRequest) request);
        SysContext.setResponse((HttpServletResponse) response);
        chain.doFilter(request, response);
    }
 
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
    }
}
