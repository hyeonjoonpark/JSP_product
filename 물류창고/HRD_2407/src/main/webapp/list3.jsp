<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>출고매출이익화면</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<h1>(제품별)출고매출이익통계</h1>
		<table border="1">
			<tr>
				<td>제품코드</td>
				<td>제품명</td>
				<td>출고수량</td>
				<td>출고매출이익</td>
			</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
				String sql = "select tp.p_code, p_name, t_cnt, t_cnt*(p_outcost - p_incost) as c_benefit " +
								"from tbl_product_202002 tp, tbl_inout_202002 tio " +
								"where tp.p_code = tio.p_code and t_type = 'O' " +
								"order by c_benefit asc";
								
			    
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(sql);
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("p_code") %></td>
				<td><%=rs.getString("p_name") %></td>
				<td><%=rs.getInt("t_cnt")%></td>
				<td><%=rs.getInt("c_benefit") %></td>
			</tr>
		<%
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
		</table>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>