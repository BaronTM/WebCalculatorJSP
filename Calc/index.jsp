<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean class="app.Calculator" id="calculator" scope="session"/>


<%
// dodac zaokraglanie i blad jescli weksze niz 10 liczb po przecinku
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
<link href="https://fonts.googleapis.com/css?family=Lato:700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/style.css">
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
 <script  src="js/index.js"></script>
 
<meta charset="UTF-8">
<title>Index jsp</title>
<style><%@include file="css/styles.css"%></style>
</head>
<header>
	<div class="text-effect">
  <h1 class="neon" data-text="JSP CALCULATOR" contenteditable>JSP CALCULATOR</h1>
  <div class="gradient"></div>
  <div class="spotlight"></div>
</div>
</h1>
</header>
<body>
	<form action="index.jsp" method="post">
		<table class="tab">
			<tr>
				<td colspan="4" align="right"><h7 <%=result.equalsIgnoreCase("error")? "class=\"err\"" : "" %>><%=result%></h7></td>
				<td><button name="button" class="button" value="C" type="submit">C</button></td>
			</tr>
			<tr>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="7" type="submit">7</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="8" type="submit">8</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="9" type="submit">9</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="/" type="submit">/</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="s" type="submit">√</button></td>
			</tr>
			<tr>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="4">4</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="5">5</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="6">6</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="*">*</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="%">%</button></td>
			</tr>
			<tr>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="1">1</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="2">2</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="3">3</button></td>
				<td><button name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" value="-">-</button></td>
				<td rowspan="2"><button class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> type="submit" name="button" value="=">=</button></td>
			</tr>
			<tr>
				<td><button type="submit" name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="0">0</button></td>
				<td><button type="submit" name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value=".">.</button></td>
				<td><button type="submit" name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="n">+/-</button></td>
				<td><button type="submit" name="button" class="button" <%=result.equalsIgnoreCase("error")? "disabled=\"disabled\"" : "" %> value="+">+</button></td>
			</tr>
		</table>
	</form>
	<p><a>Made by Ernest Paprocki</a></p>
</body>
</html>