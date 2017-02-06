package pojos;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.persistence.*;

@Entity
@Table(name="application_tbl")
public class Application {

	private Integer applicationId;
	
	private User user;
	
	private Loan appliedLoan;
	
	private Double loanAmount;
	
	private Integer loanDuration; 			// In Years
	
	private Double emi;
	
	private String appStatus;

	private String appliedDate;
	
	@Override
	public String toString() {
		return "Application [applicationId=" + applicationId + /*", appliedLoan=" + appliedLoan
				+ */", loanAmount=" + loanAmount + ", loanDuration=" + loanDuration + ", emi=" + emi + ", appStatus="
				+ appStatus + "]";
	}

	@Id
	@GeneratedValue
	public Integer getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Integer applicationId) {
		this.applicationId = applicationId;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="loan_id")
	public Loan getAppliedLoan() {
		return appliedLoan;
	}

	public void setAppliedLoan(Loan appliedLoan) {
		this.appliedLoan = appliedLoan;
	}

	public Double getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(Double loanAmount) {
		this.loanAmount = loanAmount;
	}

	public Integer getLoanDuration() {
		return loanDuration;
	}

	public void setLoanDuration(Integer loanDuration) {
		this.loanDuration = loanDuration;
	}

	public Double getEmi() {
		return emi;
	}

	public void setEmi(Double emi) {
		this.emi = emi;
	}

	public String getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	public Application() {
		super();
		appStatus = "Pending";
		Calendar calender = new GregorianCalendar();
		appliedDate = calender.get(Calendar.DATE)+"/"+(calender.get(Calendar.MONTH)+1)+"/"+calender.get(Calendar.YEAR);
	}

	public String getAppliedDate() {
		return appliedDate;
	}

	public void setAppliedDate(String appliedDate) {
		this.appliedDate = appliedDate;
	}
	
}
