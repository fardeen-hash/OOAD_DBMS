package com.ilp03.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import com.ilp03.dao.ProductDAO;
import com.ilp03.entity.Employee;



public class ProductService implements ProjectServiceImpl {

	@Override
	public void getProjectDetails() {
		Connection connection = ProductDAO.getConnection();
		System.out.println("Enter the Project Name");
		Scanner scanner = new Scanner(System.in);
		String productSearch = scanner.nextLine();
		ArrayList<Employee> employeeList = ProductDAO.getDetailsWithProjectName(connection, productSearch);
		System.out.println("Project Name\tEmployee Name\tBot Name\tPost Name\tReply type");
		for (Employee employee : employeeList) {
			System.out.println(employee.getProjectName() + "\t" + employee.getEmployeeName()+"\t\t"+employee.getBotName()+"\t"+employee.getPostName()+"\t\t"+employee.getReply());
		}
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
