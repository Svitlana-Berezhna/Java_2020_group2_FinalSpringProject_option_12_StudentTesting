package ua.testing.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import ua.testing.entity.Question;
import ua.testing.repository.QuestionRepository;

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
public class QuestionService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    QuestionRepository questionRepository;

    public Question findQuestionById(Long questionId) {
        Optional<Question> questionFromDb = questionRepository.findById(questionId);
        return questionFromDb.orElse(new Question());
    }

    public List<Question> allQuestionsByTheme_id(Long theme_id) {
        List<Question> questions = null;
        String query = "";
        if (LocaleContextHolder.getLocale().equals(new Locale("ua", "UA")) ||
                LocaleContextHolder.getLocale().equals(new Locale("ua"))) {
            query = "select q.theme_id, q.question_id, q.question, q.option1, q.option2, q.option3, q.option4, " +
                    "q.correct_answer, q.question_en, q.option1_en, q.option2_en, q.option3_en, q.option4_en, " +
                    "q.correct_answer_en, q.explanation, q.explanation_en " +
                    "from Questions q ";
        }
        if (LocaleContextHolder.getLocale().equals(new Locale("en"))) {
            query = "select q.theme_id, q.question_id, q.question_en as question, q.option1_en as option1, " +
                    "q.option2_en as option2, q.option3_en as option3, q.option4_en as option4, q.correct_answer_en " +
                    "as correct_answer, '' as question_en, '' as option1_en, '' as option2_en, '' as option3_en, " +
                    "'' as option4_en, '' as correct_answer_en, q.explanation_en as explanation, '' as explanation_en " +
                    "from Questions q ";
        }
        if (theme_id > 0) {
            query += "where q.theme_id = " + theme_id;
        }
        questions = em.createNativeQuery(query, Question.class).getResultList();
        return questions;
    }

    public boolean saveQuestion(Question question) {
        Question questionFromDB = questionRepository.findByQuestion(question.getQuestion());
        if (questionFromDB != null) {
            return false;
        }
        question.setTheme_id(question.getTheme_id());
        question.setQuestion(question.getQuestion());
        question.setOption1(question.getOption1());
        question.setOption2(question.getOption2());
        question.setOption3(question.getOption3());
        question.setOption4(question.getOption4());
        question.setCorrect_answer(question.getCorrect_answer());
        question.setQuestion_en(question.getQuestion_en());
        question.setOption1_en(question.getOption1_en());
        question.setOption2_en(question.getOption2_en());
        question.setOption3_en(question.getOption3_en());
        question.setOption4_en(question.getOption4_en());
        question.setCorrect_answer_en(question.getCorrect_answer_en());
        questionRepository.save(question);
        return true;
    }

    public boolean deleteQuestion(Long questionId) {
        if (questionRepository.findById(questionId).isPresent()) {
            questionRepository.deleteById(questionId);
            return true;
        }
        return false;
    }

    public void updateQuestion(Long question_id, Long theme_id, String question, String option1, String option2,
                               String option3, String option4, String correct_answer,
                               String question_en, String option1_en, String option2_en,
                               String option3_en, String option4_en, String correct_answer_en) {
        Question updated = questionRepository.findById(question_id).orElse(null);
        updated.setTheme_id(theme_id);
        updated.setQuestion(question);
        updated.setOption1(option1);
        updated.setOption2(option2);
        updated.setOption3(option3);
        updated.setOption4(option4);
        updated.setCorrect_answer(correct_answer);
        updated.setQuestion_en(question_en);
        updated.setOption1_en(option1_en);
        updated.setOption2_en(option2_en);
        updated.setOption3_en(option3_en);
        updated.setOption4_en(option4_en);
        updated.setCorrect_answer_en(correct_answer_en);
        questionRepository.save(updated);
    }
}
