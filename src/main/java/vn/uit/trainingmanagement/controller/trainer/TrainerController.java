package vn.uit.trainingmanagement.controller.trainer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainerController {

    @GetMapping("/trainer")
    public String trainer(Model model) {
        return "trainer/trainerview";
    }

}
