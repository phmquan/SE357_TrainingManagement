package vn.uit.trainingmanagement.controller.admin;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.uit.trainingmanagement.domain.Role;
import vn.uit.trainingmanagement.domain.Trainee;
import vn.uit.trainingmanagement.domain.Trainer;
import vn.uit.trainingmanagement.domain.User;
import vn.uit.trainingmanagement.service.TraineeService;
import vn.uit.trainingmanagement.service.TrainerService;
import vn.uit.trainingmanagement.service.UploadService;
import vn.uit.trainingmanagement.service.UserService;

@Controller
public class UserController {

    private final UserService userService;

    private final PasswordEncoder passwordEncoder;
    private final TrainerService trainerService;
    private final TraineeService traineeService;

    public UserController(TraineeService traineeService, TrainerService trainerService, PasswordEncoder passwordEncoder, UploadService uploadService, UserService userService) {
        this.passwordEncoder = passwordEncoder;

        this.userService = userService;
        this.trainerService = trainerService;
        this.traineeService = traineeService;
    }

    @GetMapping("/")
    public String getRedirectToSpecificRole(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String role = session.getAttribute("role").toString();
            if (role != null) {
                if (role.equals("ADMIN")) {
                    return "redirect:/admin/trainer";
                } else if (role.equals("TRAINER")) {
                    return "redirect:/trainer";
                } else if (role.equals("TRAINEE")) {
                    return "redirect:/trainee";
                }
            }
        }
        return "redirect:/login";

    }

    public String getMethodName(@RequestParam String param) {
        return new String();
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @GetMapping("/admin/trainer")
    public String admin(Model model, HttpServletRequest request) {
        List<Trainer> trainers = this.trainerService.getAllTrainers();
        model.addAttribute("trainers", trainers);
        HttpSession session = request.getSession(false);

        return "admin/admin";
    }

    @GetMapping("/admin/trainee")
    public String adminTrainee(Model model, HttpServletRequest request) {
        List<Trainee> trainees = this.traineeService.getAllTrainees();
        HttpSession session = request.getSession(false);

        model.addAttribute("trainees", trainees);
        model.addAttribute("username", SecurityContextHolder.getContext().getAuthentication().getName());
        return "admin/trainee";
    }

    @GetMapping("/admin/trainer/create")
    public String getCreateTrainer(Model model, HttpServletRequest request) {
        model.addAttribute("newTrainer", new Trainer());
        HttpSession session = request.getSession(false);

        model.addAttribute("username", SecurityContextHolder.getContext().getAuthentication().getName());
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getName());
        return "admin/createTrainer";
    }

    @PostMapping("/admin/trainer/create")
    public String createTrainer(
            @ModelAttribute("newTrainer") @Valid Trainer trainer,
            BindingResult bindingResult,
            Model model
    ) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/createTrainer";
        }

        String hashedPassword = this.passwordEncoder.encode(trainer.getUser().getPassword());
        trainer.getUser().setPassword(hashedPassword);

        Long roleId = trainer.getUser().getRole().getId(); // Assume the form provides this ID
        Role role = this.userService.getRoleById(roleId); // Fetch role from the database
        trainer.getUser().setRole(role);
        this.userService.handleSaveUser(trainer.getUser());
        trainer.setUser(trainer.getUser());
        trainer.setActivationStatus("true");

        this.trainerService.handleSaveTrainer(trainer);
        return "redirect:/admin/trainer";
    }

    @GetMapping("/admin/trainee/create")
    public String getCreateTrainee(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        model.addAttribute("newTrainee", new Trainee());

        return "admin/createTrainee";
    }

    @PostMapping("/admin/trainee/create")
    public String createTrainee(@ModelAttribute("newTrainee") @Valid Trainee trainee, BindingResult bindingResult, Model model) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/createTrainee";
        }

        String hashedPassword = this.passwordEncoder.encode(trainee.getUser().getPassword());
        trainee.getUser().setPassword(hashedPassword);

        Long roleId = trainee.getUser().getRole().getId(); // Assume the form provides this ID
        Role role = this.userService.getRoleById(roleId); // Fetch role from the database
        trainee.getUser().setRole(role);
        this.userService.handleSaveUser(trainee.getUser());
        trainee.setUser(trainee.getUser());

        this.traineeService.handleSaveTrainee(trainee);
        return "redirect:/admin/trainee";
    }

    @GetMapping("/admin/trainee/update/{id}")
    public String getUpdateTrainee(Model model, HttpServletRequest request, @PathVariable("id") long id) {
        HttpSession session = request.getSession(false);
        Trainee currentTrainee = this.traineeService.getTraineeById(id);
        model.addAttribute("updateTrainee", currentTrainee);

        return "admin/updateTrainee";
    }

    @PostMapping("/admin/trainee/update")
    public String handleUpdateTrainee(@ModelAttribute("updateTrainee") @Valid Trainee trainee, BindingResult bindingResult, Model model) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/updateTrainee";
        }
        Trainee currentTrainee = this.traineeService.getTraineeById(trainee.getId());
        System.out.println("before update: " + currentTrainee);
        if (currentTrainee != null) {
            String hashedPassword = this.passwordEncoder.encode(trainee.getUser().getPassword());
            User currentTraineeUser = currentTrainee.getUser();
            currentTraineeUser.setPassword(hashedPassword);

            currentTraineeUser.setFullName(trainee.getUser().getFullName());
            currentTraineeUser.setPhone(trainee.getUser().getPhone());
            currentTraineeUser.setAddress(trainee.getUser().getAddress());

            this.userService.handleSaveUser(currentTraineeUser);
            currentTrainee.setUser(currentTraineeUser);
            System.out.println("after update: " + currentTrainee);
            this.traineeService.handleSaveTrainee(currentTrainee);
        }
        return "redirect:/admin/trainee";
    }

    @GetMapping("/admin/trainer/update/{id}")
    public String getUpdateTrainer(Model model, HttpServletRequest request, @PathVariable("id") long id) {
        HttpSession session = request.getSession(false);
        Trainer currentTrainer = this.trainerService.getTrainerById(id);
        model.addAttribute("updateTrainer", currentTrainer);

        return "admin/updateTrainer";
    }

    @PostMapping("/admin/trainer/update")
    public String handleUpdateTrainer(@ModelAttribute("updateTrainer") @Valid Trainee trainee, BindingResult bindingResult, Model model) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/updateTrainer";
        }
        Trainee currentTrainee = this.traineeService.getTraineeById(trainee.getId());
        System.out.println("before update: " + currentTrainee);
        if (currentTrainee != null) {
            String hashedPassword = this.passwordEncoder.encode(trainee.getUser().getPassword());
            User currentTraineeUser = currentTrainee.getUser();
            currentTraineeUser.setPassword(hashedPassword);

            currentTraineeUser.setFullName(trainee.getUser().getFullName());
            currentTraineeUser.setPhone(trainee.getUser().getPhone());
            currentTraineeUser.setAddress(trainee.getUser().getAddress());

            this.userService.handleSaveUser(currentTraineeUser);
            currentTrainee.setUser(currentTraineeUser);
            System.out.println("after update: " + currentTrainee);
            this.traineeService.handleSaveTrainee(currentTrainee);
        }
        return "redirect:/admin/trainer";
    }

    @GetMapping("/admin/trainer/delete/{id}")
    public String getTrainerDelete(Model model, @PathVariable("id") Long id) {
        model.addAttribute("trainer", new Trainer());
        model.addAttribute("id", id);
        return "admin/deleteTrainer";
    }

    @PostMapping("/admin/trainer/delete")
    public String handleTrainerDelete(Model model, @ModelAttribute("trainer") Trainer trainer) {
        Trainer currentTrainer = this.trainerService.getTrainerById(trainer.getId());
        if (currentTrainer.getTrainee().isEmpty()) {
            this.trainerService.deleteTrainerById(trainer.getId());
        } else {
            currentTrainer.setTrainee(null);
            this.trainerService.handleSaveTrainer(currentTrainer);
            this.trainerService.deleteTrainerById(trainer.getId());
        }
        return "redirect:" + "admin";
    }

    @GetMapping("/logout")
    public String logout(Model model) {
        return "redirect:/login";
    }
}
