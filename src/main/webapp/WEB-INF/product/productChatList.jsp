<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>
<script>
	function chat(pno, sellerid, buyerid) {
		window.open("reply.prd?no="+pno+"&sellerid="+sellerid+"&buyerid="+buyerid+"", "구매연락하기", "width=650, height=700, left=100, top=50");
	}
</script>
</head>
<body>

<br><br>
<div style="width: 80%; margin: 0 auto;" > 
            <div class="row">
                <div class="col-md-12">
                    <div class="cart-table">
                    	<br>
                    	<h3 align="center" class="group-input"><b>나의 채팅 리스트</b></h3><br><br>
                    	<div class="row">
                        <div class="col-lg-12">
                        </div>
               		     </div>
                    	
                    	<p align="right">※ 채팅 제목 클릭하시면 채팅창으로 연결 됩니다.※</p>
                        <table>
                            <thead>
                                <tr>
                                    <th>채팅 제목</th>
                                    <th>판매자</th>
                                    <th>구매자</th>
                                    <th>내용</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="chat" items="${clist }">
								<tr align="center">
									<td class="group-input"><label><a onclick="chat('${chat.pno }', '${chat.sellerid}', '${chat.buyerid}')" style="cursor: pointer;">
									<font style="color: #EDA900;" >${chat.subject }</font> </a></label></td>
									<td ><label>${chat.sellerid }</label></td>
									<td><label>${chat.buyerid }
									</label></td>
									
									<td class="group-input"><label>${chat.contents }
									</label></td>
								</tr>
							</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
 		</div> 




</body>
<br><br>
<%@include file="./../common/main_bottom.jsp" %>
</html>