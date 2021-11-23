<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>투표하기</h3>
		
		<form action="insert_post.jsp" name="form1">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="j_num">예:9910110000001</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="j_name"></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td>
						<select name="m_num">
							<option value="">후보선택</option>
							<option value="1">김후보</option>
							<option value="2">이후보</option>
							<option value="3">박후보</option>
							<option value="4">조후보</option>
							<option value="5">최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="v_time"></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="v_area"></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td><input type="radio" name="chk" value="Y">확인 <input type="radio" name="chk" value="N">미확인</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="투표하기" onclick="subm()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function subm() {
				if(form1.j_num.value=='') {
					alert("주민번호가 입력되지 않았습니다!");
					form1.j_num.focus();
					
					return false;
				} else if(form1.j_name.value=='') {
					alert("성명이 입력되지 않았습니다!");
					form1.j_name.focus();
				} else if(form1.m_num.selectedIndex<1) {
					alert("후보가 선택되지 않았습니다!");
					form1.m_num.focus();
					
					return false;
				} else if(form1.v_time.value=='') {
					alert("투표시간이 입력되지 않았습니다!");
					form1.v_time.focus();
					
					return false;
				} else if(form1.v_area.value=='') {
					alert("투표장소가 입력되지 않았습니다!");
					form1.v_area.focus();
					
					return false;
				} else if(form1.chk[0].checked==false&&form1.chk[1].checked==false) {
					alert("유권자확인이 선택되지 않았습니다!");
					form1.chk.focus();
					
					return false;
				}
				alert("투표하기 정보가 정상적으로 등록되었습니다!");
				document.form1.submit();
			}
			
			function rest() {
				alert("정보를 지우고 처음부터 다시 입력합니다!");
				document.form1.reset();
				form1.j_num.focus();
			}
		</script>
	</body>
</html>