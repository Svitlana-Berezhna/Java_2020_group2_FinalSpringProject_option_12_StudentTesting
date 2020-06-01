package ua.testing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.testing.dto.StatisticsDTO;
import ua.testing.service.StatisticsService;

import java.util.List;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Controller
public class StatisticsController {
    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/statistics")
    public String statisticsByUser_idAndTheme_id(Model model) {
        List<StatisticsDTO> statistics = statisticsService.getStatisticsByUser_idAndTheme_id();
        model.addAttribute("statistics", statistics);
        return "statistics";
    }
}
