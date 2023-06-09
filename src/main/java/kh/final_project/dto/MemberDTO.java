package kh.final_project.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private Integer code;
	private Integer member_type;
	private String email;
	private Integer email_type;
	private String set_email_type;
	private String random_key;
	private String password;
	private String nickname;
	private String file_url;
	private String name;
	private String tel;
	private Timestamp join_date;
	private Timestamp stop_date;
	private String yn;

	public MemberDTO() {
		super();
	}

	public MemberDTO(Integer code, Integer member_type, String email, Integer email_type, String set_email_type, String random_key, String password, String nickname, String file_url, String name, String tel, Timestamp join_date, Timestamp stop_date, String yn) {
		super();
		this.code = code;
		this.member_type = member_type;
		this.email = email;
		this.email_type = email_type;
		this.set_email_type = set_email_type;
		this.random_key = random_key;
		this.password = password;
		this.nickname = nickname;
		this.file_url = file_url;
		this.name = name;
		this.tel = tel;
		this.join_date = join_date;
		this.stop_date = stop_date;
		this.yn = yn;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getMember_type() {
		return member_type;
	}

	public void setMember_type(Integer member_type) {
		this.member_type = member_type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getEmail_type() {
		return email_type;
	}

	public void setEmail_type(Integer email_type) {
		this.email_type = email_type;
	}

	public String getSet_email_type() {
		return set_email_type;
	}

	public void setSet_email_type(String set_email_type) {
		this.set_email_type = set_email_type;
	}

	public String getRandom_key() {
		return random_key;
	}

	public void setRandom_key(String random_key) {
		this.random_key = random_key;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFile_url() {
		return file_url;
	}

	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public Timestamp getStop_date() {
		return stop_date;
	}

	public void setStop_date(Timestamp stop_date) {
		this.stop_date = stop_date;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	@Override
	public String toString() {
		return "MemberDTO [code=" + code + ", member_type=" + member_type + ", email=" + email + ", email_type=" + email_type + ", set_email_type=" + set_email_type + ", random_key=" + random_key + ", password=" + password + ", nickname=" + nickname + ", file_url=" + file_url + ", name=" + name + ", tel=" + tel + ", join_date=" + join_date + ", stop_date=" + stop_date + ", yn=" + yn + "]";
	}

}
