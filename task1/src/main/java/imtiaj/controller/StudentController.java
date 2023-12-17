package imtiaj.controller;

import imtiaj.domain.User;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import imtiaj.service.StudentService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller

public class StudentController {

    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }
    @InitBinder
    public void intiBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    // Maps to: GET /students
    @RequestMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAll());
        return "list"; // Path to the JSP page that lists the students
    }
    @RequestMapping("/addStudent")
    public String showAddForm(Model model) {
        model.addAttribute("student", new User());
        return "add";
    }
    @RequestMapping("/store")
    public String addStudent(@ModelAttribute("student") User student, BindingResult result) {
        if (result.hasErrors()) {
            return "add";
        }
        studentService.create(student);
        return "redirect:/students";
    }

    // Maps to: GET /students/{id}
    @GetMapping("/{id}")
    public String showStudent(@PathVariable int id, Model model) {
        User user = studentService.get(id);
        if (user != null) {
            model.addAttribute("student", user);
            return "students/detail"; // Path to the JSP page that shows student details
        } else {
            return "redirect:/students";
        }
    }

    // Maps to: GET /students/{id}/edit
    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable int id, Model model) {
        User user = studentService.get(id);
        if (user != null) {
            model.addAttribute("student", user);
            return "students/edit"; // Path to the JSP page for editing a student
        } else {
            return "redirect:/students";
        }
    }

    // Maps to: POST /students/{id}/edit
    @PostMapping("/{id}/edit")
    public String updateStudent(@PathVariable int id, @ModelAttribute User user) {
        user.setId(id); // Ensure the ID is set for the student object
        studentService.edit(user);
        return "redirect:/students";
    }

    // Maps to: GET /students/{id}/delete
    @GetMapping("/{id}/delete")
    public String deleteStudent(@PathVariable int id) {
        studentService.delete(id);
        return "redirect:/students";
    }
}