package kh.final_project.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardsReplyDTO {
	private Integer seq;
	private Integer reply_type;
	private Integer parent_board;
	private Integer parent_reply;
	private String writer;
	private String txt;
	private Timestamp write_date;
	private Integer board_type;
	private String board_name;

	public BoardsReplyDTO() {
	}

	public BoardsReplyDTO(Integer seq, Integer reply_type, Integer parent_board, Integer parent_reply, String writer,
			String txt, Timestamp write_date, Integer board_type, String board_name) {
		super();
		this.seq = seq;
		this.reply_type = reply_type;
		this.parent_board = parent_board;
		this.parent_reply = parent_reply;
		this.writer = writer;
		this.txt = txt;
		this.write_date = write_date;
		this.board_type = board_type;
		this.board_name = board_name;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getReply_type() {
		return reply_type;
	}

	public void setReply_type(Integer reply_type) {
		this.reply_type = reply_type;
	}

	public Integer getParent_board() {
		return parent_board;
	}

	public void setParent_board(Integer parent_board) {
		this.parent_board = parent_board;
	}

	public Integer getParent_reply() {
		return parent_reply;
	}

	public void setParent_reply(Integer parent_reply) {
		this.parent_reply = parent_reply;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
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

	public Integer getBoard_type() {
		return board_type;
	}

	public void setBoard_type(Integer board_type) {
		this.board_type = board_type;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getFormed_date() {
		SimpleDateFormat sdf = new SimpleDateFormat();
		Date currentDate = new Date(System.currentTimeMillis());
		Date date = new Date(this.getWrite_date().getTime());
		long diff = currentDate.getTime() - date.getTime();
		long oneDay = 24 * 60 * 60 * 1000;
		if (diff >= oneDay) {
			sdf.applyPattern("yyyy-MM-dd");
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
		return "BoardsReplyDTO [seq=" + seq + ", reply_type=" + reply_type + ", parent_board=" + parent_board
				+ ", parent_reply=" + parent_reply + ", writer=" + writer + ", txt=" + txt + ", write_date="
				+ write_date + ", board_type=" + board_type + ", board_name=" + board_name + "]";
	}

}
