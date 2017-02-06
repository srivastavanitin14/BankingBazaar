package pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="user_tbl")
public class User {

	private Integer userId;
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty
	private String password;
	
	@NotEmpty
	private String dob;
	
	@NotEmpty
	private String mobileNo;
	
	@NotEmpty
	private String address;
	
	@NotEmpty
	private String city;
	
	@NotEmpty
	private String state;
	
	@NotEmpty
	private String pincode;
	
	
	//Placeholder for fileupload locations
	//private byte[] idCard;
	//private byte[] salarySlip;

	@Id
	@GeneratedValue
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(length=30)
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
	
	/*@Temporal(TemporalType.DATE)*/
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	@Column(length=10,unique=true)
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(length=20)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(length=20)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(length=6)
	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	/*@Lob
	public byte[] getIdCard() {
		return idCard;
	}

	public void setIdCard(byte[] idCard) {
		this.idCard = idCard;
	}

	@Lob
	public byte[] getSalarySlip() {
		return salarySlip;
	}

	public void setSalarySlip(byte[] salarySlip) {
		this.salarySlip = salarySlip;
	}
*/
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", email=" + email + ", password=" + password + ", dob="
				+ dob + ", mobileNo=" + mobileNo + ", address=" + address + ", city=" + city + ", state=" + state
				+ ", pincode=" + pincode + "]";
	}
	
	

	public User() {
		// TODO Auto-generated constructor stub
		System.out.println("UserPojo");
	}
}
