package com.lexindasoft.job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;


/**
 * @Description: quartz��ʱ������
 * @version V1.0
 */
public class Task {

	private Logger logger = Logger.getLogger(Task.class);

	private void updatePerseveranceData() {
		
		logger.info("job doing----------------");
	}
	
	// ��ʱ��ִ�е����
	public void work() {
		logger.debug("Begin:quartz at " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//���µ���¼����
		updatePerseveranceData();
		
		logger.debug("End:quartz at " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}
}
