package ua.testing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ua.testing.dto.StatisticsDTO;
import ua.testing.dto.TestDTO;
import ua.testing.entity.Test;

import java.util.List;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Repository
public interface TestRepository extends JpaRepository<Test, Long> {
    @Query(value = ua.testing.config.Query.DELETE_TESTS_BY_THEMEID_AND_USERID, nativeQuery = true)
    void deleteTestsByTheme_idAndUser_id(Long theme_id, Long user_id);

    @Query(value = ua.testing.config.Query.SELECT_QUESTIONS_BY_THEMEID_AND_USERID_UA)
    List<TestDTO> getQuestionsByTheme_idAndUser_idUa(Long theme_id, Long user_id);

    @Query(value = ua.testing.config.Query.SELECT_QUESTIONS_BY_THEMEID_AND_USERID_EN)
    List<TestDTO> getQuestionsByTheme_idAndUser_idEn(Long theme_id, Long user_id);

    @Query(value = ua.testing.config.Query.SELECT_STATISTICS_BY_USERID_AND_THEMEID_UA)
    List<StatisticsDTO> getStatisticsByUser_idAndTheme_idUa();

    @Query(value = ua.testing.config.Query.SELECT_STATISTICS_BY_USERID_AND_THEMEID_EN)
    List<StatisticsDTO> getStatisticsByUser_idAndTheme_idEn();
}
