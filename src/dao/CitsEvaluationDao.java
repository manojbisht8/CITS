package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import bean.EmployeeEvaluationBean;

/**
 * This class performs DB fetch and DMLs for Employee evaluation.
 *
 */
public class CitsEvaluationDao {
	private static Logger LOGGER = Logger.getLogger(CitsEvaluationDao.class);

	/**
	 * This class fetches Employee evaluation details.
	 * @param connect
	 * @param employeeEvaluationBean
	 * @return
	 */
	public List<EmployeeEvaluationBean> getEmployeeEvaluationDetails(Connection connect,
			EmployeeEvaluationBean employeeEvaluationBean) {
		LOGGER.debug("inside getEmployeeDetails called: ");
		long employeeId = employeeEvaluationBean.getEmployeeId();
		String searchQuery = "";
		List<EmployeeEvaluationBean> employeeBeanList = new ArrayList<>();
		try {

			if (employeeId == 0) {
				searchQuery = "SELECT Emp_Id, manager_ID, Proactiveness, Communication, Leadership, Team_Work, Rating "
						+ "FROM  EMPLOYEE_EVALUATION";

			}
			else{
			searchQuery = "SELECT Emp_Id, manager_ID, Proactiveness, Communication, Leadership, Team_Work, Rating "
					+ "FROM  EMPLOYEE_EVALUATION" + " WHERE Emp_Id =" + employeeId;
			}
			LOGGER.debug("Search query: " + searchQuery);
			Statement stmt = connect.createStatement();
			ResultSet employeeRS = stmt.executeQuery(searchQuery);

			EmployeeEvaluationBean employee = null;
			while (employeeRS.next()) {
				employee = new EmployeeEvaluationBean();
				employee.setEmployeeId(employeeRS.getLong("Emp_Id"));
				employee.setManagerId(employeeRS.getLong("Manager_ID"));
				employee.setProactiveness(employeeRS.getInt("Proactiveness"));
				employee.setCommunication(employeeRS.getInt("Communication"));
				employee.setTeamWork(employeeRS.getInt("Team_Work"));
				employee.setLeadership(employeeRS.getInt("Leadership"));
				employee.setRating(employeeRS.getInt("Rating"));
				employeeBeanList.add(employee);
			}

		} catch (SQLException e) {
		LOGGER.error(e);
		}
		return employeeBeanList;
	}

	/**
	 * This class inserts Employee evaluation details.
	 * @param connect
	 * @param employeeEvaluationBean
	 */
	public void addEmployeeEvaluation(Connection connect, EmployeeEvaluationBean employeeEvaluationBean) {
		LOGGER.debug("inside add EmployeeEvaluation called: ");
		String employeeId = String.valueOf(employeeEvaluationBean.getEmployeeId());
		String communication = String.valueOf(employeeEvaluationBean.getCommunication());
		String leadership = String.valueOf(employeeEvaluationBean.getLeadership());
		String proactiveness = String.valueOf(employeeEvaluationBean.getProactiveness());
		String managerId = String.valueOf(employeeEvaluationBean.getManagerId());
		String teamWork = String.valueOf(employeeEvaluationBean.getTeamWork());
		String rating = String.valueOf(employeeEvaluationBean.getRating());
		String addQuery = "";
		try {

			addQuery = "insert into employee_evaluation(Emp_Id,Manager_Id,Proactiveness,Communication,Leadership,Team_Work,Rating) values"
					+ "(" + employeeId + "," + managerId + "," + proactiveness + "," + communication + "," + leadership
					+ "," + teamWork + "," + rating + ")";
			Statement stmt = connect.createStatement();
			int status = stmt.executeUpdate(addQuery);

			LOGGER.info("statement execution status is : " + status);

		} catch (SQLException e) {
			LOGGER.error(e);
		}
	}



}
