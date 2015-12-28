package bean;

/**
 * This class provides getters and setters for Employee evaluation.
 *
 */
public class EmployeeEvaluationBean {
private long managerId;
private long employeeId;

public long getManagerId() {
	return managerId;
}
public void setManagerId(long managerId) {
	this.managerId = managerId;
}
public long getEmployeeId() {
	return employeeId;
}
public void setEmployeeId(long employeeId) {
	this.employeeId = employeeId;
}
public int getProactiveness() {
	return proactiveness;
}
public void setProactiveness(int proactiveness) {
	this.proactiveness = proactiveness;
}
public int getCommunication() {
	return communication;
}
public void setCommunication(int communication) {
	this.communication = communication;
}
public int getTeamWork() {
	return teamWork;
}
public void setTeamWork(int teamWork) {
	this.teamWork = teamWork;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public int getLeadership() {
	return leadership;
}
public void setLeadership(int leadership) {
	this.leadership = leadership;
}
private int proactiveness;
private int communication;
private int teamWork;
private int rating;
private int leadership;


}
