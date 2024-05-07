package com.ilp03.entity;

public class Employee {
	private String projectName ;
	private String employeeName ;
	private String botName ;
	private String postName ;
	private String reply ;
	public Employee(String projectName, String employeeName, String botName, String postName, String reply) {
		super();
		this.projectName = projectName;
		this.employeeName = employeeName;
		this.botName = botName;
		this.postName = postName;
		this.reply = reply;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getBotName() {
		return botName;
	}
	public void setBotName(String botName) {
		this.botName = botName;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	

	
}
