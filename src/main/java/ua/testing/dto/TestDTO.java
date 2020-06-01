package ua.testing.dto;

import lombok.*;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TestDTO {
    private Long theme_id;
    private Long question_id;
    private String question;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String correct_answer;
    private String question_en;
    private String option1_en;
    private String option2_en;
    private String option3_en;
    private String option4_en;
    private String correctanswer_en;
    private String explanation;
    private String explanation_en;
    private String answer;
    private int grade;
    private String theme;
    private String theme_en;
    private Long passing_grade;

    public Long getTheme_id() {
        return theme_id;
    }

    public void setTheme_id(Long theme_id) {
        this.theme_id = theme_id;
    }

    public Long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Long question_id) {
        this.question_id = question_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOption1() {
        return option1;
    }

    public String getOption2() {
        return option2;
    }

    public String getOption3() {
        return option3;
    }

    public String getOption4() {
        return option4;
    }

    public String getCorrect_answer() {
        return correct_answer;
    }

    public String getOption1_en() {
        return option1_en;
    }

    public String getOption2_en() {
        return option2_en;
    }

    public String getOption3_en() {
        return option3_en;
    }

    public String getOption4_en() {
        return option4_en;
    }

    public String getExplanation() {
        return explanation;
    }

    public String getAnswer() {
        return answer;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public Long getPassing_grade() {
        return passing_grade;
    }
}
