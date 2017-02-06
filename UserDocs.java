package pojos;

import java.util.Arrays;

import javax.persistence.*;

@Entity
@Table(name="user_docs_tbl")
public class UserDocs {

	private Integer userDocsId;
	private User user;
	private byte[] idProof;
	private String contentTypeIdProof;
	private byte[] salarySlip;
	private String contentTypeSalarySlip;
	
	@Id
	@GeneratedValue
	public Integer getUserDocsId() {
		return userDocsId;
	}
	public void setUserDocsId(Integer userDocsId) {
		this.userDocsId = userDocsId;
	}
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Lob
	public byte[] getIdProof() {
		return idProof;
	}
	public void setIdProof(byte[] idProof) {
		this.idProof = idProof;
	}
	
	@Column(length=20)
	public String getContentTypeIdProof() {
		return contentTypeIdProof;
	}
	public void setContentTypeIdProof(String contentTypeIdProof) {
		this.contentTypeIdProof = contentTypeIdProof;
	}
	
	@Lob
	public byte[] getSalarySlip() {
		return salarySlip;
	}
	public void setSalarySlip(byte[] salarySlip) {
		this.salarySlip = salarySlip;
	}
	
	@Column(length=20)
	public String getContentTypeSalarySlip() {
		return contentTypeSalarySlip;
	}
	public void setContentTypeSalarySlip(String contentTypeSalarySlip) {
		this.contentTypeSalarySlip = contentTypeSalarySlip;
	}
	
	
	public UserDocs() {
		super();
	}
	@Override
	public String toString() {
		return "UserDocs [userDocsId=" + userDocsId + ", idProof=" + Arrays.toString(idProof) + ", contentTypeIdProof="
				+ contentTypeIdProof + ", salarySlip=" + Arrays.toString(salarySlip) + ", contentTypeSalarySlip="
				+ contentTypeSalarySlip + "]";
	}
	
	
}
