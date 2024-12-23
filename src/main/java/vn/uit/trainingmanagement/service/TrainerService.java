package vn.uit.trainingmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.uit.trainingmanagement.domain.Trainer;
import vn.uit.trainingmanagement.repository.TrainerRepository;

@Service
public class TrainerService {

    private final TrainerRepository trainerRepository;

    public TrainerService(TrainerRepository trainerRepository) {
        this.trainerRepository = trainerRepository;
    }

    public List<Trainer> getAllTrainers() {
        return this.trainerRepository.findAll();
    }

    public void handleSaveTrainer(Trainer trainer) {
        this.trainerRepository.save(trainer);
    }

    public Trainer getTrainerById(long id) {
        return this.trainerRepository.findById(id).isPresent() ? this.trainerRepository.findById(id).get() : null;
    }

    public void deleteTrainerById(Long id) {
        this.trainerRepository.deleteById(id);
    }
}
