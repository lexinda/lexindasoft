package com.lexindasoft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * @Description: 系统请求上下文（主要存储request及response对象）
 * @author 柯颖波
 * @date 2014-4-1 下午02:49:58
 * @version v1.0
 */
public class SysContext {
    private static ThreadLocal<HttpServletRequest> requestLocal = new ThreadLocal<HttpServletRequest>();
    private static ThreadLocal<HttpServletResponse> responseLocal = new ThreadLocal<HttpServletResponse>();
 
    /**
    * @Description: 获取HttpServletRequest对象
    * @return    设定文件
     */
    public static HttpServletRequest getRequest() {
        return (HttpServletRequest) requestLocal.get();
    }
 
    /**
    * @Description: 设置HttpServletRequest对象
    * @return    设定文件
     */
    public static void setRequest(HttpServletRequest request) {
        requestLocal.set(request);
    }
    /**
    * @Description: 获取HttpServletResponse对象
    * @return    设定文件
     */
    public static HttpServletResponse getResponse() {
        return (HttpServletResponse) responseLocal.get();
    }
    /**
    * @Description: 设置HttpServletResponse对象
    * @return    设定文件
     */
    public static void setResponse(HttpServletResponse response) {
        responseLocal.set(response);
    }
     
    /**
    * @Description: 清除配置相关变量
     */
    public static void clear() {
        requestLocal.remove();
        responseLocal.remove();
    }
}
