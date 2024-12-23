package vn.uit.trainingmanagement.controller.trainer;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.uit.trainingmanagement.domain.Exercise;
import vn.uit.trainingmanagement.service.ExerciseService;
import vn.uit.trainingmanagement.service.UploadService;

@Controller
public class ExerciseController {

    private final UploadService uploadService;
    private final ExerciseService exerciseService;

    public ExerciseController(UploadService uploadService, ExerciseService exerciseService) {
        this.uploadService = uploadService;
        this.exerciseService = exerciseService;
    }

    @GetMapping("/trainer/exercise")
    public String getExercise(Model model) {
        return "trainer/exercise";
    }

    @GetMapping("/trainer/exercise/create")
    public String getExercisePage(Model model) {
        model.addAttribute("newExercise", new Exercise());
        return "trainer/newexercise";
    }

    @PostMapping("/trainer/exercise/create")
    public String createExercise(@RequestParam("descPicture") MultipartFile[] file, @ModelAttribute("newExercise") Exercise newExercise, BindingResult bindingResult) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/newexercise";
        }
        List<String> listFileName = uploadService.handleSaveMultipleUploadFile(file, "/images/exercise");
        newExercise.setImage(listFileName);
        exerciseService.saveExercise(newExercise);
        return "redirect:/trainer/exercise";
    }
}
