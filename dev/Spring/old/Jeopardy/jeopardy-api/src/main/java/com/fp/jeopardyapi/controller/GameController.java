package com.fp.jeopardyapi.controller;

import com.fp.jeopardyapi.model.Question;
import com.fp.jeopardyapi.model.Team;
import com.fp.jeopardyapi.model.Category;
import com.fp.jeopardyapi.model.Game;
import com.fp.jeopardyapi.service.GameService;
import com.fp.jeopardyapi.structure.GameStructure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class GameController {
  
    @Autowired
    GameService gameService;
    
    @GetMapping("/")
    public String index(Model model) {
    	model.addAttribute("games", gameService.allGames());
    	return "index";
    }
       
    @GetMapping("game")
    public String game(@RequestParam(value = "gameId", required = true) Integer gameId, Model model) {
        Game game = gameService.getGame(gameId);
    	GameStructure gameStructure = gameService.getGameStructure(game, 1);
    	List<Category> categories = gameService.getCategoriesByGame(game);
    	List<Team> teams = gameService.getTeamByGame(game);
    	int teamCol = getColByTeamSize(teams.size());
    	model.addAttribute("game", gameStructure);
    	model.addAttribute("categories", categories);
        model.addAttribute("teams", teams);
        model.addAttribute("teamCol", teamCol);
        return "game";
    }
    
    @PostMapping("question")
    public String question(@RequestParam(value = "questionId", required = true) Integer questionId, @RequestParam(value = "teamId", required = true) Integer teamId, Model model) {
    	Question question = gameService.getQuestion(questionId);
    	Category category = gameService.getCategoryByQuestion(question);
        question.setTeamId(teamId);
        question = gameService.updateQuestion(question);
        model.addAttribute("question", question);
    	model.addAttribute("category", category);
        return "question";
    }
    
    @PostMapping("/answer/correct")
    public String correct(@RequestParam(value = "questionId", required = true) Integer questionId, RedirectAttributes redirectAttributes) {
    	Question question = gameService.getQuestion(questionId);
        Team team = gameService.getTeamByQuestion(question);
        team.setScore(team.getScore() + 200);//(question.getQuizz() * 200));
        question.setCompleted(1);
        question = gameService.updateQuestion(question);
        redirectAttributes.addAttribute("gameId", question.getGameId());
        return "redirect:/game";
    }
    
    @PostMapping("/answer/incorrect")
    public String incorrect(@RequestParam(value = "questionId", required = true) Integer questionId, RedirectAttributes redirectAttributes) {
    	Question question = gameService.getQuestion(questionId);
        question.setCompleted(1);
        question = gameService.updateQuestion(question);
        redirectAttributes.addAttribute("gameId", question.getGameId());
        return "redirect:/game";
    }
    
    private Integer getColByTeamSize(int size) {
    	int retVal = 0;
    	switch(size) {
    		case 6:
    			retVal = 2;
    			break;
    		case 5:
    			retVal = 2;
    			break;
    		case 4: 
    			retVal = 3;
    			break;
    		case 3:
    			retVal = 4;
    			break;
    		case 2:
    			retVal = 6;
    			break;
    	}
    	return retVal;
    }
}
