package imtiaj.service;


import imtiaj.domain.User;
import imtiaj.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class StudentService {

    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public void create(User user) {
        // Business logic before saving a student
        // For example, you could ensure the name is in proper format
        user.setName(user.getName().trim().toUpperCase());
        user.setEmail(user.getEmail().trim().toLowerCase());
        // You could also perform additional validations or logic here
        studentRepository.create(user);
    }

    public void edit(User user) {
        // Business logic before updating a student
        studentRepository.edit(user);
    }

    public void delete(int id) {
        studentRepository.delete(id);
    }

    public List<User> getAll() {
        List<User> users=studentRepository.getAll();
        return users;
    }

    public User get(int id) {
        return studentRepository.get(id);
    }
}