package com.lexindasoft.interceptor;

import java.lang.reflect.Method;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;

import com.lexindasoftservice.model.Log;
import com.lexindasoftservice.service.LogService;
  
/** 
 * 日志记录，添加、删除、修改方法AOP 
 * @author HotStrong 
 *  
 */  
@Aspect  
public class LogAspect {  
      
    @Autowired  
    private LogService logService;//日志记录Service  
      
    /** 
     * 添加访问页面切入点 
     */  
    @Pointcut("execution(* com.lexindasoftservice.service.*.getDepartmentInfo*(..))")  
    public void manageServiceCall() { } 
    
    /** 
     * 添加业务逻辑方法切入点 
     */  
    @Pointcut("execution(* com.xxx.service.*.insert*(..))")  
    public void insertServiceCall() { }  
      
    /** 
     * 修改业务逻辑方法切入点 
     */  
    @Pointcut("execution(* com.xxx.service.*.update*(..))")  
    public void updateServiceCall() { }  
      
    /** 
     * 删除影片业务逻辑方法切入点 
     */  
    @Pointcut("execution(* com.xxx.service.*.delete(..))")  
    public void deleteServiceCall() { }  
    
    /** 
     * 访问页面日志(后置通知) 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */  
    @AfterReturning(value="manageServiceCall()", argNames="rtv", returning="rtv")  
    public void manageServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable{  
          
        //获取登录管理员id  
        int adminUserId = logService.loginUserId();  
          
        if(adminUserId == 0){//没有管理员登录  
            return;  
        }  
          
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
          
        //获取方法名  
        String methodName = joinPoint.getSignature().getName();  
          
        //获取操作内容  
        String opContent = adminOptionContent(joinPoint.getArgs(), methodName);  
          
        //创建日志对象  
        Log log = new Log();  
        log.setUserid(logService.loginUserId());//设置管理员id  
        log.setCreatedate(new Date());//操作时间  
        log.setContent(opContent);//操作内容  
        //1:添加，2.更新，3.删除
        log.setOperation(1);//操作  
          
        logService.log(log);//添加日志  
    }  
    
    /** 
     * 管理员添加操作日志(后置通知) 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */  
    @AfterReturning(value="insertServiceCall()", argNames="rtv", returning="rtv")  
    public void insertServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable{  
          
        //获取登录管理员id  
        int adminUserId = logService.loginUserId();  
          
        if(adminUserId == 0){//没有管理员登录  
            return;  
        }  
          
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
          
        //获取方法名  
        String methodName = joinPoint.getSignature().getName();  
          
        //获取操作内容  
        String opContent = adminOptionContent(joinPoint.getArgs(), methodName);  
          
        //创建日志对象  
        Log log = new Log();  
        log.setUserid(logService.loginUserId());//设置管理员id  
        log.setCreatedate(new Date());//操作时间  
        log.setContent(opContent);//操作内容  
        //1:添加，2.更新，3.删除
        log.setOperation(1);//操作  
          
        logService.log(log);//添加日志  
    }  
      
     /** 
     * 管理员修改操作日志(后置通知) 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */  
    @AfterReturning(value="updateServiceCall()", argNames="rtv", returning="rtv")  
    public void updateServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable{  
          
        //获取登录管理员id  
        int adminUserId = logService.loginUserId();  
          
        if(adminUserId == 0){//没有管理员登录  
            return;  
        }  
          
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
          
        //获取方法名  
        String methodName = joinPoint.getSignature().getName();  
          
        //获取操作内容  
        String opContent = adminOptionContent(joinPoint.getArgs(), methodName);  
          
        //创建日志对象  
        Log log = new Log();  
        log.setUserid(logService.loginUserId());//设置管理员id  
        log.setCreatedate(new Date());//操作时间  
        log.setContent(opContent);//操作内容  
        log.setOperation(2);//操作  
          
        logService.log(log);//添加日志  
    }  
      
    /** 
     * 管理员删除影片操作(环绕通知)，使用环绕通知的目的是 
     * 在影片被删除前可以先查询出影片信息用于日志记录 
     * @param joinPoint 
     * @param rtv 
     * @throws Throwable 
     */  
    @AfterReturning(value="deleteServiceCall()", argNames="rtv", returning="rtv")
    public void deleteServiceCallCalls(JoinPoint joinPoint, Object rtv) throws Throwable {  
    	//获取登录管理员id  
        int adminUserId = logService.loginUserId();  
          
        if(adminUserId == 0){//没有管理员登录  
            return;  
        }  
          
        //判断参数  
        if(joinPoint.getArgs() == null){//没有参数  
            return;  
        }  
          
        //获取方法名  
        String methodName = joinPoint.getSignature().getName();  
          
        //获取操作内容  
        String opContent = adminOptionContent(joinPoint.getArgs(), methodName);  
    	//创建日志对象  
        Log log = new Log();  
        log.setUserid(logService.loginUserId());//用户编号  
        log.setCreatedate(new Date());//操作时间  
          
        log.setContent(opContent);//操作内容  
          
        log.setOperation(3);//操作  
          
        logService.log(log);//添加日志         
              
    }  
      
    @Around("execution(* org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter.handle(..))")  
    public Object aa(ProceedingJoinPoint pjp)  throws Throwable   
    {  
        try {  
            Object retVal = pjp.proceed();  
            System.out.println(retVal);  
            return retVal;  
        } catch (Exception e) {  
            System.out.println("异常");  
            return null;  
        }  
    }  
    
    /** 
     * 使用Java反射来获取被拦截方法(insert、update)的参数值， 
     * 将参数值拼接为操作内容 
     */  
    public String adminOptionContent(Object[] args, String mName) throws Exception{  
  
        if (args == null) {  
            return null;  
        }  
          
        StringBuffer rs = new StringBuffer();  
        rs.append(mName);  
        String className = null;  
        int index = 1;  
        // 遍历参数对象  
        for (Object info : args) {  
              
            //获取对象类型  
            className = info.getClass().getName();  
            className = className.substring(className.lastIndexOf(".") + 1);  
            rs.append("[参数" + index + "，类型：" + className + "，值：");  
              
            // 获取对象的所有方法  
            Method[] methods = info.getClass().getDeclaredMethods();  
              
            // 遍历方法，判断get方法  
            for (Method method : methods) {  
                  
                String methodName = method.getName();  
                // 判断是不是get方法  
                if (methodName.indexOf("get") == -1) {// 不是get方法  
                    continue;// 不处理  
                }  
                  
                Object rsValue = null;  
                try {  
                      
                    // 调用get方法，获取返回值  
                    rsValue = method.invoke(info);  
                      
                    if (rsValue == null) {//没有返回值  
                        continue;  
                    }  
                      
                } catch (Exception e) {  
                    continue;  
                }  
                  
                //将值加入内容中  
                rs.append("(" + methodName + " : " + rsValue + ")");  
            }  
              
            rs.append("]");  
              
            index++;  
        }  
          
        return rs.toString();  
    }  
      
}  
