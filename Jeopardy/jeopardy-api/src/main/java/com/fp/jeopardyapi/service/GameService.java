package com.fp.jeopardyapi.service;

import java.util.List;

import com.fp.jeopardyapi.model.Category;
import com.fp.jeopardyapi.model.Game;
import com.fp.jeopardyapi.model.Question;
import com.fp.jeopardyapi.model.Team;
import com.fp.jeopardyapi.structure.GameStructure;

public interface GameService {
	
	public boolean createGame(Game game);
	
	public List<Game> allGames();
	
	public Game getGame(Integer gameId);
	
	public Game newGame(Game game);
	
	public GameStructure getGameStructure(Game game);
	
	public GameStructure getGameStructure(Game game, Integer round);
	
	/* Questions */
	public Question getQuestion(Integer questionId);

	public Question updateQuestion(Question question);

	/* Categories */
	List<Category> getCategoriesByGame(Game game);

	Category getCategoryByQuestion(Question question);
	
	/* Teams */
	List<Team> getTeamByGame(Game game);
	
	Team getTeamByQuestion(Question question);
		

}
