package ua.testing.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Getter
@Setter
@ToString
public class StatisticsDTO {
    private String email;
    private String first_name;
    private String last_name;
    private Float total_grade;
    private String theme;
    private Long passing_grade;
    private Long correct_answers;
    private Long total_answers;
    private Float grade;

    public StatisticsDTO(String email, String first_name, String last_name, Float total_grade, String theme,
                         Long passing_grade, Long correct_answers, Long total_answers, Float grade) {
        this.email = email;
        this.first_name = first_name;
        this.last_name = last_name;
        this.total_grade = total_grade;
        this.theme = theme;
        this.passing_grade = passing_grade;
        this.correct_answers = correct_answers;
        this.total_answers = total_answers;
        this.grade = grade;
    }
}
