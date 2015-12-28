package bean;

/**
 * This class provides getters and setters for Employee Training.
 *
 */
public class EmployeeTrainingBean {

	
	private long trainingId;
	private long employeeId;
	private String trainingRecievedDate;
	private String trainingRecieved;
	private String trainingConducted;
	private String trainingConductedDate;

	public long getTrainingId() {
		return trainingId;
	}
	public void setTrainingId(long trainingId) {
		this.trainingId = trainingId;
	}
	public long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}
	public String getTrainingConducted() {
		return trainingConducted;
	}
	public void setTrainingConducted(String trainingConducted) {
		this.trainingConducted = trainingConducted;
	}
	public String getTrainingConductedDate() {
		return trainingConductedDate;
	}
	
	public void setTrainingConductedDate(String trainingConductedDate) {
		this.trainingConductedDate= trainingConductedDate;
	}
	public void setTrainingRecieved(String trainingRecieved) {
		this.trainingRecieved = trainingRecieved;
	}
	public String getTrainingRecievedDate() {
		return trainingRecievedDate;
	}
	
	public void setTrainingRecievedDate(String trainingRecievedDate) {
		this.trainingRecievedDate = trainingRecievedDate;
	}
	
	public String getTrainingRecieved() {
		return trainingRecieved;
	}
	
	
	
}
