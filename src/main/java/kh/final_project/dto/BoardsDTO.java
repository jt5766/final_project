package kh.final_project.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardsDTO {
	private Integer seq;
	private Integer board_type;
	private String title;
	private Integer writer;
	private String txt;
	private Timestamp write_date;
	private Integer total_count;
	private String board_name;

	public BoardsDTO() {
	}

	public BoardsDTO(Integer seq, Integer board_type, String title, Integer writer, String txt, Timestamp write_date,
			Integer total_count, String board_name) {
		super();
		this.seq = seq;
		this.board_type = board_type;
		this.title = title;
		this.writer = writer;
		this.txt = txt;
		this.write_date = write_date;
		this.total_count = total_count;
		this.board_name = board_name;
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getWriter() {
		return writer;
	}

	public void setWriter(Integer writer) {
		this.writer = writer;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public Integer getTotal_count() {
		return total_count;
	}

	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getFormed_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy\nMM-dd");
		long wd = this.write_date.getTime();
		Date date = new Date(wd);
		return sdf.format(date);
	}

	@Override
	public String toString() {
		return "BoardsDTO [seq=" + seq + ", board_type=" + board_type + ", title=" + title + ", writer=" + writer
				+ ", txt=" + txt + ", write_date=" + write_date + ", total_count=" + total_count + ", board_name="
				+ board_name + "]";
	}

}