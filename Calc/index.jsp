<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
	
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
} else {
	if (!result.contains(".") && result.length() > 13) {
		result = "ERROR";
	} else if (result.contains(".")) {
		double resD = Double.parseDouble(result);
		String num = String.format("%f", resD);
		int dotIndex = num.indexOf(',');
		if (dotIndex < num.length() - 1) {
			NumberFormat nf = NumberFormat.getInstance();
			nf.setGroupingUsed(false);
			nf.setMaximumFractionDigits(12-dotIndex);
			String[] strings = nf.format(resD).split(",");
			if (strings[0].length() > 12) {
				result = "ERROR";
			} else {
				result = strings[0] + ".";
				if (strings.length > 1) {
					result += strings[1];
				}
			}
		}
	}
}
%>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index jsp</title>
<style><%@include file="css/styles.css"%></style>
</head>
<header>
<h1>JSP CALCULATOR</h1>
</header>
<body>
	<form action="index.jsp" method="post">
	<div>
		<table class="tab">
			<tr class="firstLine">
				<td colspan="4" align="right" class="display">
					<input type="text" name="firstname" disabled="disabled" <%=result.equalsIgnoreCase("error")? "class=\"err\"" : "" %> value="<%=result%>">				
				</td>
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
		</div>
	</form>
	<br>
	<br>
	<br>
	<br>
	<h8 class="area">Made by Ernest Paprocki</h8>
</body>
</html>