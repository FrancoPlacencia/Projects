package com.fp.jeopardyapi.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.jeopardyapi.model.Category;
import com.fp.jeopardyapi.model.Game;
import com.fp.jeopardyapi.model.Question;
import com.fp.jeopardyapi.model.Team;
import com.fp.jeopardyapi.repository.CategoryRepository;
import com.fp.jeopardyapi.repository.GameRepository;
import com.fp.jeopardyapi.repository.QuestionRepository;
import com.fp.jeopardyapi.repository.TeamRepository;
import com.fp.jeopardyapi.service.GameService;
import com.fp.jeopardyapi.structure.GameStructure;
import com.fp.jeopardyapi.structure.QuizzStructure;
import com.fp.jeopardyapi.structure.RoundStructure;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	QuestionRepository questionRepository;
	
	@Autowired
	GameRepository gameRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	TeamRepository teamRepository;
	
	@Override
	public boolean createGame(Game game) {
		for(int roundIndex = 1; roundIndex <= game.getRounds(); roundIndex++) {
			for(int quizzIndex = 1; quizzIndex <= game.getQuizzes(); quizzIndex++) {
				for(int categoryIndex = 1; categoryIndex <= game.getCategories(); categoryIndex++) {
					Question question = new Question();
					question.setGameId(game.getGameId());
					question.setRound(roundIndex);
					question.setQuizz(quizzIndex);
					question.setQuestionNumber(categoryIndex);
					Question questionSaved = questionRepository.save(question);
					System.out.println(questionSaved);
				}
			}
		}
		return true;
	}

	@Override
	public List<Game> allGames() {
		List<Game> games = new ArrayList<Game>();
    	games.addAll(gameRepository.findAll());
		return games;
	}

	@Override
	public Game getGame(Integer gameId) {
    	Optional<Game> optionalGame = gameRepository.findById(gameId);
    	Game game = optionalGame.get();
    	System.out.println("game "+ game);
		return game; 
	}

	@Override
	public Game newGame(Game game) {
		return gameRepository.save(game);
	}

	@Override
	public GameStructure getGameStructure(Game game) {
		GameStructure gameStructure = new GameStructure();
		gameStructure.setGame(game);
		List<RoundStructure> rounds = new ArrayList<RoundStructure>();
		for(int roundIndex = 1; roundIndex <= game.getRounds(); roundIndex++) {
			RoundStructure round = new RoundStructure();
			List<QuizzStructure> quizzes = new ArrayList<>();
			for(int quizzIndex = 1; quizzIndex <= game.getQuizzes(); quizzIndex++) {
				QuizzStructure quizz = new QuizzStructure();
				List<Question> questions = new ArrayList<Question>();
				questions.addAll(questionRepository.findByGameRoundQuizz(game.getGameId(), roundIndex, quizzIndex));
				quizz.setQuizzNumber(quizzIndex);
				quizz.setQuestions(questions);
				quizzes.add(quizz);
			}
			round.setQuizzes(quizzes);
			round.setRoundNumber(roundIndex);
			rounds.add(round);
		}
		gameStructure.setRounds(rounds);
		return gameStructure;
	}
	
	@Override
	public GameStructure getGameStructure(Game game, Integer roundIndex) {
		GameStructure gameStructure = new GameStructure();
		gameStructure.setGame(game);
		List<RoundStructure> rounds = new ArrayList<RoundStructure>();
		
		RoundStructure round = new RoundStructure();
		List<QuizzStructure> quizzes = new ArrayList<>();
		for(int quizzIndex = 1; quizzIndex <= game.getQuizzes(); quizzIndex++) {
			QuizzStructure quizz = new QuizzStructure();
			List<Question> questions = new ArrayList<Question>();
			questions.addAll(questionRepository.findByGameRoundQuizz(game.getGameId(), roundIndex, quizzIndex));
			quizz.setQuizzNumber(quizzIndex);
			quizz.setQuestions(questions);
			quizzes.add(quizz);
		}
		round.setQuizzes(quizzes);
		round.setRoundNumber(roundIndex);
		rounds.add(round);
		
		gameStructure.setRounds(rounds);
		
		return gameStructure;
	}

	@Override
	public Question getQuestion(Integer questionId) {
		return questionRepository.findById(questionId).get();
	}

	@Override
	public Question updateQuestion(Question question) {
		return questionRepository.save(question);
	}	
	
	@Override
	public List<Category> getCategoriesByGame(Game game){
		return categoryRepository.findByGameId(game.getGameId());
	}
	
	@Override
	public Category getCategoryByQuestion(Question question) {
		return categoryRepository.findByQuestion(question.getGameId(), question.getQuestionNumber());
	}

	@Override
	public List<Team> getTeamByGame(Game game) {
		return teamRepository.findByGame(game.getGameId());
	}

	@Override
	public Team getTeamByQuestion(Question question) {
		return teamRepository.findByQuestion(question.getTeamId());
	}

}
