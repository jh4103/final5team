package com.oti.srm.controller.srm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oti.srm.dto.Member;
import com.oti.srm.dto.Request;
import com.oti.srm.dto.RequestProcess;
import com.oti.srm.dto.StatusHistory;
import com.oti.srm.dto.StatusHistoryFile;
import com.oti.srm.service.srm.ICommonService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DeveloperController {

	@Autowired
	ICommonService commonService;

	@GetMapping("/developerdetail")
	public String getDeveloperDetail(Model model, int rno, HttpSession session) {
		log.info("실행");

		// 요청내용 출력 -장현
		Request request = commonService.getRequest(rno);
		// 요청 프로세스 출력 -장현
		RequestProcess requestProcess = commonService.getRequestProcess(rno);
		// 개발자가 테스터로 넘길시 작성했던 내용 출력 -장현
		List<StatusHistory> devToTester = commonService.getDevToTesterHistories(rno);
		// 테스터가 개발자에게 보내는 결함내용(재검토) -장현
		List<StatusHistory> testerToDev = commonService.getTesterToDevHistories(rno);

		// 요청, 요청프로세스, 작성내용들 모달에 담기 -장현
		model.addAttribute("request", request);
		model.addAttribute("devToTester", devToTester);
		model.addAttribute("testerToDev", testerToDev);
		model.addAttribute("requestProcess", requestProcess);

		return "srm/developerdetail";
	}

	@PostMapping("/devinprogress")
	public String switchDevInProgress(StatusHistory statusHistory,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date developExpectDate, HttpSession session) {
		log.info("statusHistory: " + statusHistory);
		Member member = (Member) session.getAttribute("member");
		statusHistory.setWriter(member.getMid());
		statusHistory.setNextStatus(4);
		commonService.startWork(statusHistory, developExpectDate, member.getMtype());

		return "redirect:/developerdetail?rno=" + statusHistory.getRno();
	}

	@PostMapping("/devdone")
	public String switchDevDone(StatusHistory statusHistory, HttpSession session, MultipartFile[] files) {
		log.info("실행");
		Member member = (Member) session.getAttribute("member");
		statusHistory.setWriter(member.getMid());
		statusHistory.setNextStatus(5);
		List<StatusHistoryFile> sFiles = new ArrayList<>();
		try {
			if (files != null) {
				for (MultipartFile file : files) {
					StatusHistoryFile statusHistoryFile = new StatusHistoryFile();
					statusHistoryFile.setFileName(file.getOriginalFilename());
					statusHistoryFile.setFileType(file.getContentType());
					statusHistoryFile.setFileData(file.getBytes());
					sFiles.add(statusHistoryFile);
				}
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		statusHistory.setFileList(sFiles);
		commonService.endWork(statusHistory, member.getMtype());
		return "redirect:/developerdetail?rno=" + statusHistory.getRno();
	}
	

}
