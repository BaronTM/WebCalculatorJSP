package app;

public class Clc {
	
	private double a;
	private double b;
	private String current;
	private String strA;
	private double result;
	private String disp;
	private char sign;
	private boolean percent;

	public Clc() {
		this.a = 0;
		this.b = 0;
		this.current = "";
		this.strA = "";
		this.result = 0;
		this.disp = "";
		this.sign = ' ';
		this.percent = false;
	};

	public void click(String str) {
		char c = str.charAt(0);
		if (c >= 48 && c <= 57) {
			current += c;
			disp = current;
		} else if (c == '.') {
			if (!current.contains(".")) {
				current += c;
				disp = current;
			}
		} else if (c == '+' || c == '-' || c == '*' || c == '/' || c == 'n' || c == '%') {
			if (current.length() == 0)
				current = "0";
			if (sign == ' ') {
				a = Double.parseDouble(current);
			} else if (c == '+' || c == '-' || c == '*' || c == '/') {
				calculate();
			}
			sign = c;
			if (c == 'n' || c == '%') {
				switch (sign) {
				case 'n':
					a = a * (-1);
					break;
				case '%':
					if (disp.contains("%")) {
						a = a / 100;
						percent = false;
					} else {
						a = a * 100;
						percent = true;
					}
					break;
				}
			}
			current = "";
			disp = "" + a;
		} else if (c == '=') {
			if (current.length() == 0)
				current = "0";
			calculate();
			double temp = a;
			boolean percentTemp = percent;
			reset();
			a = temp;
			if (percentTemp) {
				a = a / 100;
			}
			current = "" + a;
			disp = current;
		}
	}

	private void calculate() {
		switch (sign) {
		case '+':
			a = a + Double.parseDouble(current);
			break;
		case '-':
			a = a - Double.parseDouble(current);
			break;
		case '*':
			a = a + Double.parseDouble(current);
			break;
		case '/':
			a = a / Double.parseDouble(current);
			break;
		}
	}

	public String display() {
		if (percent)
			disp += "%";
		return this.disp;
	}

	public void reset() {
		this.a = 0;
		this.b = 0;
		this.current = "";
		this.strA = "";
		this.result = 0;
		this.disp = "";
		this.sign = ' ';
		this.percent = false;
	}
}
