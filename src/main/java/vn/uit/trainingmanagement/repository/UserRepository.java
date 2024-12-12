package vn.uit.trainingmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.uit.trainingmanagement.domain.User;


import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit);

    List<User> findOneByEmail(String email);

    User findByid(Long ID);

    void deleteById(Long id);

    boolean existsByEmail(String email);

    vn.uit.trainingmanagement.domain.User findByEmail(String email);
}
