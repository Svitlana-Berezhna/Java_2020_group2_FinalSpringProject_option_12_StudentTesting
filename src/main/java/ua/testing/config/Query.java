package ua.testing.config;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
public interface Query {
    String DELETE_TESTS_BY_THEMEID_AND_USERID = "delete from tests t " +
            "where t.theme_id = ?1 and t.user_id = ?2";

    String INSERT_TESTS_BY_THEMEID = "insert into tests (user_id, theme_id, question_id) " +
            "select ?2, q.theme_id, q.question_id from Questions q " +
            "where q.theme_id = ?1";

    String SELECT_QUESTIONS_BY_THEMEID_AND_USERID_UA = "select new ua.testing.dto.TestDTO(q.theme_id, q.question_id, " +
            "q.question, q.option1, q.option2, q.option3, q.option4, q.correct_answer, q.question_en, q.option1_en, " +
            "q.option2_en, q.option3_en, q.option4_en, q.correct_answer_en, q.explanation, q.explanation_en, t.answer, " +
            "case " +
            "when (t.answer = q.correct_answer or t.answer = q.correct_answer_en) then 1 " +
            "else 0 " +
            "end as grade, th.theme, th.theme_en, th.passing_grade) " +
            "from Question q " +
            "left join Test t on q.theme_id = t.theme_id and q.question_id = t.question_id " +
            "left join Theme th on q.theme_id = th.id " +
            "where q.theme_id = ?1 and t.user_id = ?2";

    String SELECT_QUESTIONS_BY_THEMEID_AND_USERID_EN = "select new ua.testing.dto.TestDTO(q.theme_id, q.question_id, " +
            "q.question_en as question, q.option1_en as option1, q.option2_en as option2, q.option3_en as option3, " +
            "q.option4_en as option4, q.correct_answer_en as correct_answer, q.question_en, q.option1 as option1_en, " +
            "q.option2 as option2_en, q.option3 as option3_en, q.option4 as option4_en, q.correct_answer as " +
            "correct_answer_en, q.explanation_en as explanation, q.explanation_en, t.answer, " +
            "case " +
            "when (t.answer = q.correct_answer or t.answer = q.correct_answer_en) then 1 " +
            "else 0 " +
            "end as grade, th.theme_en as theme, '' as theme_en, th.passing_grade) " +
            "from Question q " +
            "left join Test t on q.theme_id = t.theme_id and q.question_id = t.question_id " +
            "left join Theme th on q.theme_id = th.id " +
            "where q.theme_id = ?1 and t.user_id = ?2";

    String SELECT_STATISTICS_BY_USERID_AND_THEMEID_UA = "select new ua.testing.dto.StatisticsDTO(u.email, u.first_name, " +
            "u.last_name, u.grade as total_grade, t.theme, t.passing_grade, r.correct_answers, r.total_answers, r.grade) " +
            "from Result r " +
            "left join Theme t on r.theme_id = t.id " +
            "left join User u on r.user_id = u.id " +
            "order by u.email, t.theme";

    String SELECT_STATISTICS_BY_USERID_AND_THEMEID_EN = "select new ua.testing.dto.StatisticsDTO(u.email, u.first_name_en " +
            "as first_name, u.last_name_en as last_name, u.grade as total_grade, t.theme_en as theme, t.passing_grade, " +
            "r.correct_answers, r.total_answers, r.grade) " +
            "from Result r " +
            "left join Theme t on r.theme_id = t.id " +
            "left join User u on r.user_id = u.id " +
            "order by u.email, t.theme_en";
}
