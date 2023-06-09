package kh.final_project.services;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.mail.MailHandler;
import kh.final_project.repositories.EmailcheckDAO;
import kh.final_project.repositories.MemberDAO;
import kh.final_project.repositories.TypeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService {

	@Autowired
	private EmailcheckDAO edao;

	@Autowired
	private MemberDAO mdao;

	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private TypeDAO typeDAO;

	public List<EmailTypeDTO> emailType() {
		return mdao.emailType();
	}

	public String getEmailName(MemberDTO dto) {
		return mdao.getEmailName(dto);
	}

	public void sendJoinCertificationMail(MemberDTO dto) throws MessagingException, UnsupportedEncodingException {

		// 이메일 인증하는 순간 멤버타입 , 이메일 타입, 이메일 따로 저장
		UUID uuid = UUID.randomUUID();
		dto.setRandom_key(String.valueOf(uuid));
		edao.addemail(dto);

		MailHandler sendMail = new MailHandler(javaMailSender);
		sendMail.setSubject("[Kreate-Hub 이메일 인증메일 입니다.]"); // 메일제목
		sendMail.setText("<h1>Kreate-Hub 메일인증</h1>" + "<br>Kreate-Hub 오신것을 환영합니다!" + "<br>아래 [이메일 인증 확인]을 눌러주세요." + "<br><a href='http://3.39.227.39/member/register?member_type=" + dto.getMember_type() + "&email=" + dto.getEmail() + "&email_type=" + dto.getEmail_type() + "&random_key=" + dto.getRandom_key() + "'>이메일 인증 확인</a>");
		sendMail.setFrom("rkqudwns@gmail.com", "Kreate-Hub");
		sendMail.setTo(dto.getEmail() + "@" + dto.getSet_email_type());
		sendMail.send();

	}

	public boolean findPassword(MemberDTO dto) throws MessagingException, UnsupportedEncodingException {
		this.emailTypeChange(dto);

		String emailName = this.getEmailName(dto);
		dto.setSet_email_type(emailName);

		boolean result = this.duplicationEmail(dto);


		if (result) {
			UUID uuid = UUID.randomUUID();
			dto.setRandom_key(String.valueOf(uuid));

			MailHandler sendMail = new MailHandler(javaMailSender);
			sendMail.setSubject("[Kreate-Hub 비밀번호찾기 메일 입니다.]");
			sendMail.setText("<h1>Kreate-Hub 비밀번호 찾기</h1>" +

					"<br>아래 [비밀번호 찾기를 눌러주세요]" + "<br><a href='http://3.39.227.39/member/tofindPassword" + "?email=" + dto.getEmail() + "&email_type=" + dto.getEmail_type() + "&random_key=" + dto.getRandom_key() + "'>비밀번호 찾기</a>");
			sendMail.setFrom("rkqudwns@gmail.com", "Kreate-Hub");

			sendMail.setTo(dto.getEmail() + "@" + dto.getSet_email_type());
			sendMail.send();
			return result;
		} else {
			return result;
		}
	}

	public void emailTypeChange(MemberDTO dto) {
		String email = dto.getEmail();
		String[] mail = email.split("@");
		dto.setEmail(mail[0]);
		Integer email_type = mdao.getEmailCode(mail[1]);
		dto.setEmail_type(email_type);
//        if(mail[1].equals("gmail.com")){
//            dto.setEmail_type(1001);
//        } else if (mail[1].equals("naver.com")) {
//            dto.setEmail_type(1002);
//        } else if (mail[1].equals("daum.net")) {
//            dto.setEmail_type(1003);
//        }else if (mail[1].equals("nate.com")) {
//            dto.setEmail_type(1004);
//        }

	}

	public int insertMember(MemberDTO dto, MultipartFile file, String realPath) throws Exception {
		String path = "/resources/member";
		File realPathFile = new File(realPath);
		if (!realPathFile.exists())
			realPathFile.mkdirs();
		if (file != null) {

			String oriName = file.getOriginalFilename();

			String[] arr = oriName.split("\\.");

			String sysname = dto.getEmail() + "_" + dto.getEmail_type() + "." + arr[arr.length - 1];

			String fileURL = realPath + "/" + sysname;

			String url = path + "/" + sysname;
			file.transferTo(new File(fileURL));
			dto.setFile_url(url);
		}


		return mdao.insert(dto);

	}



	public void updatePassword(MemberDTO dto) {
		mdao.updatePassword(dto);
	}

	public void login(MemberDTO dto) {
		mdao.login(dto);
	}

	public void loginYupdate(MemberDTO dto){
		mdao.loginYupdate(dto);
	}

	public boolean passwordCheck(MemberDTO dto) {
		return mdao.passwordCheck(dto);
	}

	public MemberDTO selectDTO(int code) {

		return mdao.selectDTO(code);
	}

	public void update(MemberDTO dto) {
		mdao.update(dto);
	}

	public List<List<CategoryType>> getTypes() {
		List<CategoryType> categoryTypes = typeDAO.selectByCategoryType();
		List<CategoryType> boardTypes = typeDAO.selectByBoardType();
		return List.of(categoryTypes, boardTypes);
	}

	public int memeberDelete(int code) {
		return mdao.memberDelete(code);
	}

	public int nicknameDuplicateCheck(String nickname) {
		return mdao.nicknameDuplicateCheck(nickname);
	}

	public boolean duplicationEmail(MemberDTO dto) {
		return mdao.duplicationEmail(dto);
	}

	public void logOut(Integer code) {
		mdao.logout(code);
	}
}
