package team.project.camp.detail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Review {

	private int reviewNo;
	private String reviewContents;
	private String createDate;
	private int campNo;
	private int memberNo;
	private String memberNickname;
	private String profileImage;
	private int campRate;
	private String campName;
}
