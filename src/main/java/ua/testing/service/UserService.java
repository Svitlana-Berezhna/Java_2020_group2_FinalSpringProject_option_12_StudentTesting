package ua.testing.service;

import org.springframework.context.i18n.LocaleContextHolder;
import ua.testing.entity.Role;
import ua.testing.entity.User;
import ua.testing.repository.RoleRepository;
import ua.testing.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = findUserByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User with email " + email + " not found.");
        }
        return user;
    }

    public User findUserById(Long userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public List<User> allUsers() {
        List<User> users = null;
        if (LocaleContextHolder.getLocale().equals(new Locale("ua", "UA")) ||
                LocaleContextHolder.getLocale().equals(new Locale("ua"))) {
            users = em.createNativeQuery("select u.id, u.email, u.password, u.first_name, u.last_name, " +
                    "u.first_name_en, u.last_name_en, u.grade " +
                    "from Users u", User.class).getResultList();
        }
        if (LocaleContextHolder.getLocale().equals(new Locale("en"))) {
            users = em.createNativeQuery("select u.id, u.email, u.password, u.first_name_en as first_name, " +
                    "u.last_name_en as last_name, '' as first_name_en, '' as last_name_en, u.grade " +
                    "from Users u", User.class).getResultList();
        }
        return users;
    }

    public boolean saveUser(User user) {
        User userFromDB = userRepository.findByEmail(user.getUsername());
        if (userFromDB != null) {
            return false;
        }
        user.setRoles(Collections.singleton(new Role(2L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> usergtList(Long idMin) {
        return em.createQuery("select u from User u where u.id > :paramId", User.class)
                .setParameter("paramId", idMin).getResultList();
    }

    public void updateUser(Long id, String email, String password, String first_name, String last_name,
                           String first_name_en, String last_name_en, Float grade) {
        User updated = userRepository.findById(id).orElse(null);
        updated.setEmail(email);
        updated.setPassword(bCryptPasswordEncoder.encode(password));
        updated.setFirst_name(first_name);
        updated.setLast_name(last_name);
        updated.setFirst_name_en(first_name_en);
        updated.setLast_name_en(last_name_en);
        updated.setGrade(grade);
        userRepository.save(updated);
    }

    public User findUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return user;
    }
}
