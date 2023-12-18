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
    @RequestMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAll());
        return "list";
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
    @RequestMapping("/students/{id}")
    public String showStudent(@PathVariable int id, Model model) {
        User user = studentService.get(id);
        if (user != null) {
            model.addAttribute("student", user);
            return "details";
        } else {
            return "redirect:/students";
        }
    }
    @RequestMapping("/students/{id}/edit")
    public String showEditForm(@PathVariable int id, Model model) {
        User user = studentService.get(id);
        if (user != null) {
            model.addAttribute("student", user);
            return "edit";
        } else {
            return "redirect:/students";
        }
    }
    @RequestMapping("/save")
    public String updateStudent(@ModelAttribute("student") User student) {
        studentService.edit(student);
        return "redirect:/students/" + student.getId();

    }
    @RequestMapping("/students/{id}/delete")
    public String deleteStudent(@PathVariable int id) {
        studentService.delete(id);
        return "redirect:/students";
    }
}