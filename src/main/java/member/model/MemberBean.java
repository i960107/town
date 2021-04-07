package member.model;

public class MemberBean {

	private String id;
	private String pw;
	private String name;
	private String gender;
	private String phonenumber;
	private String email;
	private String address;
	private String address1;
	private String address2;
	private String address3;
	private String image; // 프로필사진
	private String memberstatus; // 계정중지
	private int authority; // 관리자 권한

	public MemberBean() {
		super();
	}

	public MemberBean(String id, String pw, String name, String gender, String phonenumber, String email,
			String address, String address1, String address2, String address3, String image, String memberstatus,
			int authority) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.email = email;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.image = image;
		this.memberstatus = memberstatus;
		this.authority = authority;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMemberstatus() {
		return memberstatus;
	}

	public void setMemberstatus(String memberstatus) {
		this.memberstatus = memberstatus;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

}
