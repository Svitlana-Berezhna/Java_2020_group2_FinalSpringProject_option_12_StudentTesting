package ua.testing.repository;

import ua.testing.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
