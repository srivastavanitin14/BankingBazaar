package pojos;

import javax.persistence.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="bank_tbl")
public class Bank {

	private Integer bankId;
	@NotEmpty
	private String name;
	@NotEmpty
	@Email
	private String email;
	@NotEmpty
	private String password;
	@NotEmpty
	private String bankType;
	@NotEmpty
	private String hq;
	@NotEmpty
	private String customerCare;
	@NotEmpty
	private String website;
	
	@Id
	@GeneratedValue
	public Integer getBankId() {
		return bankId;
	}

	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}

	@Column(length=30,unique=true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length=30,unique=true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(length=20)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(length=20)
	public String getBankType() {
		return bankType;
	}

	public void setBankType(String bankType) {
		this.bankType = bankType;
	}

	@Column(length=30)
	public String getHq() {
		return hq;
	}

	public void setHq(String hq) {
		this.hq = hq;
	}

	@Column(length=10,unique=true)
	public String getCustomerCare() {
		return customerCare;
	}

	public void setCustomerCare(String customerCare) {
		this.customerCare = customerCare;
	}
	
	@Column(length=30,unique=true)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Override
	public String toString() {
		return "Bank [bankId=" + bankId + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", bankType=" + bankType + ", hq=" + hq + ", customerCare=" + customerCare + ", website=" + website
				+ "]";
	}

	public Bank(String name, String email, String password, String bankType, String hq,
			String customerCare, String website) {
		super();
		//this.bankId = bankId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.bankType = bankType;
		this.hq = hq;
		this.customerCare = customerCare;
		this.website = website;
	}

	public Bank() {
		// TODO Auto-generated constructor stub
		System.out.println("BankPojo");
	}
}
