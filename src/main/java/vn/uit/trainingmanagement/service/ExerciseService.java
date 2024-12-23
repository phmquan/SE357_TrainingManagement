package vn.uit.trainingmanagement.service;

import org.springframework.stereotype.Service;

import vn.uit.trainingmanagement.domain.Exercise;
import vn.uit.trainingmanagement.repository.ExerciseRepository;

@Service
public class ExerciseService {

    private final ExerciseRepository exerciseRepository;

    public ExerciseService(ExerciseRepository exerciseRepository) {
        this.exerciseRepository = exerciseRepository;
    }

    public void saveExercise(Exercise exercise) {
        exerciseRepository.save(exercise);
    }
}
