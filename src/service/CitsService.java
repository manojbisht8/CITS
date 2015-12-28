package service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import bean.EmployeeBean;
import bean.EmployeeEvaluationBean;
import bean.EmployeeTrainingBean;
import dao.CitsDao;
import dao.CitsEvaluationDao;
import dao.CitsTrainingDao;
import utils.ConnectionManager;

/**
 * This class process all request from controller. In invokes the needed bean
 * and Dao for model data.
 *
 */
public class CitsService {

	private static Logger LOGGER = Logger.getLogger(CitsService.class);

	public Connection connect = null;

	/**
	 * Constructor to perform initialization.
	 */
	public CitsService() {
		ConnectionManager.connectionToMySQL();
		this.connect = ConnectionManager.connect;

	}

	/**
	 * Invoke Dao to get Employee details.
	 * @param empBean
	 * @return
	 */
	public ArrayList<EmployeeBean> getEmployeeDetails(EmployeeBean empBean) {
		LOGGER.debug("inside getEmployeeDetails...");
		CitsDao citsDao = new CitsDao();
		return citsDao.getEmployeeDetails(connect, empBean);

	}

	/**
	 * Invoke Dao to insert Employee details.
	 * @param empBean
	 * @throws Exception
	 */
	public void addNewEmployee(EmployeeBean empBean) throws Exception {
		LOGGER.debug("inside addNewEmployee...");
		CitsDao citsDao = new CitsDao();
		citsDao.addNewEmployee(connect, empBean);

	}
	/**
	 * Invoke Dao to verify if Employee exists.
	 * @param empId
	 * @return
	 * @throws Exception
	 */
	public boolean doesEmployeeExist(String empId) throws Exception {
		LOGGER.debug("inside doesEmployeeExist...");
		CitsDao citsDao = new CitsDao();
		return citsDao.isEmployeeExist(connect, empId);

	}
	
	/**
	 * Invoke Dao to transfer Employee.
	 * @param empBean
	 * @throws Exception
	 */
	public void transferEmployee(EmployeeBean empBean) throws Exception {
		LOGGER.debug("inside transferEmployee...");
		CitsDao citsDao = new CitsDao();
		citsDao.transferEmployee(connect, empBean);

	}
	
	/**
	 * Invoke Dao to delete Employee details.
	 * @param empId
	 * @throws Exception
	 */
	public void deleteEmployee(String empId) throws Exception {
		LOGGER.debug("inside deleteEmployee...");
		CitsDao citsDao = new CitsDao();
		citsDao.deleteEmployee(connect, empId);

	}

	/**
	 * Invoke Dao to get Employee evaluation details.
	 * @param employeeEvaluation
	 * @return
	 */
	public List<EmployeeEvaluationBean> getEmployeeEvaluation(EmployeeEvaluationBean employeeEvaluation) {
		return new CitsEvaluationDao().getEmployeeEvaluationDetails(connect, employeeEvaluation);
	}

	/**
	 * Invoke Dao to get Employee training details.
	 * @param employeeTraining
	 * @return
	 */
	public List<EmployeeTrainingBean> getEmployeeTraining(EmployeeTrainingBean employeeTraining) {
		return new CitsTrainingDao().getEmployeeTrainingDetails(connect, employeeTraining);
	}

	/**
	 * Invoke Dao to add Employee evaluation details.
	 * @param employeeEvaluation
	 */
	public void addNewEvaluation(EmployeeEvaluationBean employeeEvaluation) {
		CitsEvaluationDao citsEvaluation = new CitsEvaluationDao();
		citsEvaluation.addEmployeeEvaluation(connect, employeeEvaluation);
	}

	/**
	 * Invoke Dao to add Employee training details.
	 * @param employeeTraining
	 */
	public void addNewTraining(EmployeeTrainingBean employeeTraining) {
		CitsTrainingDao citsTraining = new CitsTrainingDao();
		citsTraining.addEmployeeTraining(connect, employeeTraining);
	}
}
