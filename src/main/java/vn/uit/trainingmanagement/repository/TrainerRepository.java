package vn.uit.trainingmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.uit.trainingmanagement.domain.Trainer;

@Repository
public interface TrainerRepository extends JpaRepository<Trainer, Long> {

}
