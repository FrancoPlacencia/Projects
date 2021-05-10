package com.fp.jeopardyapi.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fp.jeopardyapi.model.Category;
import com.fp.jeopardyapi.model.Game;
import com.fp.jeopardyapi.model.Question;
import com.fp.jeopardyapi.service.GameService;
import com.fp.jeopardyapi.structure.GameStructure;

@Controller
public class AdminController {
	
	@Autowired
	GameService gameService;

	@GetMapping("admin")
    public String admin(Model model) {
    	model.addAttribute("games", gameService.allGames());
    	return "admin";
    }
    
    @GetMapping("admin/edit")
    public String editGame(@RequestParam(value = "gameValue", required = true) Integer gameId, Model model) {
    	Game game = gameService.getGame(gameId);
    	GameStructure gameStructure = gameService.getGameStructure(game);
    	List<Category> categories = gameService.getCategoriesByGame(game);
    	model.addAttribute("game", gameStructure);
    	model.addAttribute("categories", categories);
    	return "edit";
    }
    
    @GetMapping("admin/question/edit")
    public String editQuestion(@RequestParam(value = "questionId", required = true) Integer questionId, Model model) {
    	Question question = gameService.getQuestion(questionId);
    	Category category = gameService.getCategoryByQuestion(question);
    	model.addAttribute("question", question);
    	model.addAttribute("category", category);
    	return "edit-question";
    }
    
    @PostMapping("admin/question/update")
    public String editQuestion(@ModelAttribute Question questionForm, RedirectAttributes redirectAttributes) {
    	Question question = gameService.getQuestion(questionForm.getQuestionId());
    	question.setQuestionContent(questionForm.getQuestionContent());
    	question.setAnswer(questionForm.getAnswer());
    	gameService.updateQuestion(question);
    	redirectAttributes.addAttribute("gameValue", question.getGameId());
    	return "redirect:/admin/edit";
    }
    
    @GetMapping("admin/new")
    public String newGame() {
    	Game game = new Game();
    	game.setDescription("Test Game");
    	game.setUserId(1);
    	game.setCategories(6);
    	game.setQuizzes(5);
    	Game newGame = gameService.newGame(game);
    	gameService.createGame(newGame);
    	return "admin";
    }
	
}
