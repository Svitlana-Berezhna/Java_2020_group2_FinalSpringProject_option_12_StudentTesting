package ua.testing.repository;

import ua.testing.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
public interface RoleRepository extends JpaRepository<Role, Long> {
}
