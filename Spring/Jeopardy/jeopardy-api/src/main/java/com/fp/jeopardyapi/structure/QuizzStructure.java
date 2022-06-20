package com.fp.jeopardyapi.structure;

import java.util.List;

import com.fp.jeopardyapi.model.Question;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuizzStructure {
	
	private List<Question> questions;
	
	private Integer quizzNumber;
	
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("Quizz [ ");
		for(Question question: questions) {
			str.append(question.toString());
		}
		str.append(" ]");
		return str.toString();
	}

}
