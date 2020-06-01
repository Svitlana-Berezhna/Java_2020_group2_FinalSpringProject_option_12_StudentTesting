package ua.testing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.testing.entity.Theme;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
public interface ThemeRepository extends JpaRepository<Theme, Long> {
    Theme findByTheme(String theme);
}
