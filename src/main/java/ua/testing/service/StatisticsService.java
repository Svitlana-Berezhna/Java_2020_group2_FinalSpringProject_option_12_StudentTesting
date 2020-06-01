package ua.testing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import ua.testing.dto.StatisticsDTO;
import ua.testing.repository.TestRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Locale;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Service
public class StatisticsService {
    @PersistenceContext
    private EntityManager em;

    @Autowired
    TestRepository testRepository;

    @Autowired
    public StatisticsService(TestRepository testRepository) {
        this.testRepository = testRepository;
    }

    public List<StatisticsDTO> getStatisticsByUser_idAndTheme_id() {
        if (LocaleContextHolder.getLocale().equals(new Locale("ua", "UA")) ||
                LocaleContextHolder.getLocale().equals(new Locale("ua"))) {
            return testRepository.getStatisticsByUser_idAndTheme_idUa();
        } else {
            return testRepository.getStatisticsByUser_idAndTheme_idEn();
        }
    }
}
