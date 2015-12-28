package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import bean.EmployeeBean;
import utils.CitsUtils;

/**
 * This class performs DB fetch and DMLs for Employee details.
 *
 */
public class CitsDao {

	private static Logger LOGGER = Logger.getLogger(CitsDao.class);

	/**
	 * This methods fetches Employee details.
	 * @param connect
	 * @param employeeBean
	 * @return
	 */
	public ArrayList<EmployeeBean> getEmployeeDetails(Connection connect, EmployeeBean employeeBean) {
		LOGGER.debug("inside getEmployeeDetails called: ");
		String employeeId = employeeBean.getEmployeeId();
		String name = employeeBean.getName();
		String dob = employeeBean.getDob();
		String deptId = employeeBean.getDeptId();
		String designation = employeeBean.getDesignation();
		String dateOfJoin = employeeBean.getDateOfJoin();
		String searchQuery = "";
		ArrayList<EmployeeBean> employeeBeanList = new ArrayList<EmployeeBean>();
		try {

			searchQuery = "SELECT emp.Emp_Id, emp.Name, Dept_Name, Date_of_Birth, emp.Dept_Id, Designation, Phone_num, Email_Id, Date_Of_Joining, Address, "
					+ "(SELECT name FROM Employee WHERE emp_id = empAddInfo.Manager_Id) Manager_name "
					+ "FROM Employee emp, employee_additional_info empAddInfo, department dept"
					+ " WHERE emp.Emp_Id = empAddInfo.Emp_Id AND emp.Dept_Id = dept.Dept_Id ";
			if (!employeeId.isEmpty()) {
				searchQuery = searchQuery + " AND emp.Emp_Id LIKE '%" + employeeId + "%'";
			}
			if (!name.isEmpty()) {
				searchQuery = searchQuery + " AND emp.Name LIKE '%" + name + "%'";
			}
			if (!dob.isEmpty()) {
				searchQuery = searchQuery + " AND emp.Date_Of_Birth LIKE '%" + dob + "%'";
			}
			if (!deptId.isEmpty()) {
				searchQuery = searchQuery + " AND emp.Dept_Id LIKE '%" + deptId + "%'";
			}
			if (!designation.isEmpty()) {
				searchQuery = searchQuery + " AND emp.Designation LIKE '%" + designation + "%'";
			}
			if (!dateOfJoin.isEmpty()) {
				searchQuery = searchQuery + " AND empAddInfo.Date_Of_Joining LIKE '%" + dateOfJoin + "%'";
			}

			// Set default Order by Employee Id
			searchQuery = searchQuery + " ORDER BY emp.Emp_Id";

			LOGGER.debug("Search query: " + searchQuery);
			Statement stmt = connect.createStatement();
			ResultSet employeeRS = stmt.executeQuery(searchQuery);

			EmployeeBean employee = null;
			while (employeeRS.next()) {
				employee = new EmployeeBean();
				employee.setEmployeeId(employeeRS.getString("Emp_Id"));
				employee.setName(employeeRS.getString("Name"));
				employee.setDob(employeeRS.getString("Date_of_Birth"));
				employee.setDeptName(employeeRS.getString("Dept_Name"));
				employee.setDesignation(employeeRS.getString("Designation"));
				employee.setPhoneNum(employeeRS.getString("Phone_num"));
				employee.setEmailId(employeeRS.getString("Email_Id"));
				employee.setDateOfJoin(employeeRS.getString("Date_Of_Joining"));
				employee.setAddress(employeeRS.getString("Address"));
				employee.setManagerName(employeeRS.getString("Manager_name"));
				employeeBeanList.add(employee);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employeeBeanList;
	}

	/**
	 * This method is used to verify if the Employee exists
	 * 
	 * @param connect
	 * @param empId
	 * @return
	 */
	public boolean isEmployeeExist(Connection connect, String empId) {
		LOGGER.debug("inside isEmployeeExist ...");
		boolean employeeExist = false;
		try {

			String searchQuery = "SELECT Emp_Id FROM Employee WHERE Emp_Id = '" + empId + "'";

			LOGGER.debug("Search query: " + searchQuery);
			Statement stmt = connect.createStatement();
			ResultSet employeeRS = stmt.executeQuery(searchQuery);

			EmployeeBean employee = null;
			while (employeeRS.next()) {
				LOGGER.debug("Employee exists...");
				employeeExist = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employeeExist;
	}

	/**
	 * This methods adds Employee details.
	 * @param connect
	 * @param employeeBean
	 * @throws Exception
	 */
	public void addNewEmployee(Connection connect, EmployeeBean employeeBean) throws Exception {
		LOGGER.debug("inside addNewEmployee ...");

		String employeeId = (employeeBean.getEmployeeId().isEmpty()) ? "" : employeeBean.getEmployeeId();
		String name = (employeeBean.getName().isEmpty()) ? "" : employeeBean.getName();
		String dob = (employeeBean.getDob().isEmpty()) ? "" : employeeBean.getDob();
		String deptId = (employeeBean.getDeptId().isEmpty()) ? "" : employeeBean.getDeptId();
		String designation = (employeeBean.getDesignation().isEmpty()) ? "" : employeeBean.getDesignation();

		// Additional details
		String dateOfJoin = (employeeBean.getDateOfJoin().isEmpty()) ? "" : employeeBean.getDateOfJoin();
		String emailId = (employeeBean.getEmailId().isEmpty()) ? "" : employeeBean.getEmailId();
		String phoneNum = (employeeBean.getPhoneNum().isEmpty()) ? "" : employeeBean.getPhoneNum();
		String address = (employeeBean.getAddress().isEmpty()) ? "" : employeeBean.getAddress();
		String managerId = (employeeBean.getManagerId().isEmpty()) ? "" : employeeBean.getManagerId();

		long ssn = CitsUtils.createRandomInteger(10000000, 99999999);
		long salary = CitsUtils.createRandomInteger(50000, 150000);
		String employeeInsertQuery = "";
		String employeeAddDetailsInsQuery = "";
		try {

			connect.setAutoCommit(false);
			
			employeeInsertQuery = "INSERT INTO Employee VALUES ('" + employeeId + "', '" + name + "', '" + ssn + "', '"
					+ dob + "', '" + deptId + "', '" + designation + "')";

			LOGGER.debug("Insert query1: " + employeeInsertQuery);
			Statement stmt = connect.createStatement();
			int status = stmt.executeUpdate(employeeInsertQuery);
			LOGGER.debug("Insert execution status: " + status);

			employeeAddDetailsInsQuery = "INSERT INTO employee_additional_info VALUES ('" + employeeId + "', '"
					+ address + "', '" + phoneNum + "', '" + emailId + "', " + "'" + dateOfJoin + "', '" + salary
					+ "', '" + managerId + "')";

			LOGGER.debug("Insert query2: " + employeeAddDetailsInsQuery);
			Statement stmt2 = connect.createStatement();
			int status2 = stmt2.executeUpdate(employeeAddDetailsInsQuery);
			LOGGER.debug("Insert execution status2: " + status2);

			connect.commit();

		} catch (SQLException e) {
			LOGGER.error("Error occured while insert: " + e);
			throw new Exception();
		}
		LOGGER.debug("addNewEmployee SUCCESS...");
	}

	/**
	 * This methods inserts Employee Transfer details.
	 * @param connect
	 * @param employeeBean
	 * @throws Exception
	 */
	public void transferEmployee(Connection connect, EmployeeBean employeeBean) throws Exception {
		LOGGER.debug("inside addNewEmployee ...");

		String employeeId = (employeeBean.getEmployeeId().isEmpty()) ? "" : employeeBean.getEmployeeId();
		String deptId = (employeeBean.getDeptId().isEmpty()) ? "" : employeeBean.getDeptId();
		String address = (employeeBean.getAddress().isEmpty()) ? "" : employeeBean.getAddress();
		String empTrnsferInsertQuery = "";
		String updateDeptQuery = "";
		try {

			connect.setAutoCommit(false);			

			empTrnsferInsertQuery = "INSERT INTO Employee_Trasfer VALUES ('" + employeeId
					+ "', (SELECT Dept_Id FROM Employee WHERE Emp_Id = '" + employeeId + "'), " + "'" + deptId + "', '"
					+ address + "')";

			LOGGER.debug("Insert query1: " + empTrnsferInsertQuery);
			Statement stmt = connect.createStatement();
			int status = stmt.executeUpdate(empTrnsferInsertQuery);
			LOGGER.debug("Insert execution status: " + status);

			updateDeptQuery = "UPDATE Employee SET Dept_Id = '" + deptId + "' WHERE Emp_Id = '" + employeeId + "'";

			LOGGER.debug("Update query2: " + updateDeptQuery);
			Statement stmt2 = connect.createStatement();
			int status2 = stmt2.executeUpdate(updateDeptQuery);
			LOGGER.debug("Update execution status2: " + status2);
			connect.commit();

		} catch (SQLException e) {
			LOGGER.error("Error occured while insert: " + e);
			throw new Exception();
		}
		LOGGER.debug("addNewEmployee SUCCESS...");
	}

	/**
	 * This methods deletes Employee details.
	 * @param connect
	 * @param empId
	 * @throws Exception
	 */
	public void deleteEmployee(Connection connect, String empId) throws Exception {
		LOGGER.debug("inside deleteEmployee ...");

		String delEmployeeQuery = "";
		try {

			delEmployeeQuery = "DELETE FROM Employee WHERE Emp_Id = '" + empId + "'";

			LOGGER.debug("Delete query: " + delEmployeeQuery);
			Statement stmt = connect.createStatement();
			int status = stmt.executeUpdate(delEmployeeQuery);
			LOGGER.debug("Delete execution status: " + status);

		} catch (SQLException e) {
			LOGGER.error("Error occured while insert: " + e);
			throw new Exception();
		}
		LOGGER.debug("deleteEmployee SUCCESS...");
	}

}
