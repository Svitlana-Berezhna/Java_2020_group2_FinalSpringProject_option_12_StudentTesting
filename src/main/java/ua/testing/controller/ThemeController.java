package ua.testing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.testing.entity.Theme;
import ua.testing.service.ThemeService;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Controller
public class ThemeController {
    @Autowired
    private ThemeService themeService;

    @GetMapping("/themes")
    public String themeList(Model model) {
        model.addAttribute("allThemes", themeService.allThemes());
        return "themes";
    }

    @PostMapping("/themes")
    public String deleteTheme(@RequestParam(required = true, defaultValue = "") Long themeId,
                              @RequestParam(required = true, defaultValue = "") String action,
                              Model model) {
        if (action.equals("delete")) {
            themeService.deleteTheme(themeId);
        }
        return "redirect:/themes";
    }

    @GetMapping("/theme/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Theme theme = themeService.findThemeById(id);
        model.addAttribute("theme", theme);
        return "theme";
    }

    @PostMapping("/theme")
    public String editTheme(@RequestParam(required = true, defaultValue = "") Long id,
                            @RequestParam(required = true, defaultValue = "") String theme,
                            @RequestParam(required = true, defaultValue = "") String description,
                            @RequestParam(required = true, defaultValue = "") String theme_en,
                            @RequestParam(required = true, defaultValue = "") String description_en,
                            @RequestParam(required = true, defaultValue = "") Long time,
                            @RequestParam(required = true, defaultValue = "") Long passing_grade,
                            @RequestParam(required = true, defaultValue = "") String action,
                            Model model) {
        if (action.equals("update")) {
            themeService.updateTheme(id, theme, description, theme_en, description_en, time, passing_grade);
        }
        return "redirect:/themes";
    }

    @GetMapping("/theme")
    public String newTheme() {
        return "theme";
    }

    @PostMapping("/theme_save")
    public String updateTheme(@RequestParam String theme, @RequestParam String description,
                              @RequestParam String theme_en, @RequestParam String description_en,
                              Long time, Long passing_grade) {
        themeService.saveTheme(new Theme(theme, description, theme_en, description_en, time, passing_grade));
        return "redirect:/themes";
    }
}
