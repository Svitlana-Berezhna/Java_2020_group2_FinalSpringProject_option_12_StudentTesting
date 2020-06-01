package ua.testing.entity;

import lombok.*;

import javax.persistence.*;

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
@Table(name = "tests")
public class Test {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "user_id")
    private Long user_id;
    @Column(name = "theme_id", nullable = false, insertable = false, updatable = false)
    private Long theme_id;
    @Column(name = "question_id", nullable = false, insertable = false, updatable = false)
    private Long question_id;
    @Column(name = "answer")
    private String answer;

    public Test(Long userId, Long themeId, Long questionId, String answer) {
        this.user_id = userId;
        this.theme_id = themeId;
        this.question_id = questionId;
        this.answer = answer;
    }

    public Test() {
    }

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
}
