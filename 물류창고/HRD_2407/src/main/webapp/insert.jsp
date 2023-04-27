<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<script type="check.js"></script>
<title>입출고 등록 화면</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
	<h1>입출고 등록</h1>
	<%
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		String sql = "select max(t_no)+1 from tbl_inout_202002";
	    
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		rs.next();
	%>
	
	<form method ="POST" action = "action.jsp"  name = "frm">
		<table border="1">
			<tr>
				<td>입출고번호</td>
				<td><input type="text" name="t_no" value="<%=rs.getString(1)%>" readonly/> 예)20210001</td>
				<%
	} catch(Exception e) {
		e.printStackTrace();
	}
				%>
			</tr>
			<tr>
				<td>제품코드</td>
				<td><input name="p_code" type="text" /></td>
			</tr>
			<tr>
				<td>입출고구분</td>
				<td>
					<input type="radio" name="t_type" value="I"/>입고
					<input type="radio" name="t_type" value="O"/>출고
				</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>
					<input type="text" name="t_cnt"/>
				</td>
			</tr>
			<tr>
				<td>거래일자</td>
				<td><input type="text" placeholder="연도-월-일" name="t_date"/></td>
			</tr>
			<tr>
				<td>제품코드</td>
				<td>
					<select name="c_code">
						<option>거래처선택</option>
						<option value = "10">10</option>
						<option value = "20">20</option>
						<option value = "30">30</option>
						<option value = "40">40</option>
						<option value = "50">50</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입출고등록" onclick="check()"/>
					<input type="reset" value="취소" onclick="return alert('다시 해 ㅅㄱ')">
				</td>
			</tr>
		</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>