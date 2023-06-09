package kh.final_project.dto;

import java.sql.Timestamp;

public class BoardsReplyDTO {
	private Integer seq;
	private Integer reply_type;
	private Integer parent_board;
	private Integer parent_reply;
	private Integer writer;
	private String txt;
	private Timestamp write_date;
	private String board_name;

	public BoardsReplyDTO() {
	}

	public BoardsReplyDTO(Integer seq, Integer reply_type, Integer parent_board, Integer parent_reply, Integer writer,
			String txt, Timestamp write_date, String board_name) {
		super();
		this.seq = seq;
		this.reply_type = reply_type;
		this.parent_board = parent_board;
		this.parent_reply = parent_reply;
		this.writer = writer;
		this.txt = txt;
		this.write_date = write_date;
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

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

}
