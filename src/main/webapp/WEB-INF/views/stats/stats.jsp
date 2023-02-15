<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Percent'],
          ['SRM',     11],
          ['LMS',      2],
          ['SHOP',  2],
          ['UIS', 2],
          ['CMS',    7]
        ]);

        var options = {
          title: '전체 서비스 요청 중 시스템별 비중',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('3dchart'));
        chart.draw(data, options);
      }
      google.charts.setOnLoadCallback(drawdonutChart);
      function drawdonutChart() {
          var data = google.visualization.arrayToDataTable([
            ['Task', 'Rate'],
            ['완료',     11],
            ['',    7]
          ]);

          var options = {
            title: '전체 완료율',
            pieHole: 0.4,

            tooltip: { trigger: 'none' },
            pieSliceTextStyle: {
                color: 'black',
            },
            legend: 'none',
            slices: {
                0: { color: 'green', textStyle: {color: 'orange', fontSize: 14} },
                1: { color: 'transparent' , textStyle: {color: 'transparent'}}
            }
          };

          var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
          chart.draw(data, options);
        }

	      google.charts.load('current', {'packages':['gauge']});
	      google.charts.setOnLoadCallback(drawGageChart);
	
	      function drawGageChart() {
	
	        var data = google.visualization.arrayToDataTable([
	          ['Label', 'Value'],
	          ['지연율', 78],
	        ]);
	
	        var options = {
	          width: 500, height: 150,
	          redFrom: 80, redTo: 100,
	          yellowFrom: 55, yellowTo: 80,
	          minorTicks: 5
	        };
	
	        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));
	
	        chart.draw(data, options);           
	      }
      
      
	      google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawBarChart);
	
	      function drawBarChart() {
	    	  var data = google.visualization.arrayToDataTable([
	    	        ['', '접수중', '개발중', '테스트중', '유저테스트중',
	    	         '배포중', '완료', { role: 'annotation' } ],
	    	        ['요청', 0.2, 0.3, 0.1, 0.1, 0.1, 0.2, '']	    	      
	    	      ]);

	    	      var options = {
	    	    		  width: 1260,
	    	        height: 100,
	    	        hAxis: {	    	        	  
	    	        	  textStyle: {
		    	        	    color: 'white'
		    	          },
	    	        	  format: 'percent',
	    	        	  baselineColor: 'white',
	    	        	  gridlines: {
		    	        	    color: 'white'
	    	        	  }
	    	        	},
	    	        legend: {position: 'none' },
	    	        bar: { groupWidth: '100%' },
	    	        bars: 'horizontal',
	    	        isStacked: true

	    	      };
	
	        var chart = new google.charts.Bar(document.getElementById('barchart_material'));	
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	      
	      google.charts.setOnLoadCallback(drawLineChart);

	      function drawLineChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['월', '요청', '완료'],
	          ['01',  10,      4],
	          ['02',  11,      4],
	          ['03',  6,       11],
	          ['04',  4,       9],
	          ['05',  10,      5]
	        ]);

	        var options = {
	          title: '서비스 요청 추이',
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	        chart.draw(data, options);
	      }
    </script>
    
    <style>
    .nav.nav-tabs-bordered, .nav.tab-content {
	    border-style: solid;
	    border-width: 0 0 1px 0;
	    border-color: #85CE36;
	    padding: 10px 20px 0;
	}
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/WEB-INF/views/common/topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- 여기에 내용 담기 start -->
                <div class="container-fluid">
                	<!-- 첫째 줄 -->
					<div class="row">
						<div  class="col-lg-4">
							 <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">시스템별 요청 비중</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div id="3dchart"></div>
                                </div>
                            </div>
						</div>
						<div  class="col-lg-4">
							 <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">완료율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
	                                <div class="row">
	                                	<div class="col-md-7"> <div id="donutchart"></div></div>
	                                	<div class="col-md-5">
	                                		<p>Task</p>
		                                	<p>개발: 65%</p>
		                                	<p>테스트: 63%</p>
		                                	<p>고객테: 60%</p>
		                                	<p>배포: 60%</p>
	                                	</div>
	                                </div>
                                </div>
                            </div>
						</div>
						<div  class="col-lg-4">
							 <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">지연율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" style="height:240px">
                                	<div class="row">
	                                	<div class="col-md-7"> 
	                                		<div id="chart_div" style="width: 400px; height: 120px;" class="ml-4 mt-3"></div> 
	                                	</div>
	                                	<div class="col-md-5">
	                                		<p>Task</p>
		                                	<p>개발: 65%</p>
		                                	<p>테스트: 63%</p>
		                                	<p>고객테: 60%</p>
		                                	<p>배포: 60%</p>
	                                	</div>
	                                </div>                                  
                                </div>
                            </div>
						</div>
					
					</div>
					
					<!-- 둘째줄 -->
					<div>										
						<!-- 예시 -->
						<div class="card sameheight-item shadow mb-4">
						    <div class="card-block">
						        <!-- Nav tabs -->
						        <div class="card-title-block">
									<h3 class="title ml-3 mt-3">
										SR 처리 현황
									</h3>
								</div>
						        <ul class="nav nav-tabs nav-tabs-bordered">
						            <li class="nav-item">
						            	<a href="#home" class="nav-link active" data-target="#home" data-toggle="tab" aria-controls="home" role="tab" >전체</a>
						            </li>
						            <li class="nav-item">
						            	<a href="#profile" class="nav-link" data-target="#profile" aria-controls="profile" data-toggle="tab" role="tab" >개발</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#messages" aria-controls="messages" data-toggle="tab" role="tab" >테스트</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#usertest" aria-controls="usertest" data-toggle="tab" role="tab" >유저테스트</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#settings" aria-controls="settings" data-toggle="tab" role="tab" >배포</a>
						            </li>
						        </ul>
						
						        <!-- Tab panes -->
						        <div class="tab-content tabs-bordered">
						        	<div>
						        		<div class="m-3">
						        			<h5>전체 SR 처리 현황</h5>
						        			 <!-- 단계 카드들 -->
											<div class="row">

											    <div class="col-xl-2 col-md-6 mb-4">
									                <div class="card border-left-primary shadow h-100 py-2">
									                     <div class="card-body">
									                          <div class="row no-gutters align-items-center">
									                               <div class="col mr-2">
									                                    <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">접수</div>
									                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3 건</div>
									                               </div>
									                               <div class="col-auto">
									                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
									                               </div>
									                           </div>
									                        </div>
									                  </div>
									             </div>
									                        
									             <div class="col-xl-2 col-md-6 mb-4">
									                 <div class="card border-left-success shadow h-100 py-2">
									                     <div class="card-body">
									                          <div class="row no-gutters align-items-center">
									                              <div class="col mr-2">
									                                  <div class="text-sm font-weight-bold text-success text-uppercase mb-1">개발</div>
									                                  <div class="h5 mb-0 font-weight-bold text-gray-800">5 건</div>
									                              </div>
									                          	  <div class="col-auto">
									                                  <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
									                              </div>
									                          </div>
									                      </div>
									                  </div>
									              </div>
									
									              <div class="col-xl-2 col-md-6 mb-4">
									                   <div class="card border-left-info shadow h-100 py-2">
									                        <div class="card-body">
									                             <div class="row no-gutters align-items-center">
									                                   <div class="col mr-2">
									                                        <div class="text-sm font-weight-bold text-info text-uppercase mb-1">테스트
									                                        </div>
									                                   		<div class="row no-gutters align-items-center">
									                                                <div class="col-auto">
									                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">1 건</div>
									                                                </div>
									                                                <div class="col">
									                                                    <div class="progress progress-sm mr-2">
									                                                        <div class="progress-bar bg-info" role="progressbar"
									                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
									                                                            aria-valuemax="100"></div>
									                                                    </div>
									                                                </div>
									                                          </div>
									                                     </div>
									                                     <div class="col-auto">
									                                          <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
									                                      </div>
									                                </div>
									                            </div>
									                       </div>
									                 </div>
							
							                        <div class="col-xl-2 col-md-6 mb-4">
							                            <div class="card border-left-warning shadow h-100 py-2">
							                                <div class="card-body">
							                                    <div class="row no-gutters align-items-center">
							                                        <div class="col mr-2">
							                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">유저테스트</div>
							                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
							                                        </div>
							                                        <div class="col-auto">
							                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
							                                        </div>
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
									                        
							                        <div class="col-xl-2 col-md-6 mb-4">
							                            <div class="card border-left-danger shadow h-100 py-2">
							                                <div class="card-body">
							                                    <div class="row no-gutters align-items-center">
							                                        <div class="col mr-2">
							                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">배포</div>
							                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
							                                        </div>
							                                        <div class="col-auto">
							                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
							                                        </div>
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
							                        
							                        <div class="col-xl-2 col-md-6 mb-4">
							                            <div class="card border-left-secondary shadow h-100 py-2">
							                                <div class="card-body">
							                                    <div class="row no-gutters align-items-center">
							                                        <div class="col mr-2">
							                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">완료</div>
							                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
							                                        </div>
							                                        <div class="col-auto">
							                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							                                        </div>
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
       
											  </div>
						        		
						        		</div>
						        		<div>
						        			<div id="barchart_material" style="box-sizing: border-box;"></div>
						        		</div>
						        		
						        	
						        	</div>
						            <div class="tab-pane fade in active" id="home"> 
						            </div>
						            <div class="tab-pane fade" id="profile">
						            	<div class="m-3">
						            		<h5>개발 현황</h5>
						            		<div>
							            		<!-- 단계 카드들 -->
												<div class="row">
	
												    <div class="col-xl-3 col-md-6 mb-4">
										                <div class="card border-bottom-primary shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                               <div class="col mr-2">
										                                    <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">전체</div>
										                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3 건</div>
										                               </div>
										                               <div class="col-auto">
										                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
										                               </div>
										                           </div>
										                        </div>
										                  </div>
										             </div>
										                        
										             <div class="col-xl-3 col-md-6 mb-4">
										                 <div class="card border-left-success shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                              <div class="col mr-2">
										                                  <div class="text-sm font-weight-bold text-success text-uppercase mb-1">개발 대기</div>
										                                  <div class="h5 mb-0 font-weight-bold text-gray-800">5 건</div>
										                              </div>
										                          	  <div class="col-auto">
										                                  <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										                              </div>
										                          </div>
										                      </div>
										                  </div>
										              </div>

								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-warning shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">개발 중</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                        
								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-secondary shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">개발 완료</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
	       
												  </div>
						            		</div>
						            	</div>
						             
						            </div>
						            <div class="tab-pane fade" id="messages">
						                <div class="m-3">
						            		<h5>테스트 현황</h5>
						            		<div>
							            		<!-- 단계 카드들 -->
												<div class="row">
	
												    <div class="col-xl-3 col-md-6 mb-4">
										                <div class="card border-bottom-primary shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                               <div class="col mr-2">
										                                    <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">전체</div>
										                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3 건</div>
										                               </div>
										                               <div class="col-auto">
										                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
										                               </div>
										                           </div>
										                        </div>
										                  </div>
										             </div>
										                        
										             <div class="col-xl-3 col-md-6 mb-4">
										                 <div class="card border-left-success shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                              <div class="col mr-2">
										                                  <div class="text-sm font-weight-bold text-success text-uppercase mb-1">테스트 대기</div>
										                                  <div class="h5 mb-0 font-weight-bold text-gray-800">5 건</div>
										                              </div>
										                          	  <div class="col-auto">
										                                  <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										                              </div>
										                          </div>
										                      </div>
										                  </div>
										              </div>

								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-warning shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">테스트 중</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                        
								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-secondary shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">테스트 완료</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
	       
												  </div>
						            		</div>
						            	</div>
						            </div>
						             <div class="tab-pane fade" id="usertest">
						                <div class="m-3">
						            		<h5>유저테스트 현황</h5>
						            		<div>
							            		<!-- 단계 카드들 -->
												<div class="row">
	
												    <div class="col-xl-3 col-md-6 mb-4">
										                <div class="card border-bottom-primary shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                               <div class="col mr-2">
										                                    <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">전체</div>
										                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3 건</div>
										                               </div>
										                               <div class="col-auto">
										                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
										                               </div>
										                           </div>
										                        </div>
										                  </div>
										             </div>
										                        
										             <div class="col-xl-3 col-md-6 mb-4">
										                 <div class="card border-left-success shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                              <div class="col mr-2">
										                                  <div class="text-sm font-weight-bold text-success text-uppercase mb-1">테스트 대기</div>
										                                  <div class="h5 mb-0 font-weight-bold text-gray-800">5 건</div>
										                              </div>
										                          	  <div class="col-auto">
										                                  <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										                              </div>
										                          </div>
										                      </div>
										                  </div>
										              </div>

								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-warning shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">테스트 중</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                        
								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-secondary shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">테스트 완료</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
	       
												  </div>
						            		</div>
						            	</div>
						            </div>
						            <div class="tab-pane fade" id="settings">
						              <div class="m-3">
						            		<h5>배포 현황</h5>
						            		<div>
							            		<!-- 단계 카드들 -->
												<div class="row">
	
												    <div class="col-xl-3 col-md-6 mb-4">
										                <div class="card border-bottom-primary shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                               <div class="col mr-2">
										                                    <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">전체</div>
										                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3 건</div>
										                               </div>
										                               <div class="col-auto">
										                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
										                               </div>
										                           </div>
										                        </div>
										                  </div>
										             </div>
										                        
										             <div class="col-xl-3 col-md-6 mb-4">
										                 <div class="card border-left-success shadow h-100 py-2">
										                     <div class="card-body">
										                          <div class="row no-gutters align-items-center">
										                              <div class="col mr-2">
										                                  <div class="text-sm font-weight-bold text-success text-uppercase mb-1">배포 대기</div>
										                                  <div class="h5 mb-0 font-weight-bold text-gray-800">5 건</div>
										                              </div>
										                          	  <div class="col-auto">
										                                  <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										                              </div>
										                          </div>
										                      </div>
										                  </div>
										              </div>

								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-warning shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-warning text-uppercase mb-1">배포 중</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                        
								                        <div class="col-xl-3 col-md-6 mb-4">
								                            <div class="card border-left-secondary shadow h-100 py-2">
								                                <div class="card-body">
								                                    <div class="row no-gutters align-items-center">
								                                        <div class="col mr-2">
								                                            <div class="text-sm font-weight-bold text-success text-uppercase mb-1">배포 완료</div>
								                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1 건</div>
								                                        </div>
								                                        <div class="col-auto">
								                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								                                        </div>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
	       
												  </div>
						            		</div>
						            	</div>
						            </div>
						        </div>
						    </div>
						    <!-- /.card-block -->
						</div>
						<!-- /.card -->
						<!-- 예시 -->
										
					
					
					<!-- /.card-block -->
					</div>
					<!-- 셋째 줄 -->
					<div>

						<div class="card sameheight-item shadow mb-4">
						    <div class="card-block">
						        <!-- Nav tabs -->
						        <div class="card-title-block">
									<h3 class="title ml-3 mt-3">
										개인별 할까 말까 추이나 넣을까
									</h3>
								</div>
						        <ul class="nav nav-tabs nav-tabs-bordered">
						            <li class="nav-item">
						            	<a href="#home2" class="nav-link active" data-target="#home2" data-toggle="tab" aria-controls="home2" role="tab" >전체</a>
						            </li>
						            <li class="nav-item">
						            	<a href="#profile2" class="nav-link" data-target="#profile2" aria-controls="profile2" data-toggle="tab" role="tab" >개발</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#messages2" aria-controls="messages2" data-toggle="tab" role="tab" >테스트</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#usertest2" aria-controls="usertest2" data-toggle="tab" role="tab" >유저테스트</a>
						            </li>
						            <li class="nav-item">
						            	<a href="" class="nav-link" data-target="#settings2" aria-controls="settings2" data-toggle="tab" role="tab" >배포</a>
						            </li>
						        </ul>
						
						        <!-- Tab panes -->
						        <div class="tab-content tabs-bordered">
						        	<div class="m-3">
						        		<h5>일단 추이 그래프</h5>
						        		<div id="curve_chart"></div>
						        	</div>
						        </div>
							</div>
						</div>

					</div>

					

				

                </div>
                <!-- 여기에 내용 담기 end -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Logout</a>
                </div>
            </div>
        </div>
    </div>



</body>

</html>