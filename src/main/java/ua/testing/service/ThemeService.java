package ua.testing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import ua.testing.entity.Theme;
import ua.testing.repository.ThemeRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Service
public class ThemeService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    ThemeRepository themeRepository;

    public Theme findThemeById(Long themeId) {
        Optional<Theme> themeFromDb = themeRepository.findById(themeId);
        return themeFromDb.orElse(new Theme());
    }

    public List<Theme> allThemes() {
        List<Theme> themes = null;
        if (LocaleContextHolder.getLocale().equals(new Locale("ua", "UA")) ||
                LocaleContextHolder.getLocale().equals(new Locale("ua"))) {
            themes = em.createNativeQuery("select t.id, t.theme, t.description, " +
                    "t.theme_en, t.description_en, t.time, t.passing_grade " +
                    "from Themes t", Theme.class)
                    .getResultList();
        }
        if (LocaleContextHolder.getLocale().equals(new Locale("en"))) {
            themes = em.createNativeQuery("select t.id, t.theme_en as theme, t.description_en as description, " +
                    "'' as theme_en, '' as description_en, t.time, t.passing_grade " +
                    "from Themes t", Theme.class)
                    .getResultList();
        }
        return themes;
    }

    public boolean saveTheme(Theme theme) {
        Theme themeFromDB = themeRepository.findByTheme(theme.getTheme());
        if (themeFromDB != null) {
            return false;
        }
        theme.setTheme(theme.getTheme());
        theme.setDescription(theme.getDescription());
        theme.setTheme_en(theme.getTheme_en());
        theme.setDescription_en(theme.getDescription_en());
        theme.setTime(theme.getTime());
        theme.setPassing_grade(theme.getPassing_grade());
        themeRepository.save(theme);
        return true;
    }

    public boolean deleteTheme(Long themeId) {
        if (themeRepository.findById(themeId).isPresent()) {
            themeRepository.deleteById(themeId);
            return true;
        }
        return false;
    }

    public List<Theme> themegtList(Long idMin) {
        return em.createQuery("select u from Theme u where u.id > :paramId", Theme.class)
                .setParameter("paramId", idMin).getResultList();
    }

    public void updateTheme(Long id, String theme, String description, String theme_en, String description_en,
                            Long time, Long passing_grade) {
        Theme updated = themeRepository.findById(id).orElse(null);
        updated.setTheme(theme);
        updated.setDescription(description);
        updated.setTheme_en(theme_en);
        updated.setDescription_en(description_en);
        updated.setTime(time);
        updated.setPassing_grade(passing_grade);
        themeRepository.save(updated);
    }
}
