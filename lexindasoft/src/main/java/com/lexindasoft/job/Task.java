package com.lexindasoft.job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;


/**
 * @Description: quartz定时任务类
 * @version V1.0
 */
public class Task {

	private Logger logger = Logger.getLogger(Task.class);

	private void updatePerseveranceData() {
		
		logger.info("job doing----------------");
	}
	
	// 定时器执行的入口
	public void work() {
		logger.debug("Begin:quartz at " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//更新单日录音榜
		updatePerseveranceData();
		
		logger.debug("End:quartz at " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}
}
