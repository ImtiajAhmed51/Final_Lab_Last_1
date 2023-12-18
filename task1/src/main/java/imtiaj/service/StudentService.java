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
        user.setName(user.getName().trim().toUpperCase());
        user.setEmail(user.getEmail().trim().toLowerCase());
        user.setQuota(user.getQuota().trim());
        user.setCountry(user.getCountry().trim());
        studentRepository.create(user);
    }
    public void edit(User user) {
        studentRepository.edit(user);
    }
    public void delete(int id) {
        studentRepository.delete(id);
    }
    public List<User> getAll() {
        return studentRepository.getAll();
    }
    public User get(int id) {
        return studentRepository.get(id);
    }
}