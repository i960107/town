<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
jusopopup.jsp
<%String inputYn = request.getParameter("inputYn");
			String roadFullAddr = request.getParameter("roadFullAddr");
			String siNm = request.getParameter("siNm");
			String sggNm = request.getParameter("sggNm");
			String emdNm = request.getParameter("emdNm");%>
<script type="text/javascript">
function init(){
var url = location.href;
/* var confmKey ="devU01TX0FVVEgyMDIxMDQwNjE1MDA0OTExMTAxNjA=";  */
var confmKey ="TESTJUSOGOKR"; 
var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 
var inputYn= "<%=inputYn%>";
if(inputYn != "Y"){
 document.form.confmKey.value = confmKey;
 document.form.returnUrl.value = url;
 document.form.resultType.value = resultType;
 document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망(행정망의 경우 별도 문의)
 document.form.submit();
}else{
opener.jusoCallBack('<%=roadFullAddr%>','<%=siNm%>','<%=sggNm%>','<%=emdNm%>');
	window.close();
	}
	}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> <input
			type="hidden" id="returnUrl" name="returnUrl" value="" /> <input
			type="hidden" id="resultType" name=" resultType " value="" />
	</form>