package com.fpoly.java5.controller;

import com.fpoly.java5.model.entity.User;
import com.fpoly.java5.repo.UserRepository;
import com.fpoly.java5.service.LoginService;
import com.fpoly.java5.service.SessionService;
import com.fpoly.java5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AccountController {

    @Autowired
    LoginService loginService;
    @Autowired
    UserRepository repo;
    @Autowired
    UserService userService;
    @Autowired
    SessionService session;

    @PostMapping("/account/login") // Login
    public String login(Model model, User user) {
        boolean result = loginService.login(user);
        model.addAttribute("users", repo.findAll());
        model.addAttribute("message", result ? "Login Thành Công!" : "Login Thất Bại");
        return result ?
                ((User) session.get("loggedInUser")).isAdmin() ?
                        "admin/index" :
                        "home/index" :
                "home/index";
    }

    // Logout -> return to index
    @RequestMapping("/account/logout")
    public String logout() {
        loginService.logout();
        return "redirect:/";
    }

    // Open register form
    @RequestMapping("/account/register")
    public String getRegister() {
        return "others/register";
    }

    // Action register form
    @PostMapping("/account/register")
    public String register(@ModelAttribute User user, Model model) {
        // Check if the data entered by the customer exists or not (If existed return to register page)
        if (userService.isUserExist(user)) {
            model.addAttribute("error", "User already existed");
            return "others/register";
        }
        // If not existed, save user -> return to login to continue login
        else {
            repo.save(user);
            model.addAttribute("message", "Sign Up Success");
            return "redirect:/";
        }
    }


    // Forgot password open form
    @GetMapping("/account/forgotPassword")
    public String forgot() {
        return "forgot";
    }

    // Forgot password, send new random number to client's email
    // If client enters wrong email -> Cannot send
    @PostMapping("/account/forgotPassword")
    public String forgot(@RequestParam("username") String username,
                         Model model) {
        try {
            User user = repo.findByUsername(username);
            String to = user.getEmail();
            String email = to.substring(0, 2);
            double randomDouble = Math.random();
            randomDouble = randomDouble * 100000 + 1;
            int randomInt = (int) randomDouble;

            String subject = "Get your password";
            String body = "Your password is: " + randomInt;
//            mail.send(to, subject, body); // Gui mail lay lai mat khau
            user.setPassword(String.valueOf(randomInt));
            repo.save(user);
            model.addAttribute("message", "Password has been sent to email: " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Invalid Username");
        }
        return "forgot";
    }

}
