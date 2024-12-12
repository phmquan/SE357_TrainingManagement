package vn.uit.trainingmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.uit.trainingmanagement.domain.Trainee;

@Repository
public interface TraineeRepository extends JpaRepository<Trainee, Long> {

}
