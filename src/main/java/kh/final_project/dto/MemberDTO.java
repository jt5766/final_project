package kh.final_project.dto;

import java.security.Timestamp;


public class MemberDTO {

    private int code;
    private String member_type;
    private String email;
    private int email_type;
    private String password;
    private String nickname;
    private int file_type;
    private String file_url;
    private String company;
    private String name;
    private String tel;
    private Timestamp join_date;
    private Timestamp stop_date;
    private String yn;


    public MemberDTO() {

    }

    public MemberDTO(int code, String member_type, String email, int email_type, String password, String nickname, int file_type, String file_url, String company, String name, String tel, Timestamp join_date, Timestamp stop_date, String yn) {
        this.code = code;
        this.member_type = member_type;
        this.email = email;
        this.email_type = email_type;
        this.password = password;
        this.nickname = nickname;
        this.file_type = file_type;
        this.file_url = file_url;
        this.company = company;
        this.name = name;
        this.tel = tel;
        this.join_date = join_date;
        this.stop_date = stop_date;
        this.yn = yn;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMember_type() {
        return member_type;
    }

    public void setMember_type(String member_type) {
        this.member_type = member_type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEmail_type() {
        return email_type;
    }

    public void setEmail_type(int email_type) {
        this.email_type = email_type;
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

    public int getFile_type() {
        return file_type;
    }

    public void setFile_type(int file_type) {
        this.file_type = file_type;
    }

    public String getFile_url() {
        return file_url;
    }

    public void setFile_url(String file_url) {
        this.file_url = file_url;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
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
}
