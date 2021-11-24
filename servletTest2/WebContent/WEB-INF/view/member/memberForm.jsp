<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력 폼</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
   $("#memListBtn").on("click", function(){
      location.href="<%=request.getContextPath()%>/member/memberList.do";
   });
   
   var oldMemberId = "";
   $("#idCheckBtn").on("click", function(){
      var memId = $("#mem_id").val();
      if(memId==""){
         alert("회원ID를 입력하세요.");
         $("#mem_id").focus();
         return;
      }
      
      $.ajax({
         url : "<%=request.getContextPath()%>/member/memberIdCheck.do",
         data : { "mem_id" : memId },
         dataType : "json",
         success : function(result){
            if(result=="OK"){
               $("#idcheckResult").html("사용가능");
               //$("#mem_id").prop("readOnly", true);
               oldMemberId = memId;
            }else{
               $("#idcheckResult").html("ID 중복 - 사용불가");
            }
         },
         error : function(xhr){
            alert(xhr.status);
         }
      });
      
      
   });
   
   $("#mem_id").on("change", function(){
      $("#idcheckResult").text("");
   })
   
   //form에서 submit이벤트가 발생했을 때 처리
   $("#memberForm").on("submit",function(){
      // ID중복체크 결과 가져오기
      var idChk = $("#idcheckResult").text();
      if(idChk != "사용가능" || oldMemberId != $("#mem_id").val() ){
         alert("ID가 중복되거나 중복체크를 하지 않았습니다.");
         return false; //전송 중단
      }
      
      if($("#mem_pass").val() != $("#mem_pass2").val()){
         alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.")
         return false;
      }
      
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
<h2>회원 정보 입력 폼</h2>
<form id = "memberForm" action = "<%=request.getContextPath()%>/member/memberInsert.do">
<table border="1">
<tbody>
<tr>
   <td>회원ID</td>
   <td><input type="text" name="mem_id" id="mem_id">
      <input type="button" value="중복확인" id="idCheckBtn"><br>
      <span id="idcheckResult"></span></td>
</tr>
<tr>
   <td>비밀번호</td>
   <td><input type="password" name="mem_pass" id="mem_pass"></td>
</tr>
<tr>
   <td>비밀번호 확인</td>
   <td><input type="password" name="mem_pass2" id="mem_pass2"></td>
</tr>
<tr>
   <td>회원이름</td>
   <td><input type="text" name="mem_name" id="mem_name"></td>
</tr>
<tr>
   <td>전화번호</td>
   <td><input type="text" name="mem_tel" id="mem_tel"></td>
</tr>
<tr>
   <td>주 소</td>
   <td><input type="text" name="mem_addr" id="mem_addr"></td>
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