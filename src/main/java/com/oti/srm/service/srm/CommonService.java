package com.oti.srm.service.srm;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.srm.dao.srm.ICommonDao;
import com.oti.srm.dto.Member;
import com.oti.srm.dto.Pager;
import com.oti.srm.dto.Request;
import com.oti.srm.dto.RequestProcess;
import com.oti.srm.dto.StatusHistory;
import com.oti.srm.dto.StatusHistoryFile;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class CommonService implements ICommonService {
	@Autowired
	ICommonDao commonDao;

	/*
	 * <이 메소드는 본인 맡은 업무에 맞게 서비스 메소드 따로 만들어야 함> 1. commonDao.getRequestHistories(rno)
	 * 통해 모든 단계 변경 이력을 긁어온 다음 2. 본인이 조회해야할 단계 변경 이력만 필터링
	 */
	// 개발완료 시 단계 변경 이력 가져오기
	@Override
	@Transactional
	public List<StatusHistory> getDevToTesterHistories(int rno) {
		List<StatusHistory> requestHistories = commonDao.selectRequestHistories(rno);

		List<StatusHistory> devToTesterHistories = new ArrayList<StatusHistory>();

		for (StatusHistory sh : requestHistories) {
			// 개발자 -> 테스터 단계 이력만 담기
			if (sh.getNextStatus() == 5) {
				sh.setFileList(commonDao.selectStatusHistoryFiles(sh.getHno()));
				devToTesterHistories.add(sh);
			}
		}

		return devToTesterHistories;
	}
	
	@Override
	@Transactional
	public List<StatusHistory> getUserTesterToDistributorHistories(int rno) {
		List<StatusHistory> requestHistories = commonDao.selectRequestHistories(rno);

		List<StatusHistory> UserTesterToDistributorHistories = new ArrayList<StatusHistory>();

		for (StatusHistory sh : requestHistories) {
			// 개발자 -> 테스터 단계 이력만 담기
			if (sh.getNextStatus() == 9) {
				sh.setFileList(commonDao.selectStatusHistoryFiles(sh.getHno()));
				UserTesterToDistributorHistories.add(sh);
			}
		}

		return UserTesterToDistributorHistories;
	}
	
	@Override
	public List<StatusHistory> getDistributorToPmHistories(int rno) {
		List<StatusHistory> requestHistories = commonDao.selectRequestHistories(rno);

		List<StatusHistory> distributorToPmHistories = new ArrayList<StatusHistory>();

		for (StatusHistory sh : requestHistories) {
			// 개발자 -> 테스터 단계 이력만 담기
			if (sh.getNextStatus() == 11) {
				sh.setFileList(commonDao.selectStatusHistoryFiles(sh.getHno()));
				distributorToPmHistories.add(sh);
			}
		}

		return distributorToPmHistories;
	}
	
	@Override
	public List<StatusHistory> getPmToAllHistories(int rno) {
		List<StatusHistory> requestHistories = commonDao.selectRequestHistories(rno);

		List<StatusHistory> pmToAllHistories = new ArrayList<StatusHistory>();

		for (StatusHistory sh : requestHistories) {
			// 개발자 -> 테스터 단계 이력만 담기
			if (sh.getNextStatus() == 2) {
				sh.setFileList(commonDao.selectStatusHistoryFiles(sh.getHno()));
				pmToAllHistories.add(sh);
			}
		}

		return pmToAllHistories;
	}


	// 요청정보 조회(+해당 요청에 첨부된 파일들까지)
	@Override
	@Transactional
	public Request getRequest(int rno) {
		Request request = commonDao.selectRequest(rno);
		request.setFiles(commonDao.selectRequestFiles(rno));
		return request;
	}

	// 요청 처리 정보 조회
	@Override
	public RequestProcess getRequestProcess(int rno) {
		RequestProcess requestProcess = commonDao.selectRequestProcess(rno);
		log.info(requestProcess);
		return requestProcess;
	}

	// 작업 시작
	/*
	 * 1. requests 테이블 => 현재 단계 갱신 2. request_process 테이블 => 완료 예정일(expect_date) 기입
	 * 3. status_histories 테이블 => 단계 변경 이력 추가
	 */
	@Override
	@Transactional
	public void startWork(StatusHistory statusHistory, Date expectDate, String mtype) {
		commonDao.updateRequestStatus(statusHistory.getRno(), statusHistory.getNextStatus());
		commonDao.updateExpectDate(statusHistory.getRno(), expectDate, mtype);
		commonDao.insertStatusHistory(statusHistory);
	}

	// 작업 완료 or 재검토
	/*
	 * 1. requests 테이블 => 현재 단계 갱신 2. request_process 테이블 => 완료일(comp_date) 기입 3.
	 * status_histories 테이블 => 단계 변경 이력 추가
	 */
	@Override
	@Transactional	
	public void endWork(StatusHistory statusHistory, String mtype) {
		commonDao.updateRequestStatus(statusHistory.getRno(), statusHistory.getNextStatus());
		commonDao.updateCompDate(statusHistory.getRno(), mtype);
		commonDao.insertStatusHistory(statusHistory);
		if(statusHistory.getFileList() != null && statusHistory.getFileList().size()>0) {
			for(StatusHistoryFile file :statusHistory.getFileList()) {
				file.setHno(statusHistory.getHno());
				commonDao.insertStatusHistoryFile(file);
			}
		}
	}
	
	@Override
	@Transactional
	public void reWork(StatusHistory statusHistory, String mtype) {
		commonDao.updateRequestStatus(statusHistory.getRno(), statusHistory.getNextStatus());
		commonDao.updateResetDate(statusHistory.getRno());
		commonDao.insertStatusHistory(statusHistory);
		if(statusHistory.getFileList() != null && statusHistory.getFileList().size()>0) {
			for(StatusHistoryFile file :statusHistory.getFileList()) {
				file.setHno(statusHistory.getHno());
				commonDao.insertStatusHistoryFile(file);
			}
		}
	}

//	(테스터 -> 개발자) 재검토 요청에 대한 단계 변경 이력
	@Override
	@Transactional
	public List<StatusHistory> getTesterToDevHistories(int rno) {
		List<StatusHistory> allHistories = commonDao.selectRequestHistories(rno);
		List<StatusHistory> testerToDevHistories = new ArrayList<>();
		for (StatusHistory tester : allHistories) {
			if (tester.getNextStatus() == 3) {
				tester.setFileList(commonDao.selectStatusHistoryFiles(tester.getHno()));
				testerToDevHistories.add(tester);
			}
		}

		return testerToDevHistories;
	}

	@Override
	public void uploadFile(StatusHistoryFile statusHistoryFile) {
		commonDao.insertStatusHistoryFile(statusHistoryFile);

	}

	/* 작성자: 장현
	 * 접수예정일 받는 메소드
	 */
	@Override
	public Date getReceiptDoneDate(int rno) {
		List<StatusHistory> requestHistories = commonDao.selectRequestHistories(rno);
		StatusHistory receiptDoneDate = new StatusHistory();
		
		for(StatusHistory sh : requestHistories ) {
			if(sh.getNextStatus() == 2) {
				receiptDoneDate = sh;
				break;
			}
		}
		return receiptDoneDate.getChangeDate();
	}

	/* 작성자: 장현
	 * 최신 요청 개수, 진행중인 요청 개수, 진행 완료 개수, 개발자일 경우 재검토, pm일 경우 반려건 개수 출력
	 */
	@Override
	@Transactional
	public HashMap<String,Integer> getWorkingStatus(Member member) {
		
		HashMap<String, Integer> map = new HashMap<>();
		//최신 요청 개수 가져오기 - pm 일 경우와 pm 이 아닐 경우 2가지로 나뉨
		int requestRecent = 0;
		if(member.getMtype().equals("pm")) {
			requestRecent = commonDao.selectRequestRecentPM();
		}else {
			requestRecent = commonDao.selectRequestRecent(member);
		}
		//진행 중인 요청 개수 가져오기
		int requestInProgress = commonDao.selectRequestInProgress(member);
		//진행 완료인 요청 개수 가져오기
		int requestDone = commonDao.selectRequestDone(member);
		//개발자 - 재검토 요청 개수 가져오기
		int requestReexam = commonDao.selectRequestReexam(member);
		//pm - 반려건 개수 가져오기
		int requestReject = commonDao.selectRequestReject(member);
		
		map.put("requestRecent", requestRecent);
		map.put("requestInProgress", requestInProgress);
		map.put("requestDone", requestDone);
		map.put("requestReexam", requestReexam);
		map.put("requestReject", requestReject);
		
		return map;
	}
	
	@Override
	public int getListOf7daysLeftCount(Member member) {
		return commonDao.selectListOf7daysLeftCount(member);
	}
	
	@Override
	public List<Request> getListOf7daysLeft(Member member, Pager dPager) {
		return commonDao.selectListOf7daysLeft(member, dPager);
	}

	@Override
	@Transactional
	public Map<String, Object> getWorkCompletionRate(Member member) {
		Map<String, Object> map = new HashMap<>();
		int allMyRequests = commonDao.selectAllMyRequests(member);
		int delayRequests = commonDao.selectDelayRequests(member);
		//지연율 넣기
		double delayRate = 0;
		double normalRate = 100;
		
		if(allMyRequests != 0) {
			delayRate = delayRequests/allMyRequests * 100;
			normalRate = 100 - delayRate;
		} 
		map.put("allMyRequests", allMyRequests);
		map.put("delayRequests", delayRequests);
		map.put("delayRate", delayRate);
		map.put("normalRate", normalRate);
		
		
		return map;
	}

	/* 작성자: 장현
	 * 파일 다운로드
	 */
	@Override
	public StatusHistoryFile getFile(int fno) {
		return commonDao.selectFile(fno);
	}

	/* 작성자: 장현
	 * 진행중인 요청건, 완료된 요청건 개수 구하기
	 */
	@Override
	public HashMap<String, Integer> getUserRequestStatusCount(Member member) {
		HashMap<String, Integer> map = new HashMap<>();
		//진행중인 요청건 구하기
		int requestInProgress =commonDao.selectRequestInProgress(member);
		//완료된 요청건 구하기
		int requestDone = commonDao.selectRequestDone(member);
		map.put("requestInProgress", requestInProgress);
		map.put("requestDone", requestDone);
		return map;
	}

	@Override
	public List<RequestProcess> getRequestProcessList(Member member, String checkbox, Pager pager) {
		List<RequestProcess> list = commonDao.selectRequestProcessList(member, checkbox, pager);
		return list;
	}

	@Override
	public int getRequestProcessRows(Member member, String checkbox) {
		return commonDao.selectRequestProcessRows(member,checkbox);
	}

	@Override
	public int getUserRequestListCount(String searchStatus, Member member) {
		return commonDao.selectUserRequestListCount(searchStatus, member);
	}

	@Override
	public List<Request> getUserRequestList(String searchStatus, Member member, Pager uPager) {
		return commonDao.selectUserRequestList(searchStatus, member, uPager);
	}

	

	
	
}
