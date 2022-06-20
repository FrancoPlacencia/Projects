package com.fp.jeopardyapi.structure;

import java.util.List;

import com.fp.jeopardyapi.model.Game;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameStructure {
	
	private List<RoundStructure> rounds;
	
	private Game game;
	
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		str.append("Game [ ");
		for(RoundStructure round: rounds) {
			str.append(round.toString());
		}
		str.append(" ]");
		return str.toString();
	}

}
