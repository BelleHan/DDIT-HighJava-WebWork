<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#memListBtn").on("click", function(){
		location.href="<%=request.getContextPath()%>/member/memberList.do";
	});
	
	
	
	
	//form에서 submit이벤트가 발생했을 때 처리
	$("#memberForm").on("submit",function(){
		
		if($("#mem_pass").val() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if($("#mem_name").val() == ""){
			alert("회원이름을 입력하세요.");
			return false;
		}
		
		if($("#mem_tel").val() == ""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		if($("#mem_addr").val() == ""){
			alert("회원 주소를 입력하세요.");
			return false;
		}
		
		return true; //전송 진행
		
	});
});
</script>
</head>
<body>
<%
	MemberVO memvo = (MemberVO)request.getAttribute("memberVo");
%>
<h2>회원 정보 수정 폼</h2>
<form id = "memberForm" action = "<%=request.getContextPath()%>/member/memberUpdate.do">
<input type="hidden" name="mem_id" id="mem_id" value = "<%=memvo.getMem_id() %>">
<table border="1">
<tbody>
<tr>
	<td>회원ID</td>
	<td><%=memvo.getMem_id() %></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="mem_pass" id="mem_pass"></td>
</tr>
<tr>
	<td>회원이름</td>
	<td><input type="text" name="mem_name" id="mem_name" value = "<%=memvo.getMem_name() %>"></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><input type="text" name="mem_tel" id="mem_tel" value = "<%=memvo.getMem_tel() %>"></td>
</tr>
<tr>
	<td>주 소</td>
	<td><input type="text" name="mem_addr" id="mem_addr" value = "<%=memvo.getMem_addr() %>"></td>
</tr>
<tr>
	<td colspan="2" style="text-align:center;">
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="회원목록" id="memListBtn">
	</td>
</tr>

</tbody>
</table>
</form>
</body>
</html>