package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import bean.EmployeeBean;
import bean.EmployeeEvaluationBean;
import bean.EmployeeTrainingBean;
import service.CitsService;
import utils.CitsPropertiesHandler;

/**
 * This class handles all requests and decides appropriate view(Jsp, html)
 *
 */
public class CitsController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger LOGGER = Logger.getLogger(CitsController.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		try {

			LOGGER.info("doGet called: ");
			String strUri = request.getRequestURI();
			String requestType = strUri.substring(strUri.lastIndexOf('/') + 1);
			LOGGER.info(requestType);
			if (requestType.equalsIgnoreCase("PopulateSearchTable")) {
				performSearch(request, response);
			}
			if (requestType.equalsIgnoreCase("addEmployee.do")) {
				addNewEmployee(request, response);
			}
			if (requestType.equalsIgnoreCase("evaluateEmployee")) {
				LOGGER.info("resolved to evaluate employee");
				evaluateEmployee(request, response);
			}
			if (requestType.equalsIgnoreCase("trainingEmployee")) {
				LOGGER.info("resolved to training employee");
				traingOfEmployee(request, response);
			}
			if (requestType.equalsIgnoreCase("addEvaluation")) {
				LOGGER.info("resolved to add evaluation");
				addEvaluation(request, response);
			}

			if (requestType.equalsIgnoreCase("addTraining")) {
				LOGGER.info("resolved to add training");
				addTraining(request, response);
			}
			if (requestType.equalsIgnoreCase("transferEmployee.do")) {
				LOGGER.info("resolved to Transfer Employee");
				transferEmployee(request, response);
			}
			if (requestType.equalsIgnoreCase("deleteEmployee.do")) {
				LOGGER.info("resolved to Delete Employee");
				deleteEmployee(request, response);
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
	}

	/**
	 * This method is used to add training details for Employees.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addTraining(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeTrainingBean employeeTraining = new EmployeeTrainingBean();
		long employeeId = Long.valueOf(request.getParameter("empId"));
		employeeTraining.setEmployeeId(employeeId);
		String trainingConducted = String.valueOf(request.getParameter("trainingConducted"));
		employeeTraining.setTrainingConducted(trainingConducted);
		String trainingConductedDate = String.valueOf(request.getParameter("trainingConductedDate"));
		employeeTraining.setTrainingConductedDate(trainingConductedDate);
		long trainingId = Long.valueOf(request.getParameter("trainingId"));
		employeeTraining.setTrainingId(trainingId);
		String trainingRecieved = String.valueOf(request.getParameter("trainingRecieved"));
		employeeTraining.setTrainingRecieved(trainingRecieved);
		String trainingRecievedDate = String.valueOf(request.getParameter("trainingRecievedDate"));
		employeeTraining.setTrainingRecievedDate(trainingRecievedDate);

		CitsService citsService = new CitsService();
		String statusMsg = "";
		try {
			citsService.addNewTraining(employeeTraining);
			statusMsg = "Training details added for employee.";
		} catch (Exception ex) {
			LOGGER.error("Exception occured: " + ex);
			statusMsg = "Error occured while adding employee training.";
		}
		request.setAttribute("message", statusMsg);
		String messageJsp = CitsPropertiesHandler.getInstance().getProperty("MESSAGE_JSP");
		RequestDispatcher rd = getServletContext().getRequestDispatcher(messageJsp);
		rd.forward(request, response);
	}

	/**
	 * This method is used to perform Employee evaluation.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmployeeEvaluationBean employeeEvaluation = new EmployeeEvaluationBean();
		employeeEvaluation.setEmployeeId(Long.valueOf(request.getParameter("empId")));
		employeeEvaluation.setManagerId(Long.valueOf(request.getParameter("managerId")));
		int communication = Integer.valueOf(request.getParameter("communication")).intValue();
		employeeEvaluation.setCommunication(communication);
		int leadership = Integer.valueOf(request.getParameter("leadership")).intValue();
		employeeEvaluation.setLeadership(leadership);
		int proactiveness = Integer.valueOf(request.getParameter("proactiveness")).intValue();
		employeeEvaluation.setProactiveness(proactiveness);
		int teamwork = Integer.valueOf(request.getParameter("teamwork")).intValue();
		employeeEvaluation.setTeamWork(teamwork);
		employeeEvaluation.setRating((teamwork + proactiveness + leadership + communication) / 4);

		CitsService citsService = new CitsService();
		String statusMsg = "";
		try {
			citsService.addNewEvaluation(employeeEvaluation);
			statusMsg = "Evaluation completed for employee.";
		} catch (Exception ex) {
			LOGGER.error("Exception occured: " + ex);
			statusMsg = "Error occured while adding employee evaluation.";
		}
		request.setAttribute("message", statusMsg);
		String messageJsp = CitsPropertiesHandler.getInstance().getProperty("MESSAGE_JSP");
		RequestDispatcher rd = getServletContext().getRequestDispatcher(messageJsp);
		rd.forward(request, response);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		doGet(request, response);
	}

	/**
	 * This method is used to add new Employee.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addNewEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOGGER.info("performSearch called222...");
		LOGGER.debug("EmpId " + request.getParameter("empId"));
		LOGGER.debug("EmpName " + request.getParameter("empName"));
		LOGGER.debug("dob " + request.getParameter("dob"));
		LOGGER.debug("email " + request.getParameter("dept"));
		LOGGER.debug("desig " + request.getParameter("desig"));
		LOGGER.debug("dateOfJoin " + request.getParameter("dateOfJoin"));
		LOGGER.debug("email " + request.getParameter("email"));
		LOGGER.debug("phoneNum " + request.getParameter("phoneNum"));
		LOGGER.debug("address " + request.getParameter("address"));
		LOGGER.debug("managerId " + request.getParameter("managerId"));

		// Set the EmployeeBean
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEmployeeId(request.getParameter("empId"));
		employeeBean.setName(request.getParameter("empName"));
		employeeBean.setDob(request.getParameter("dob"));
		employeeBean.setDeptId(request.getParameter("dept"));
		employeeBean.setDesignation(request.getParameter("desig"));
		employeeBean.setDateOfJoin(request.getParameter("dateOfJoin"));
		employeeBean.setEmailId(request.getParameter("email"));
		employeeBean.setPhoneNum(request.getParameter("phoneNum"));
		employeeBean.setAddress(request.getParameter("address"));
		employeeBean.setManagerId(request.getParameter("managerId"));
		CitsService citsService = new CitsService();
		String statusMsg = "";
		try {
			citsService.addNewEmployee(employeeBean);
			statusMsg = "New employee details added.";
		} catch (Exception ex) {
			LOGGER.error("Exception occured: " + ex);
			statusMsg = "Error occured while adding employee details.";
		}
		request.setAttribute("message", statusMsg);
		String messageJsp = CitsPropertiesHandler.getInstance().getProperty("MESSAGE_JSP");
		// response.sendRedirect(messageJsp);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(messageJsp);
		rd.forward(request, response);
	}

	/**
	 * This method is used to transfer Employee.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void transferEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOGGER.info("transferEmployee called...");
		LOGGER.debug("EmpId " + request.getParameter("empId"));
		LOGGER.debug("dept " + request.getParameter("dept"));
		LOGGER.debug("address " + request.getParameter("address"));

		// Set the EmployeeBean
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEmployeeId(request.getParameter("empId"));
		employeeBean.setDeptId(request.getParameter("dept"));
		employeeBean.setAddress(request.getParameter("address"));
		CitsService citsService = new CitsService();
		String statusMsg = "";
		try {

			if (!citsService.doesEmployeeExist(employeeBean.getEmployeeId())) {
				statusMsg = "Employee with provided Employee Id does not exist.";
			} else {
				citsService.transferEmployee(employeeBean);
				statusMsg = "Employee transferred to new Department.";
			}
		} catch (Exception ex) {
			LOGGER.error("Exception occured: " + ex);
			statusMsg = "Error occured while adding employee details.";
		}
		request.setAttribute("message", statusMsg);
		String messageJsp = CitsPropertiesHandler.getInstance().getProperty("MESSAGE_JSP");
		RequestDispatcher rd = getServletContext().getRequestDispatcher(messageJsp);
		rd.forward(request, response);
	}

	/**
	 * This method is used to delete Employee details.
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOGGER.info("deleteEmployee called...");
		LOGGER.debug("EmpId " + request.getParameter("empId"));

		String empId = request.getParameter("empId");
		CitsService citsService = new CitsService();
		String statusMsg = "";
		try {

			if (!citsService.doesEmployeeExist(empId)) {
				statusMsg = "Employee with provided Employee Id does not exist.";
			} else {
				citsService.deleteEmployee(empId);
				statusMsg = "Employee deleted and details archieved to Previous Employee.";
			}
		} catch (Exception ex) {
			LOGGER.error("Exception occured: " + ex);
			statusMsg = "Error occured while adding employee details.";
		}
		request.setAttribute("message", statusMsg);
		String messageJsp = CitsPropertiesHandler.getInstance().getProperty("MESSAGE_JSP");
		RequestDispatcher rd = getServletContext().getRequestDispatcher(messageJsp);
		rd.forward(request, response);
	}

	/**
	 * This method is used to perform Employee search.
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void performSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOGGER.info("addNewEmployee called...");
		LOGGER.debug("EmpId " + request.getParameter("empId"));
		LOGGER.debug("EmpName " + request.getParameter("empName"));
		LOGGER.debug("dob " + request.getParameter("dob"));
		LOGGER.debug("email " + request.getParameter("dept"));
		LOGGER.debug("desig " + request.getParameter("desig"));
		LOGGER.debug("doj " + request.getParameter("doj"));
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEmployeeId(request.getParameter("empId"));
		employeeBean.setName(request.getParameter("empName"));
		employeeBean.setDob(request.getParameter("dob"));
		employeeBean.setDeptId(request.getParameter("dept"));
		employeeBean.setDesignation(request.getParameter("desig"));
		employeeBean.setDateOfJoin(request.getParameter("doj"));
		CitsService citsService = new CitsService();
		ArrayList<EmployeeBean> employeeList = citsService.getEmployeeDetails(employeeBean);
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(employeeList, new TypeToken<List<EmployeeBean>>() {
		}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		LOGGER.debug("jsonArray: " + jsonArray);
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
	}

	/**
	 * This method is used to perform Employee evaluation details search.
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void evaluateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOGGER.info("addNewEmployee called...");
		LOGGER.debug("EmpId " + request.getParameter("empId"));
		LOGGER.debug("EmpName " + request.getParameter("empName"));

		EmployeeEvaluationBean employeeEvaluation = new EmployeeEvaluationBean();
		employeeEvaluation.setEmployeeId(0);
		String parameter = request.getParameter("empId");
		if (parameter != null && !parameter.isEmpty()) {
			employeeEvaluation.setEmployeeId(Long.valueOf(parameter));
		}

		CitsService citsService = new CitsService();
		List<EmployeeEvaluationBean> employeeList = citsService.getEmployeeEvaluation(employeeEvaluation);
		LOGGER.info("Size of results is " + employeeList.size());
		for (EmployeeEvaluationBean employeeEvaluation2 : employeeList) {
			LOGGER.info("found employee evaluation" + employeeEvaluation2.getCommunication() + " rating"
					+ employeeEvaluation2.getRating());
		}
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(employeeList, new TypeToken<List<EmployeeEvaluationBean>>() {
		}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		LOGGER.debug("jsonArray: " + jsonArray);
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
	}

	/**
	 * This method is used to perform Employee training details search.
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void traingOfEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LOGGER.info("traingOfEmployee called...");
		EmployeeTrainingBean employeeTraining = new EmployeeTrainingBean();
		String parameter = request.getParameter("empId");
		employeeTraining.setEmployeeId(0);
		if (parameter != null && !parameter.isEmpty()) {
			employeeTraining.setEmployeeId(Long.valueOf(parameter));
		}

		CitsService citsService = new CitsService();
		List<EmployeeTrainingBean> employeeList = citsService.getEmployeeTraining(employeeTraining);
		for (EmployeeTrainingBean employeeTraining2 : employeeList) {
			LOGGER.info("found employee trainingID" + employeeTraining2.getTrainingId() + " trainingConducted"
					+ employeeTraining2.getTrainingConducted());
		}
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(employeeList, new TypeToken<List<EmployeeTrainingBean>>() {
		}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		LOGGER.debug("jsonArray: " + jsonArray);
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
	}

}
