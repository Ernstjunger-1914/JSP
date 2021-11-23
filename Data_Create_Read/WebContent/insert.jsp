<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
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
		<h3>등록</h3>
		<%
			String num_sql="select to_char(max(SALE_NO)+1, 'fm0000') as cnt from sale_tbl_003";
			PreparedStatement pstmt=con.prepareStatement(num_sql);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			
			String date_sql="select to_char(sysdate, 'yyyy-mm-dd') as now from dual";
			PreparedStatement pstmt2=con.prepareStatement(date_sql);
			ResultSet rs2=pstmt2.executeQuery();
			rs2.next();
			
			String saleno=rs.getString(1);
			String date_=rs2.getString(1);
		%>
		
		<form action="insert_post.jsp" method="post" name="form1">
			<table border="1">
				<tr>
					<td>판매번호(자동발생)</td>
					<td><input type="text" name="sale_ymd" value="<%=saleno %>" readonly></td>
				</tr>
				<tr>
					<td>판매일자(자동발생)</td>
					<td><input type="text" name="date" value="<%=date_ %>" readonly></td>
				</tr>
				<tr>
					<td>판매구분</td>
					<td>
						<select name="sale_fg">
							<option value="">선택</option>
							<option value="1">판매</option>
							<option value="2">판매취소</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매점포</td>
					<td>
						<select name="store_cd">
							<option value="">선택</option>
							<option value="A001">이태원점</option>
							<option value="A002">한남점</option>
							<option value="A003">도원점</option>
							<option value="B001">혜화점</option>
							<option value="C001">방배점</option>
							<option value="D001">사당점</option>
							<option value="D002">흑석점</option>
							<option value="E001">금호점</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매상품</td>
					<td>
						<select name="goods_cd">
							<option value="110001">선택</option>
							<option value="110002">라면</option>
							<option value="110003">빵</option>
							<option value="110004">과자</option>
							<option value="110005">탄산음료</option>
							<option value="110006">삼각김밥</option>
							<option value="110007">초콜릿</option>
							<option value="110008">우유</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="number" name="sale_cnt"></td>
				</tr>
				<tr>
					<td>수취구분</td>
					<td>
						<select name="morc">
							<option value="">선택</option>
							<option value="01">현금</option>
							<option value="02">카드</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="check()">
						<input type="button" value="조회" onclick="select()">
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function check() {
				if(form1.sale_fg.selectedIndex<1) {
					alert("판매구분이 선택되지 않았습니다.");
					
					return false;
				} else if(form1.store_cd.selectedIndex<1) {
					alert("판매점포가 선택되지 않았습니다.");
					
					return false;
				} else if(form1.goods_cd.selectedIndex<1) {
					alert("판매상품이 선택되지 않았습니다.");
					
					return false;
				} else if(form1.sale_cnt.value=="") {
					alert("판매수량을 입력하지 않았습니다.");
					
					return false;
				} else if(form1.morc.selectedIndex<1) {
					alert("수취구분을 선택하지 않았습니다.");
					
					return false;
				}
				alert("매출이 정상적으로 저장되었습니다.");
				document.form1.submit();
			}
		
			function select() {
				location.href="index.jsp?section=select"
			}
		</script>
	</body>
</html>