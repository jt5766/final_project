package kh.final_project.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class ComplaintBoardsDTO {
	private Integer seq;
	private Integer board_type;
	private String complaint_type;
	private String title;
	private String writer;
	private String txt;
	private Timestamp write_date;
	private String process;
	private Timestamp process_date;
	private String board_name;

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getBoard_type() {
		return board_type;
	}

	public void setBoard_type(Integer board_type) {
		this.board_type = board_type;
	}

	public String getComplaint_type() {
		return complaint_type;
	}

	public void setComplaint_type(String complaint_type) {
		this.complaint_type = complaint_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Timestamp getProcess_date() {
		return process_date;
	}

	public void setProcess_date(Timestamp process_date) {
		this.process_date = process_date;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public ComplaintBoardsDTO() {
	}

	public ComplaintBoardsDTO(Integer seq, Integer board_type, String complaint_type, String title, String writer,
			String txt, Timestamp write_date, String process, Timestamp process_date, String board_name) {
		super();
		this.seq = seq;
		this.board_type = board_type;
		this.complaint_type = complaint_type;
		this.title = title;
		this.writer = writer;
		this.txt = txt;
		this.write_date = write_date;
		this.process = process;
		this.process_date = process_date;
		this.board_name = board_name;
	}

	public String getTxt() {
		String proceed = StringEscapeUtils.unescapeHtml4(this.txt);
		Whitelist customWhitelist = Whitelist.none()
				.addTags("a", "b", "blockquote", "br", "caption", "cite", "code", "col", "colgroup", "dd", "div", "dl",
						"dt", "em", "h1", "h2", "h3", "h4", "h5", "h6", "i", "img", "li", "ol", "p", "pre", "q",
						"small", "span", "strike", "strong", "sub", "sup", "table", "tbody", "td", "tfoot", "th",
						"thead", "tr", "u", "ul")
				.addAttributes("a", "href", "title").addAttributes("blockquote", "cite")
				.addAttributes("col", "span", "width").addAttributes("colgroup", "span", "width")
				.addAttributes("img", "align", "alt", "height", "src", "title", "width", "data-filename")
				.addAttributes("ol", "start", "type").addAttributes("q", "cite")
				.addAttributes("table", "summary", "width")
				.addAttributes("td", "abbr", "axis", "colspan", "rowspan", "width")
				.addAttributes("th", "abbr", "axis", "colspan", "rowspan", "scope", "width")
				.addAttributes("ul", "type");
		String cleanedTxt = Jsoup.clean(proceed, customWhitelist);
		return cleanedTxt;
	}

	public String getFormed_date() {
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date currentDate = new Date(System.currentTimeMillis());
		Date date = new Date(this.getWrite_date().getTime());
		long diff = currentDate.getTime() - date.getTime();
		long oneDay = 24 * 60 * 60 * 1000;
		if (diff >= oneDay) {
			sdf.applyPattern("yyyy\nMM-dd");
		} else {
			sdf.applyPattern("HH:mm:ss");
		}
		return sdf.format(date);
	}

	public String getFull_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.write_date);
	}

	@Override
	public String toString() {
		return "ComplaintBoardsDTO [seq=" + seq + ", board_type=" + board_type + ", complaint_type=" + complaint_type
				+ ", title=" + title + ", writer=" + writer + ", txt=" + txt + ", write_date=" + write_date
				+ ", process=" + process + ", process_date=" + process_date + "]";
	}

}
