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
@Table(name = "themes")
public class Theme {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "theme")
    private String theme;
    @Column(name = "description")
    private String description;
    @Column(name = "theme_en")
    private String theme_en;
    @Column(name = "description_en")
    private String description_en;
    @Column(name = "time")
    private Long time;
    @Column(name = "passing_grade")
    private Long passing_grade;

    public Theme() {
    }

    public Theme(String theme, String description, String theme_en, String description_en, Long time, Long passing_grade) {
        this.theme = theme;
        this.description = description;
        this.theme_en = theme_en;
        this.description_en = description_en;
        this.time = time;
        this.passing_grade = passing_grade;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setTheme_en(String theme_en) {
        this.theme_en = theme_en;
    }

    public void setDescription_en(String description_en) {
        this.description_en = description_en;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public void setPassing_grade(Long passing_grade) {
        this.passing_grade = passing_grade;
    }

    public Long getId() {
        return id;
    }

    public String getTheme() {
        return theme;
    }

    public String getDescription() {
        return description;
    }

    public String getTheme_en() {
        return theme_en;
    }

    public String getDescription_en() {
        return description_en;
    }

    public Long getTime() {
        return time;
    }

    public Long getPassing_grade() {
        return passing_grade;
    }
}
