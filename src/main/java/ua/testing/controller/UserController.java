package ua.testing.controller;

import ua.testing.entity.User;
import ua.testing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "users";
    }

    @PostMapping("/users")
    public String deleteUser(@RequestParam(required = true, defaultValue = "") Long userId,
                             @RequestParam(required = true, defaultValue = "") String action,
                             Model model) {
        if (action.equals("delete")) {
            userService.deleteUser(userId);
        }
        return "redirect:/users";
    }

    @GetMapping("/users/gt/{userId}")
    public String gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "users";
    }

    @GetMapping("/user/{id}")
    public String edit(@PathVariable Long id, Model model) {
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "user";
    }

    @PostMapping("/user")
    public String editUser(@RequestParam(required = true, defaultValue = "") Long id,
                           @RequestParam(required = true, defaultValue = "") String email,
                           @RequestParam(required = true, defaultValue = "") String password,
                           @RequestParam(required = true, defaultValue = "") String first_name,
                           @RequestParam(required = true, defaultValue = "") String last_name,
                           @RequestParam(required = true, defaultValue = "") String first_name_en,
                           @RequestParam(required = true, defaultValue = "") String last_name_en,
                           @RequestParam(required = true, defaultValue = "") Float grade,
                           @RequestParam(required = true, defaultValue = "") String action,
                           Model model) {
        if (action.equals("update")) {
            userService.updateUser(id, email, password, first_name, last_name, first_name_en, last_name_en, grade);
        }
        return "redirect:/users";
    }

    @GetMapping("/user")
    public String newUser() {
        return "user";
    }

    @PostMapping("/user_save")
    public String updateUser(@RequestParam String email, @RequestParam String password,
                             @RequestParam String first_name, @RequestParam String last_name,
                             @RequestParam String first_name_en, @RequestParam String last_name_en,
                             @RequestParam Float grade) {
        userService.saveUser(new User(email, password, first_name, last_name, first_name_en, last_name_en, grade));
        return "redirect:/users";
    }

    @GetMapping("/")
    public String userProfile() {
        return "index";
    }

    @PostMapping("/user/{id}")
    public String userProfile(@RequestParam String email) {
        User user = userService.findUserByEmail(email);
        return "redirect:/user/" + user.getId();
    }
}
