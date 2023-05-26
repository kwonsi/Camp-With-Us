package team.project.camp.detail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Reservation {

	private String campingName;
	private String buyerName;
	private int amount;
	private int people;

}
