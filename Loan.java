package pojos;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="loans_tbl")
public class Loan implements Serializable {
	
	
	private static final long serialVersionUID = 1L;

	private Integer loanId;
	
	private Bank bank;
	
	private Double interestRate;
	
	private String loanType;
	
	private String loanFee;

	@Id
	@GeneratedValue
	public Integer getLoanId() {
		return loanId;
	}

	public void setLoanId(Integer loanId) {
		this.loanId = loanId;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="bank_id")
	public Bank getBank() {
		return bank;
	}

	
	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public Double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}

	@Column(length=20)
	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getLoanFee() {
		return loanFee;
	}

	public void setLoanFee(String loanFee) {
		this.loanFee = loanFee;
	}

	@Override
	public String toString() {
		return "Loan [loanId=" + loanId  + ", interestRate=" + interestRate + ", loanType="
				+ loanType + ", loanFee=" + loanFee + "]";
	}

	public Loan(Double interestRate, String loanType, String loanFee) {
		super();
		
		this.interestRate = interestRate;
		this.loanType = loanType;
		this.loanFee = loanFee;
	}

	public Loan() {
		super();
	}
	
}