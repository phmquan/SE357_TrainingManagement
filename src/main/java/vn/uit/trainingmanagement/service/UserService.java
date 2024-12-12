package vn.uit.trainingmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.uit.trainingmanagement.domain.Role;
import vn.uit.trainingmanagement.domain.User;
import vn.uit.trainingmanagement.repository.RoleRepository;
import vn.uit.trainingmanagement.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(RoleRepository roleRepository, UserRepository userRepository) {
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
    }

    public User GetUserByID(Long id) {
        return this.userRepository.findByid(id);
    }

    public List<User> GetAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> GetAllUserByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public void handleDeleteUserById(Long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public Role getRoleById(Long id) {
        return this.roleRepository.findById(id).isPresent() ? this.roleRepository.findById(id).get() : null;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public vn.uit.trainingmanagement.domain.User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
