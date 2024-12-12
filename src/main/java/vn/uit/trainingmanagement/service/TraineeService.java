package vn.uit.trainingmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.uit.trainingmanagement.domain.Trainee;
import vn.uit.trainingmanagement.repository.TraineeRepository;

@Service
public class TraineeService {

    private final TraineeRepository traineeRepository;

    public TraineeService(TraineeRepository traineeRepository) {
        this.traineeRepository = traineeRepository;
    }

    public List<Trainee> getAllTrainees() {
        return this.traineeRepository.findAll();
    }

    public void handleSaveTrainee(Trainee trainee) {
        this.traineeRepository.save(trainee);
    }

    public Trainee getTraineeById(long id) {
        return this.traineeRepository.findById(id).isPresent() ? this.traineeRepository.findById(id).get() : null;
    }
}
