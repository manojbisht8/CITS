package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import bean.EmployeeBean;
import bean.EmployeeTrainingBean;
import utils.CitsUtils;

/**
 *This class performs DB fetch and DMLs for Employee training.
 *
 */
public class CitsTrainingDao {

	private static Logger LOGGER = Logger.getLogger(CitsTrainingDao.class);

	/**
	 * This method is used to fetch Employee training details.
	 * @param connect
	 * @param employeeTrainingBean
	 * @return
	 */
	public List<EmployeeTrainingBean> getEmployeeTrainingDetails(Connection connect,
			EmployeeTrainingBean employeeTrainingBean) {
		LOGGER.debug("inside getTrainingDetails called: ");
		long employeeId = employeeTrainingBean.getEmployeeId();
		String searchQuery = "";
		List<EmployeeTrainingBean> employeeBeanList = new ArrayList<>();
		try {
			if (employeeId != 0) {
				searchQuery = "SELECT Emp_Id, Training_ID, Training_Conducted,Training_Conducted_Date,Training_Received,Training_Received_Date "
						+ "FROM  employee_training natural join training" + " WHERE Emp_Id =" + employeeId;
			} else {
				searchQuery = "SELECT Emp_Id, Training_ID, Training_Conducted,Training_Conducted_Date,Training_Received,Training_Received_Date "
						+ "FROM  employee_training natural join training";
				;
			}			

			LOGGER.debug("Search query: " + searchQuery);
			Statement stmt = connect.createStatement();
			ResultSet employeeRS = stmt.executeQuery(searchQuery);

			EmployeeTrainingBean employee = null;
			while (employeeRS.next()) {
				employee = new EmployeeTrainingBean();
				employee.setEmployeeId(employeeRS.getLong("Emp_Id"));
				employee.setTrainingId(employeeRS.getInt("Training_ID"));
				employee.setTrainingConducted(employeeRS.getString("Training_Conducted"));
				employee.setTrainingConductedDate(employeeRS.getString("Training_Conducted_Date"));
				employee.setTrainingRecieved(employeeRS.getString("Training_Received"));
				employee.setTrainingRecievedDate(employeeRS.getString("Training_Received_Date"));

				employeeBeanList.add(employee);
			}

		} catch (SQLException e) {
			LOGGER.error(e);
		}
		return employeeBeanList;
	}



	/**
	 * This method is used to insert Employee training details.
	 * @param connect
	 * @param employeeTraining
	 */
	public void addEmployeeTraining(Connection connect, EmployeeTrainingBean employeeTraining) {
		LOGGER.debug("inside add EmployeeEvaluation called: ");
		String employeeId = String.valueOf(employeeTraining.getEmployeeId());
		String trainingId = String.valueOf(employeeTraining.getTrainingId());
		String isTrainingConducted = String.valueOf(employeeTraining.getTrainingConducted());
		String trainingConductedDate = String.valueOf(employeeTraining.getTrainingConductedDate());
		String isTrainingReceived = String.valueOf(employeeTraining.getTrainingRecieved());
		String trainingReceivedDate = String.valueOf(employeeTraining.getTrainingRecievedDate());
		String addTraining = "";
		String addTrainingDetails = "";
		try {

			addTraining = "insert into employee_training(Training_Id,Emp_Id) values" + "(" + trainingId + ","
					+ employeeId + ")";

			addTrainingDetails = "insert into training(Training_Id,Training_Conducted,Training_Conducted_Date,"
					+ "Training_Received,Training_Received_Date) values (" + trainingId + ",'" + isTrainingConducted
					+ "','" + trainingConductedDate + "','" + isTrainingReceived + "','" + trainingReceivedDate + "')";

			Statement stmt = connect.createStatement();
			int status = stmt.executeUpdate(addTraining);

			LOGGER.info("statement addTraining status is : " + status);

			status = stmt.executeUpdate(addTrainingDetails);
			LOGGER.info("statement addTraining status is : " + status);

		} catch (SQLException e) {
			LOGGER.error(e);
		}
	}

}
