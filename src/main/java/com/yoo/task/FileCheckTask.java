package com.yoo.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yoo.domain.BoardAttachVO;
import com.yoo.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Setter(onMethod_ = { @Autowired })
	private BoardAttachMapper attachMapper;

	private String getFolderTodayDay() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE, 0);

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}

	//caf24에서 Task 접근 권한 문제가 있음
	//@Scheduled(cron = "9 9 9 9 9 9")
	public void checkFiles() throws Exception {

		log.warn("File Check Task run.................");
		log.warn(new Date());
		// file list in database
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();

		// ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream()
				//.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.map(vo -> Paths.get("/dbwjdghman/tomcat/webapps/", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName()))
				.collect(Collectors.toList());

		// image file has thumnail file
		fileList.stream().filter(vo -> vo.isFileType() == true)
				//.map(vo -> Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.map(vo -> Paths.get("/dbwjdghman/tomcat/webapps/", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));

		log.warn("===========================================");

		fileListPaths.forEach(p -> log.warn(p));

		// files in yesterday directory
		//File targetDir = Paths.get("C:\\upload", getFolderTodayDay()).toFile();
		File targetDir = Paths.get("/dbwjdghman/tomcat/webapps/", getFolderTodayDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

		log.warn("-----------------------------------------");
		for (File file : removeFiles) {

			log.warn(file.getAbsolutePath());

			file.delete(); 

		}
	}
	  
}
