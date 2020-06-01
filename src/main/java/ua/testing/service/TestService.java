package ua.testing.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.testing.entity.EmailSender;
import ua.testing.entity.User;
import ua.testing.repository.TestRepository;
import ua.testing.dto.TestDTO;

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
@Slf4j
@Service
public class TestService {
    @PersistenceContext
    private EntityManager em;
    TestRepository testRepository;

    @Autowired
    public TestService(TestRepository testRepository) {
        this.testRepository = testRepository;
    }

    @Transactional
    public void addQuestionsByThemeId(Long theme_id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        em.createNativeQuery(ua.testing.config.Query.DELETE_TESTS_BY_THEMEID_AND_USERID)
                .setParameter(1, theme_id)
                .setParameter(2, user.getId()).executeUpdate();
        em.createNativeQuery(ua.testing.config.Query.INSERT_TESTS_BY_THEMEID)
                .setParameter(1, theme_id)
                .setParameter(2, user.getId()).executeUpdate();
    }

    public List<TestDTO> allQuestionsByThemeId(Long theme_id) {
        List<TestDTO> questions = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        if (LocaleContextHolder.getLocale().equals(new Locale("ua", "UA")) ||
                LocaleContextHolder.getLocale().equals(new Locale("ua"))) {
            return testRepository.getQuestionsByTheme_idAndUser_idUa(theme_id, user.getId());
        } else {
            return testRepository.getQuestionsByTheme_idAndUser_idEn(theme_id, user.getId());
        }
    }

    @Transactional
    public void updateTest(Long theme_id, Long question_id, String answer) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        em.createNativeQuery("update tests set answer='" + answer + "' " +
                "where user_id=" + user.getId() + " and theme_id=" + theme_id + " and question_id=" +
                question_id).executeUpdate();
    }

    public void sendEmail() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        EmailSender emailSender = new EmailSender();
        emailSender.setTo(user.getUsername());
        emailSender.sendEmail();
    }
}
