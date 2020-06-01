package ua.testing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.testing.entity.Question;
import ua.testing.entity.Theme;
import ua.testing.service.QuestionService;
import ua.testing.service.ThemeService;

import java.util.List;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Controller
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    @Autowired
    private ThemeService themeService;

    @GetMapping("/questions")
    public String questionList(Model model) {
        model.addAttribute("allQuestions", questionService.allQuestionsByTheme_id(0L));
        return "questions";
    }

    @PostMapping("/questions")
    public String deleteQuestion(@RequestParam(required = true, defaultValue = "") Long questionId,
                                 @RequestParam(required = true, defaultValue = "") String action,
                                 Model model) {
        if (action.equals("delete")) {
            questionService.deleteQuestion(questionId);
        }
        return "redirect:/questions";
    }

    @GetMapping("/question/{question_id}")
    public String edit(@PathVariable Long question_id, Model model) {
        Question question = questionService.findQuestionById(question_id);
        model.addAttribute("question", question);
        return "question";
    }

    @PostMapping("/question/{question_id}")
    public String saveQuestion(@RequestParam Long question_id, @RequestParam Long theme_id,
                               @RequestParam String question,
                               @RequestParam String option1,
                               @RequestParam String option2,
                               @RequestParam String option3,
                               @RequestParam String option4,
                               @RequestParam String correct_answer,
                               @RequestParam String question_en,
                               @RequestParam String option1_en,
                               @RequestParam String option2_en,
                               @RequestParam String option3_en,
                               @RequestParam String option4_en,
                               @RequestParam String correct_answer_en) {
        questionService.updateQuestion(question_id, theme_id, question, option1, option2, option3, option4,
                correct_answer, question_en, option1_en, option2_en, option3_en, option4_en, correct_answer_en);
        return "redirect:/";
    }

    @PostMapping("/question")
    public String editQuestion(@RequestParam(required = true, defaultValue = "") Long question_id,
                               @RequestParam(required = true, defaultValue = "") Long theme_id,
                               @RequestParam(required = true, defaultValue = "") String question,
                               @RequestParam(required = true, defaultValue = "") String option1,
                               @RequestParam(required = true, defaultValue = "") String option2,
                               @RequestParam(required = true, defaultValue = "") String option3,
                               @RequestParam(required = true, defaultValue = "") String option4,
                               @RequestParam(required = true, defaultValue = "") String correct_answer,
                               @RequestParam(required = true, defaultValue = "") String question_en,
                               @RequestParam(required = true, defaultValue = "") String option1_en,
                               @RequestParam(required = true, defaultValue = "") String option2_en,
                               @RequestParam(required = true, defaultValue = "") String option3_en,
                               @RequestParam(required = true, defaultValue = "") String option4_en,
                               @RequestParam(required = true, defaultValue = "") String correct_answer_en,
                               @RequestParam(required = true, defaultValue = "") String action,
                               Model model) {
        if (action.equals("update")) {
            questionService.updateQuestion(question_id, theme_id, question, option1, option2, option3, option4,
                    correct_answer, question_en, option1_en, option2_en, option3_en, option4_en, correct_answer_en);
        }
        return "redirect:/questions";
    }

    @GetMapping("/question")
    public String newQuestion(Model model) {
        List<Theme> allThemes = themeService.allThemes();
        model.addAttribute("allThemes", allThemes);
        return "question";
    }

    @PostMapping("/question_save")
    public String updateQuestion(@RequestParam Long theme_id,
                                 @RequestParam String question, @RequestParam String option1,
                                 @RequestParam String option2, @RequestParam String option3,
                                 @RequestParam String option4, @RequestParam String correct_answer,
                                 @RequestParam String question_en, @RequestParam String option1_en,
                                 @RequestParam String option2_en, @RequestParam String option3_en,
                                 @RequestParam String option4_en, @RequestParam String correct_answer_en) {
        questionService.saveQuestion(new Question(theme_id, question, option1, option2, option3, option4, correct_answer,
                question_en, option1_en, option2_en, option3_en, option4_en, correct_answer_en));
        return "redirect:/questions";
    }

    @GetMapping("/questions/{theme_id}")
    public String questionsByTheme_id(@PathVariable Long theme_id, Model model) {
        List<Question> questionsByTheme_id = questionService.allQuestionsByTheme_id(theme_id);
        model.addAttribute("allQuestions", questionsByTheme_id);
        return "questions";
    }
}
