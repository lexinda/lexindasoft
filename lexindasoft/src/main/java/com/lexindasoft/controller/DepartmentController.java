package com.lexindasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lexindasoftservice.model.Department;
import com.lexindasoftservice.service.DepartmentService;

@Controller
@RequestMapping(value="/department")
public class DepartmentController {

	final static int PAGE_NUM=20;
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value="/manage",method = RequestMethod.GET)
	public ModelAndView departmentManage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-manage");
		return mav;
	}
	
	@RequestMapping(value="/data",method = RequestMethod.POST)
	public void departmentData(HttpServletResponse resp,@RequestParam("id") int id){
		Department department = new Department();
		department.setId(id);
		List<Department> departmentList = departmentService.getDepartmentInfo(department);
		for(Department departments:departmentList){
			department.setId(departments.getId());
			List<Department> childDepartment = departmentService.hasChildDepartmentInfo(departments);
			if(childDepartment.size()>0){
				departments.setState("closed");
			}else{
				departments.setState("open");
			}
			
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new Gson();
		String data=null;
		if(id==1){
			resultMap.put("total", departmentList.size());
			resultMap.put("rows", departmentList);
			data = gson.toJson(resultMap);
		}else{
			data = gson.toJson(departmentList);
		}
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(data);
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public ModelAndView departmentAdd(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-add");
		return mav;
	}
	
	@RequestMapping()
	public ModelAndView departmentAdmin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("department/department-admin");
		return mav;
	}
	
	@RequestMapping(value="/doadd",method = RequestMethod.POST)
	public void departmentDoAdd(HttpServletResponse resp){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("statusCode", 200);
		jsonMap.put("message", "新增成功!");
		jsonMap.put("navTabId","user");
		jsonMap.put("rel","");
		jsonMap.put("callbackType","closeCurrent");
		jsonMap.put("forwardUrl","");
		jsonMap.put("confirmMsg","");
		Gson gson = new Gson();
        
        String list1 = gson.toJson(jsonMap);
        resp.setContentType("application/Json");
        resp.setCharacterEncoding("UTF-8");  
        resp.setHeader("Cache-Control", "no-cache"); 
        PrintWriter out;
        try { 
            out = resp.getWriter();  
            out.print(list1);
            // 用于返回对象参数 
       } catch (IOException e) {  
            e.printStackTrace();  
       }
	}
	
	@RequestMapping(value="/find",method = RequestMethod.GET)
	public ModelAndView departmentFind(){
		ModelAndView mav = new ModelAndView();
		List<Integer> levelList = departmentService.getDepartmentLevel();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Department> departmentList = getList(0,0);
		if(departmentList.size()>0){
			for(Department department : departmentList){
				resultMap.put("id", department.getId());
				resultMap.put("districtName", department.getDepartmentName());
				resultMap.put("levelId", department.getLevelId());
				List<Department> departmentListOne = getList(department.getId(),1);
				List<Map<String,Object>> oneList = new ArrayList<Map<String,Object>>();
				if(departmentListOne.size()>0){
					for(Department departmentOne : departmentListOne){
						Map<String,Object> one = new HashMap<String,Object>();
						one.put("id", departmentOne.getId());
						one.put("districtName", departmentOne.getDepartmentName());
						one.put("levelId", departmentOne.getLevelId());
						oneList.add(one);
						List<Department> departmentListTwo = getList(departmentOne.getId(),2);
						List<Map<String,Object>> twoList = new ArrayList<Map<String,Object>>();
						if(departmentListTwo.size()>0){
							for(Department departmentTwo : departmentListTwo){
								Map<String,Object> two = new HashMap<String,Object>();
								two.put("id", departmentTwo.getId());
								two.put("districtName", departmentTwo.getDepartmentName());
								two.put("levelId", departmentTwo.getLevelId());
								twoList.add(two);
								List<Department> departmentListThree = getList(departmentTwo.getId(),3);
								List<Map<String,Object>> threeList = new ArrayList<Map<String,Object>>();
								if(departmentListThree.size()>0){
									for(Department departmentThree : departmentListThree){
										Map<String,Object> three = new HashMap<String,Object>();
										three.put("id", departmentThree.getId());
										three.put("districtName", departmentThree.getDepartmentName());
										three.put("levelId", departmentThree.getLevelId());
										threeList.add(three);
										List<Department> departmentListFour = getList(departmentThree.getId(),4);
										List<Map<String,Object>> fourList = new ArrayList<Map<String,Object>>();
										if(departmentListFour.size()>0){
											for(Department departmentFour : departmentListFour){
												Map<String,Object> four = new HashMap<String,Object>();
												four.put("id", departmentFour.getId());
												four.put("districtName", departmentFour.getDepartmentName());
												four.put("levelId", departmentFour.getLevelId());
												fourList.add(four);
												List<Department> departmentListFive = getList(departmentFour.getId(),5);
												List<Map<String,Object>> fiveList = new ArrayList<Map<String,Object>>();
												if(departmentListFive.size()>0){
													for(Department departmentFive : departmentListFive){
														Map<String,Object> five = new HashMap<String,Object>();
														four.put("id", departmentFive.getId());
														four.put("districtName", departmentFive.getDepartmentName());
														four.put("levelId", departmentFive.getLevelId());
														fiveList.add(five);
														List<Department> departmentListSix = getList(departmentFive.getId(),6);
														List<Map<String,Object>> sixList = new ArrayList<Map<String,Object>>();
														if(departmentListSix.size()>0){
															for(Department departmentSix : departmentListSix){
																Map<String,Object> six = new HashMap<String,Object>();
																six.put("id", departmentSix.getId());
																six.put("districtName", departmentSix.getDepartmentName());
																six.put("levelId", departmentSix.getLevelId());
																sixList.add(six);
																List<Department> departmentListSeven = getList(departmentSix.getId(),7);
																List<Map<String,Object>> sevenList = new ArrayList<Map<String,Object>>();
																if(departmentListSeven.size()>0){
																	for(Department departmentSeven : departmentListSeven){
																		Map<String,Object> seven = new HashMap<String,Object>();
																		seven.put("id", departmentSeven.getId());
																		seven.put("districtName", departmentSeven.getDepartmentName());
																		seven.put("levelId", departmentSeven.getLevelId());
																		sevenList.add(seven);
																		List<Department> departmentListEight = getList(departmentSeven.getId(),8);
																		List<Map<String,Object>> eightList = new ArrayList<Map<String,Object>>();
																		if(departmentListEight.size()>0){
																			for(Department departmentEight : departmentListEight){
																				Map<String,Object> eight = new HashMap<String,Object>();
																				eight.put("id", departmentEight.getId());
																				eight.put("districtName", departmentEight.getDepartmentName());
																				eight.put("levelId", departmentEight.getLevelId());
																				eightList.add(eight);
																				List<Department> departmentListNine = getList(departmentEight.getId(),9);
																				List<Map<String,Object>> nineList = new ArrayList<Map<String,Object>>();
																				if(departmentListNine.size()>0){
																					for(Department departmentNine : departmentListNine){
																						Map<String,Object> nine = new HashMap<String,Object>();
																						nine.put("id", departmentNine.getId());
																						nine.put("districtName", departmentNine.getDepartmentName());
																						nine.put("levelId", departmentNine.getLevelId());
																						nineList.add(nine);
																						List<Department> departmentListTen = getList(departmentNine.getId(),10);
																						List<Map<String,Object>> tenList = new ArrayList<Map<String,Object>>();
																						if(departmentListTen.size()>0){
																							for(Department departmentTen : departmentListTen){
																								Map<String,Object> ten = new HashMap<String,Object>();
																								ten.put("id", departmentTen.getId());
																								ten.put("districtName", departmentTen.getDepartmentName());
																								ten.put("levelId", departmentTen.getLevelId());
																								tenList.add(ten);
																								//List<Department> infoListThree = getList(departmentTwo.getId(),levelId++);
																							}
																							nine.put("tenList", tenList);
																						}
																					}
																					eight.put("nineList", nineList);
																				}
																			}
																			seven.put("eightList", eightList);
																		}
																	}
																	six.put("sevenList", sevenList);
																}
															}
															five.put("sixList", sixList);
														}
													}
													four.put("fiveList", fiveList);
												}
											}
											three.put("fourList", fourList);
										}
									}
									two.put("threeList", threeList);
								}
							}
							one.put("twoList", twoList);
						}
					}
					resultMap.put("oneList", oneList);
				}
			}
		}
		System.out.println(resultMap.toString());
		mav.addObject("levelList", levelList.size());
		mav.addObject("resultMap", resultMap);
		mav.setViewName("department/department-find");
		return mav;
	}
	
	public List<Department> getList(int id,int levelId){
		Department department = new Department();
		department.setId(id);
		department.setLevelId(levelId);
		List<Department> departmentLists = departmentService.getDepartmentInfo(department);
		return departmentLists;
		
	}
	
}
