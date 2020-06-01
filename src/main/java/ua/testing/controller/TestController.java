package ua.testing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;
import ua.testing.dto.TestDTO;
import ua.testing.service.TestService;

import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Controller
public class TestController {
    @Autowired
    private TestService testService;

    static String PAGINATION_BUNDLE_NAME = "pagination";
    public static final ResourceBundle bundle = ResourceBundle.getBundle(PAGINATION_BUNDLE_NAME);

    @PostMapping("/tests/{theme_id}")
    public String allQuestions(HttpServletRequest request, @PathVariable Long theme_id, Model model) {
        testService.addQuestionsByThemeId(theme_id);
        List<TestDTO> allQuestions = testService.allQuestionsByThemeId(theme_id);
        PagedListHolder pagedListHolder = new PagedListHolder(allQuestions);
        int page = ServletRequestUtils.getIntParameter(request, "p",
                Integer.parseInt(bundle.getString("page")));
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(Integer.parseInt(bundle.getString("pageSize")));
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "tests";
    }

    @PostMapping("/test_save")
    public String updateTest(
            @RequestParam Long theme_id, @RequestParam Long question_id,
            @RequestParam String answer, @RequestParam int page, @RequestParam int pageCount) {
        if (page < pageCount - 1) {
            page++;
        }
        testService.updateTest(theme_id, question_id, answer);
        return "redirect:/tests/" + theme_id + "?p=" + page;
    }

    @GetMapping("/tests/{theme_id}")
    public String index(HttpServletRequest request, @PathVariable Long theme_id, Model model) {
        List<TestDTO> allQuestions = testService.allQuestionsByThemeId(theme_id);
        PagedListHolder pagedListHolder = new PagedListHolder(allQuestions);
        int page = ServletRequestUtils.getIntParameter(request, "p",
                Integer.parseInt(bundle.getString("page")));
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(Integer.parseInt(bundle.getString("pageSize")));
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "tests";
    }

    @GetMapping("/results/{theme_id}")
    public String resultList(@PathVariable Long theme_id, Model model) {
        List<TestDTO> allQuestionsByThemeId = testService.allQuestionsByThemeId(theme_id);
        int correct_answers = 0;
        for (TestDTO test : allQuestionsByThemeId) {
            if (test.getGrade() == 1) {
                correct_answers++;
            }
        }
        int total_questions = allQuestionsByThemeId.size();
        int total_grade = (int) Math.round((float) correct_answers * 100 / total_questions);
        model.addAttribute("allQuestionsByThemeId", allQuestionsByThemeId);
        model.addAttribute("correct_answers", correct_answers);
        model.addAttribute("total_grade", total_grade);
        model.addAttribute("total_questions", total_questions);
        testService.sendEmail();
        return "results";
    }
}
