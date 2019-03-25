package app;

public class Calculator {

	private double a;
	private double b;
	private String current;
	private String disp;
	private char sign;
	private boolean percent;

	public Calculator() {
		reset();
	}

	public void reset() {
		a = 0;
		b = 0;
		current = "0";
		disp = "0";
		sign = ' ';
		percent = false;
	}

	public void click(String str) {
		char c = str.charAt(0);
		if (c >= 48 && c <= 57) {
			if ((current.startsWith("0") || current.startsWith("-0")) && !current.contains(".") && c == 48) {
			} else {
				if ((current.startsWith("0") || current.startsWith("-0")) && !current.contains(".") && c > 48) {
					current = "";
				}
				current += c;
				disp = current;
			}
			disp = current;
		} else if (c == '.') {
			if (!current.contains(".")) {
				current += c;
				disp = current;
			}
		} else if (c == '+' || c == '-' || c == '*' || c == '/') {
			calculate();
			sign = c;
		} else if (c == 'n') {
			if (sign == '=') {
				current = disp;
				a = a * (-1);
			}
			if (!current.contains("-")) {
				current = "-" + current;
			} else {
				current = current.replaceAll("-", "");
			}
			disp = current;
		} else if (c == 's') {
			calculate();
			sign = c;
			a = Math.sqrt(a);
			toDisplay();
			current = "0";
		} else if (c == '%') { // dodac elementy typu *30% +30% itp
			if (sign == '=') {
				percent = !percent;
				calculate();
			} else {
				current = "" + (a * Double.parseDouble(current) / 100);
				disp = current;
			}
		} else if (c == '=') {
			calculate();
			double tempA = a;
			String tempDisp = disp;
			reset();
			a = tempA;
			sign = c;
			disp = tempDisp;
		}
	}

	private void calculate() {
		b = Double.parseDouble(current);
		switch (sign) {
		case ' ':
			a = b;
			break;
		case '+':
			a = a + b;
			break;
		case '-':
			a = a - b;
			break;
		case '*':
			a = a * b;
			break;
		case '/':
			a = a / b;
			break;
		}
		toDisplay();
		current = "0";
	}

	private void toDisplay() {
		if (a % 1 == 0) {
			long iA = (long) a;
			if (percent) {
				iA = iA * 100;
			}
			disp = "" + iA;
		} else {
			if (percent) {
				a = a * 100;
			}
			disp = "" + a;
		}
		if (percent) {
			disp += "%";
		}
	}

	public String getDisplay() {
		return this.disp;
	}

}
