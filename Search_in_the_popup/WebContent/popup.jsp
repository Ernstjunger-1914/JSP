<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색</title>
	</head>
	<body>
		<table>
			<tr>
				<td><input type="radio" name="rad" value="name"> 상품명</td>
				<td><input type="text" name="name_v"></td>
			</tr>
			<tr>
				<td><input type="radio" name="rad" value="saledate"> 판매기간</td>
				<td><input type="date" name="saledate_v">~<input type="date" name="saledate_v"></td>
			</tr>
			<tr>
				<td><input type="radio" name="rad" value="saleno"> 비번호</td>
				<td><input type="text" name="saleno_v"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" onclick="checkv()" value="검색"/></td>
			</tr>
		</table>
		<script>
			function checkv(){
				var ch=null;
				var cv=null;
				var crad= document.getElementsByName('rad');
				var cvalue="index.jsp?section=search"
	
				for(var i=0;i<crad.length;i++){
					if(crad[i].checked)
						ch=crad[i].value;
				}
				
				if(ch==null){
					alert('검색 요건을 선택하지 않으셨습니다.');
					return false;
				}
				
				else{
					switch(ch){
					case "name":
						cv = document.getElementsByName('name_v');
						cvalue = cvalue + "&rad=" + ch + "&name_v=" + cv[0].value;
						break;
					case "saledate":
						cv= document.getElementsByName('saledate_v');
						cvalue = cvalue + "&rad=" + ch + "&saledate=" + cv[0].value + ":" + cv[1].value;
						break;
					case "saleno":
						cv= document.getElementsByName('saleno_v');
						cvalue = cvalue + "&rad=" + ch + "&saleno_v=" + cv[0].value;
						break;
					}	
					opener.location.href=cvalue;
					window.close();
				}
			}	
		</script>
	</body>
</html>