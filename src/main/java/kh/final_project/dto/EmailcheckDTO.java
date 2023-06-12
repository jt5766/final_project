package kh.final_project.dto;

public class EmailcheckDTO {
    private String email;
    private int email_type;


    public EmailcheckDTO(){}
    public EmailcheckDTO(String email, int email_type) {
        this.email = email;
        this.email_type = email_type;
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
}
