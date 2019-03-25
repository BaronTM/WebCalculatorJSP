package app;

public class Calculator {

	private char but;
	private double a;
	private double b;
	private String current;
	private String strA;
	private String strB;
	private double result;
	private String disp;
	private char sign;

	public Calculator() {
		this.but = ' ';
		this.a = 0;
		this.b = 0;
		this.current = "";
		this.disp = "";
		this.strA = "";
		this.strB = "";
		this.result = 0;
		this.sign = ' ';
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
		} else if (c == '+' || c == '-' || c == '*' || c == '/' || c == '=' || c == '%' || c == 'n') {
			sign = c;
			a = a + Double.parseDouble(current);
			current = "";
			disp = "" + a;
		} else if (c == '=') {
			b = Double.parseDouble(current);
			switch (sign) {
			case '+':
				result = a + b;
				String temp = "" + result;
				reset();
				a = Double.parseDouble(temp);
				disp = temp;
			}
		}
	}

	public String display() {
		return this.disp;
	}
	
	public void reset() {
		this.but = ' ';
		this.a = 0;
		this.b = 0;
		this.current = "";
		this.disp = "";
		this.strA = "";
		this.strB = "";
		this.result = 0;
		this.sign = ' ';
	}

}
