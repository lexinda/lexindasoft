package com.lexindasoftservice.model;

import java.io.Serializable;  
import java.util.Collection;  
import java.util.Collections;  
import java.util.Comparator;  
import java.util.Set;  
import java.util.SortedSet;  
import java.util.TreeSet;  
  
import org.springframework.security.core.CredentialsContainer;  
import org.springframework.security.core.GrantedAuthority;  
import org.springframework.security.core.userdetails.UserDetails;  
import org.springframework.util.Assert;  
  
//不可变类  
public class UserInfo implements UserDetails, CredentialsContainer {  
  
 private static final long serialVersionUID = 5997839307263494359L;  
  
 // ~ Instance fields  
 // ================================================================================================  
 private String password;  
  
 private String name;// 用户的中文姓名  
  
 private String email;// 用户的邮箱地址  
  
 private final String username;  
  
 private Collection<? extends GrantedAuthority> authorities;   
  
 private final boolean accountNonExpired;  
  
 private final boolean accountNonLocked;  
  
 private final boolean credentialsNonExpired;  
  
 private final boolean enabled;  
  
 // ~ Constructors  
 // ===================================================================================================  
 public UserInfo(String password, String name, String email,  
   final String username,  
   final Collection<? extends GrantedAuthority> authorities,  
   final boolean accountNonExpired, final boolean accountNonLocked,  
   final boolean credentialsNonExpired, final boolean enabled) {  
  if (username == null || "".equals(username) || password == null)  
   throw new IllegalArgumentException(  
     "Cannot pass null or empty values to constructor");  
  this.password = password;  
  this.name = name;  
  this.email = email;  
  this.username = username;  
  this.accountNonExpired = accountNonExpired;  
  this.accountNonLocked = accountNonLocked;  
  this.credentialsNonExpired = credentialsNonExpired;  
  this.enabled = enabled;  
  this.authorities = Collections  
    .unmodifiableSet(sortAuthorities(authorities));  
 }  
  
 // ~ Methods  
 // ========================================================================================================  
 	public void setAuthorities(
			Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}  
  
 public String getPassword() {  
  return password;  
 }  
  
 public String getUsername() {  
  return username;  
 }  
  
 public String getEmail() {  
  return email;  
 }  
  
 public String getName() {  
  return name;  
 }  
  
 public boolean isAccountNonExpired() {  
  return accountNonExpired;  
 }  
  
 public boolean isAccountNonLocked() {  
  return accountNonLocked;  
 }  
  
 public boolean isCredentialsNonExpired() {  
  return credentialsNonExpired;  
 }  
  
 public boolean isEnabled() {  
  return enabled;  
 }  
  
 public void eraseCredentials() {  
  password = null;  
 }  
  
 private static SortedSet<GrantedAuthority> sortAuthorities(  
   Collection<? extends GrantedAuthority> authorities) {  
  Assert.notNull(authorities,  
    "Cannot pass a null GrantedAuthority collection");  
  // Ensure array iteration order is predictable (as per  
  // UserDetails.getAuthorities() contract and SEC-717)  
  SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<GrantedAuthority>(  
    new AuthorityComparator());  
  
  for (GrantedAuthority grantedAuthority : authorities) {  
   Assert.notNull(grantedAuthority,  
     "GrantedAuthority list cannot contain any null elements");  
   sortedAuthorities.add(grantedAuthority);  
  }  
  
  return sortedAuthorities;  
 }  
  
 private static class AuthorityComparator implements  
   Comparator<GrantedAuthority>, Serializable {  
  public int compare(GrantedAuthority g1, GrantedAuthority g2) {  
   // Neither should ever be null as each entry is checked before  
   // adding it to the set.  
   // If the authority is null, it is a custom authority and should  
   // precede others.  
   if (g2.getAuthority() == null) {  
    return -1;  
   }  
  
   if (g1.getAuthority() == null) {  
    return 1;  
   }  
  
   return g1.getAuthority().compareTo(g2.getAuthority());  
  }  
 }  
  
 @Override  
 public boolean equals(Object rhs) {  
  if (rhs instanceof UserInfo)  
   return username.equals(((UserInfo) rhs).username);  
  return false;  
 }  
  
 @Override  
 public int hashCode() {  
  return username.hashCode();  
 }  
  
 @Override  
 public String toString() {  
  StringBuilder sb = new StringBuilder();  
  sb.append(super.toString()).append(": ");  
  sb.append("Username: ").append(this.username).append("; ");  
  sb.append("Password: [PROTECTED]; ");  
  sb.append("Enabled: ").append(this.enabled).append("; ");  
  sb.append("AccountNonExpired: ").append(this.accountNonExpired).append(  
    "; ");  
  sb.append("credentialsNonExpired: ").append(this.credentialsNonExpired)  
    .append("; ");  
  sb.append("AccountNonLocked: ").append(this.accountNonLocked).append(  
    "; ");  
  
  if (!authorities.isEmpty()) {  
   sb.append("Granted Authorities: ");  
  
   boolean first = true;  
   for (GrantedAuthority auth : authorities) {  
    if (!first) {  
     sb.append(",");  
    }  
    first = false;  
  
    sb.append(auth);  
   }  
  } else {  
   sb.append("Not granted any authorities");  
  }  
  return sb.toString();  
 }  
}  