package com.fp.jeopardyapi.structure;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoundStructure {

	private List<QuizzStructure> quizzes;
	
	private Integer roundNumber;
	
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("Round [ ");
		for(QuizzStructure quizz: quizzes) {
			str.append(quizz.toString());
		}
		str.append(" ]");
		return str.toString();
	}
}
