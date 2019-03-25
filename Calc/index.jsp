<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean class="app.Calculator" id="calculator" scope="session"/>

<%
if (request.getParameter("button") == null) {
} else if (request.getParameter("button").equals("C")) {
	calculator.reset();
} else {
	calculator.click(request.getParameter("button"));
}
String result = calculator.getDisplay();
if (result.equalsIgnoreCase("infinity") || result.equalsIgnoreCase("NAN")) {
	result = "ERROR";
}
%>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index jsp</title>
<style><%@include file="styles.css"%></style>
<style>
table {
	border: 1px solid black;
	border-spacing: 5px;
}
th, td {
	padding: 15px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>JSP Calculator</h1>
	<form action="index.jsp" method="post">
		<table style="width: 500px;">
			<tr>
				<td colspan="4"><input type="text" value="<%=result%>"
					disabled="disabled"></td>
				<td><button name="button" value="C" type="submit">C</button></td>
			</tr>
			<tr>
				<td><button name="button" class="myButton" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="7" type="submit">7</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="8" type="submit">8</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="9" type="submit">9</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="/" type="submit">/</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="s" type="submit">sqrt</button></td>
			</tr>
			<tr>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="4">4</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="5">5</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="6">6</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="*">*</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="%">%</button></td>
			</tr>
			<tr>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="1">1</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="2">2</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="3">3</button></td>
				<td><button name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="-">-</button></td>
				<td rowspan="2"><button <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" name="button" value="=">=</button></td>
			</tr>
			<tr>
				<td><button type="submit" name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="0">0</button></td>
				<td><button type="submit" name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value=".">.</button></td>
				<td><button type="submit" name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="n">+/-</button></td>
				<td><button type="submit" name="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="+">+</button></td>
			</tr>
		</table>
	</form>
	<p>Made by Ernest Paprocki</p>
</body>
</html>