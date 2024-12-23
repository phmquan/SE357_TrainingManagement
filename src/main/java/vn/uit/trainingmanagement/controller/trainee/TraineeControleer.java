package vn.uit.trainingmanagement.controller.trainee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TraineeControleer {

    @GetMapping("/trainee")
    public String trainee(Model model) {
        return "trainee/traineeview";
    }
}
