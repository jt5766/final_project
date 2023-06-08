package kh.final_project.dto;

import java.security.Timestamp;


public class MemberDTO {

    private Integer code;
    private Integer member_type;
    private String email;
    private Integer email_type;
    private String set_email_type;
    private String password;
    private String nickname;
    private Integer file_type;
    private String file_url;
    private String company;
    private String name;
    private String tel;
    private Timestamp join_date;
    private Timestamp stop_date;
    private String yn;


    public MemberDTO(Integer code, Integer member_type, String email, Integer email_type, String set_email_type, String password, String nickname, Integer file_type, String file_url, String company, String name, String tel, Timestamp join_date, Timestamp stop_date, String yn) {
        this.code = code;
        this.member_type = member_type;
        this.email = email;
        this.email_type = email_type;
        this.set_email_type = set_email_type;
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

    public Integer getFile_type() {
        return file_type;
    }

    public void setFile_type(Integer file_type) {
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

    @Override
    public String toString() {
        return "MemberDTO{" +
                "\ncode=" + code +
                "\nmember_type=" + member_type +
                "\nemail='" + email + '\'' +
                "\nemail_type=" + email_type +
                "\npassword='" + password + '\'' +
                "\nnickname='" + nickname + '\'' +
                "\nfile_type=" + file_type +
                "\nfile_url='" + file_url + '\'' +
                "\ncompany='" + company + '\'' +
                "\nname='" + name + '\'' +
                "\ntel='" + tel + '\'' +
                "\njoin_date=" + join_date +
                "\nstop_date=" + stop_date +
                "\nyn='" + yn + '\'' +
                '}';
    }
}
