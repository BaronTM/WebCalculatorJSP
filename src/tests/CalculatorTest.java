package tests;

import java.lang.NullPointerException;

import org.junit.Before;
import org.junit.Test;

import app.Calculator;

public class CalculatorTest {
	
	private Calculator calc;
	
	@Before
	public void setUp() throws Exception{
		calc = new Calculator();
	}
	
	@Test
	public void divisionByZeroTest() {
		calc.click("2");
		calc.click("/");
		calc.click("0");
		calc.click("=");
		System.out.println(calc.getDisplay());
	}

}
