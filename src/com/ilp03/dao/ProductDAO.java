package com.ilp03.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ilp03.entity.Employee;

public class ProductDAO {
	public static Connection getConnection() {

		String connectionString = "jdbc:mysql://localhost:3306/agile?useSSL=false";
		String userName = "root";
		String password = "root@1257";
		Connection connection = null;

		try {
			connection = DriverManager.getConnection(connectionString, userName, password);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return connection;
	}

	public static void closeConnection(Connection connection) {

		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static ArrayList<Employee> getDetailsWithProjectName(Connection connection, String productSearch) {

		ArrayList<Employee> employeeList = new ArrayList<Employee>();
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(
					"select project_name ,employee_name,bot_name,post_name,reply  from projects inner join chatbots on projects.id = chatbots.project_id inner join posts on projects.id=posts.project_id inner join reply on reply.post_id = posts.id inner join employee on employee.employee_id=reply.employee_id where project_name = ?;;");
			preparedStatement.setString(1, productSearch);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				String projectName = resultSet.getString(1);
				String employeeName = resultSet.getString(2);
				String botName = resultSet.getString(3);
				String postName = resultSet.getString(4);
				String reply = resultSet.getString(5);

				Employee employee = new Employee(projectName, employeeName, botName, postName,reply);
				employeeList.add(employee);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return employeeList;

	}
}
