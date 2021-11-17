package calculation;

public class Computer {

	
	
	private double num1;
	private double num2;
	private String operator;
	public double getNum1() {
		return num1;
	}
	public void setNum1(double num1) {
		this.num1 = num1;
	}
	public double getNum2() {
		return num2;
	}
	public void setNum2(double num2) {
		this.num2 = num2;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
	
	public double getResult() {
		double result = 0;
		
		
		if(operator.equals("+"))
			result = num1 + num2;
		else if (operator.equals("-"))
			result = num1 - num2;
		
		else if (operator.equals("*"))
			result = num1 * num2;
		
		else if (operator.equals("/"))
			result = num1 / num2;
		
		
		return result;
	}
	
	
	
	
	
	

}
