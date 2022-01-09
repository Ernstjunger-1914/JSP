<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>오디션 등록</h3>
		
		<form action="insert_post.jsp" name="form1" method="post">
			<table border="1" style="text-align: left;">
				<tr>
					<td>참가번호</td>
					<td><input type="text" name="anum">  *참가번호는 (AA00) 4자리입니다.</td>
				</tr>
				<tr>
					<td>참가자명</td>
					<td><input type="text" name="aname"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birthy">년<input type="text" name="birthm">월<input type="text" name="birthd">일</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="M">남성<input type="radio" name="gender" value="F">여성</td>
				</tr>
				<tr>
					<td>특기</td>
					<td>
						<select name="talent">
							<option value="">특기선책</option>
							<option value="1">보컬</option>
							<option value="2">댄스</option>
							<option value="3">랩</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>소속사</td>
					<td><input type="text" name="agen"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="오디션 등록" onclick="subm()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function subm() {
				if(form1.anum.value=="") {
					alert("참가번호가 입력되지 않았습니다!");
					form1.anum.focus();
					
					return false;
				} else if(form1.aname.value=="") {
					alert("참가자명이 입력되지 않았습니다!");
					form1.aname.focus();
					
					return false;
				} else if(form1.birthy.value==""||form1.birthm.value==""||form1.birthd.value=="") {
					alert("생년월일이 입력되지 않았습니다!");
					form1.birthy.focus();
					
					return false;
				} else if(form1.gender[0].checked==false&&form1.gender[1].checked==false) {
					alert("성별이 선택되지 않았습니다!");
					form1.gender.focus();
					
					return false;
				} else if(form1.talent.selectedIndex<1) {
					alert("특기가 선택되지 않았습니다!");
					form1.talent.focus();
					
					return false;
				} else if(form1.agen.value=="") {
					alert("소속사가 입력되지 않았습니다!");
					form1.agen.focus();
					
					return false;
				}
				alert("참가신청이 정상적으로 등록되었습니다.");
				document.form1.submit();
			}
			
			function rest() {
				alert("정보를 지우고 처음부터 다시 시작합니다!");
				document.form1.reset();
				form1.anum.focus();
			}
		</script>
	</body>
</html>