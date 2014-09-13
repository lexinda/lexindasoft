package com.lexindasoftservice.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lexindasoftservice.dao.AdminDao;
import com.lexindasoftservice.model.Admin;
import com.lexindasoftservice.model.UserInfo;
  
/** 
 * 实现SpringSecurity的UserDetailsService接口,实现获取用户Detail信息的回调函数. 
 * 
 * @author calvin 
 */  
@Transactional(readOnly = true)
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {  
  
	private final Log logger = LogFactory.getLog(getClass());
	
	 @Autowired
	 AdminDao adminDao;
	  
	 /** 
	  * 获取用户Details信息的回调函数. 
	  */  
	 public UserDetails loadUserByUsername(String username)  
	   throws UsernameNotFoundException, DataAccessException {  
	  Admin admin = adminDao.getAdminByUserName(username);
	  
	  if (admin == null) {  
	   throw new UsernameNotFoundException("用户" + username + " 不存在");  
	  }  
	  
	  logger.info(admin.toString());
	  
	  Collection<GrantedAuthority> grantedAuths = obtainGrantedAuthorities(admin);  
	  
	  // -- mini-web示例中无以下属性, 暂时全部设为true. --//  
	  boolean enabled = true;  
	  boolean accountNonExpired = true;  
	  boolean credentialsNonExpired = true;  
	  boolean accountNonLocked = true;  
	  
	  UserInfo userdetails = new UserInfo(admin.getPassword(), admin.getName(),  
			  admin.getEmail(), admin.getUsername(), grantedAuths,  
	    accountNonExpired, accountNonLocked, credentialsNonExpired,  
	    enabled);  
	  
	  logger.info(userdetails.toString());
	  
	  return userdetails;  
	 }  
	  
	 /** 
	  * 获得用户所有角色的权限集合. 
	  */  
	 private Collection<GrantedAuthority> obtainGrantedAuthorities(Admin admin) {  
	  Collection<GrantedAuthority> gaRoles = new HashSet<GrantedAuthority>();
	  gaRoles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
	  return gaRoles;  
	 }  
  
}  
