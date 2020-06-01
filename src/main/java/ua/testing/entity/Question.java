package ua.testing.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Data
@Builder
@Getter
@Setter
@AllArgsConstructor
@ToString
@Entity
@Table(name = "questions")
public class Question implements Serializable {
    @Column(name = "theme_id")
    private Long theme_id;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long question_id;
    @Column(name = "question")
    private String question;
    @Column(name = "option1")
    private String option1;
    @Column(name = "option2")
    private String option2;
    @Column(name = "option3")
    private String option3;
    @Column(name = "option4")
    private String option4;
    @Column(name = "correct_answer")
    private String correct_answer;
    @Column(name = "question_en")
    private String question_en;
    @Column(name = "option1_en")
    private String option1_en;
    @Column(name = "option2_en")
    private String option2_en;
    @Column(name = "option3_en")
    private String option3_en;
    @Column(name = "option4_en")
    private String option4_en;
    @Column(name = "correct_answer_en")
    private String correct_answer_en;
    @Column(name = "explanation")
    private String explanation;
    @Column(name = "explanation_en")
    private String explanation_en;

    public Question() {
    }

    public Question(Long theme_id, String question, String option1, String option2, String option3, String option4,
                    String correct_answer, String question_en, String option1_en, String option2_en, String option3_en,
                    String option4_en, String correct_answer_en) {
        this.theme_id = theme_id;
        this.question = question;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.correct_answer = correct_answer;
        this.question_en = question_en;
        this.option1_en = option1_en;
        this.option2_en = option2_en;
        this.option3_en = option3_en;
        this.option4_en = option4_en;
        this.correct_answer_en = correct_answer_en;
    }

    public Long getTheme_id() {
        return theme_id;
    }

    public void setTheme_id(Long theme_id) {
        this.theme_id = theme_id;
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

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getCorrect_answer() {
        return correct_answer;
    }

    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }

    public String getQuestion_en() {
        return question_en;
    }

    public void setQuestion_en(String question_en) {
        this.question_en = question_en;
    }

    public String getOption1_en() {
        return option1_en;
    }

    public void setOption1_en(String option1_en) {
        this.option1_en = option1_en;
    }

    public String getOption2_en() {
        return option2_en;
    }

    public void setOption2_en(String option2_en) {
        this.option2_en = option2_en;
    }

    public String getOption3_en() {
        return option3_en;
    }

    public void setOption3_en(String option3_en) {
        this.option3_en = option3_en;
    }

    public String getOption4_en() {
        return option4_en;
    }

    public void setOption4_en(String option4_en) {
        this.option4_en = option4_en;
    }

    public String getCorrect_answer_en() {
        return correct_answer_en;
    }

    public void setCorrect_answer_en(String correct_answer_en) {
        this.correct_answer_en = correct_answer_en;
    }
}
