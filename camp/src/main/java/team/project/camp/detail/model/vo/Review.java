package team.project.camp.detail.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Review {

	private int replyNo;
	private String reviewContents;
	private String createDate;
	private int campNo;
	private int memberNo;
	private String memberNickname;
	private String profileImage;
	private int campRate;
}
