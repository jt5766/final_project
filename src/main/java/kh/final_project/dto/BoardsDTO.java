package kh.final_project.dto;

import java.sql.Timestamp;

public class BoardsDTO {
	private Integer seq;
	private Integer board_type;
	private String title;
	private String writer;
	private String txt;
	private Timestamp write_date;
	private Integer total_count;
	private String board_name;

	public BoardsDTO() {
	}

}