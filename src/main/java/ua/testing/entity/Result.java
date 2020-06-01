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
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@Entity
@Table(name = "results")
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "user_id")
    private Long user_id;
    @Column(name = "theme_id")
    private Long theme_id;
    @Column(name = "correct_answers")
    private Long correct_answers;
    @Column(name = "total_answers")
    private Long total_answers;
    @Column(name = "grade")
    private Float grade;
}
