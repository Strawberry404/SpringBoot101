package school.springboot101.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import school.springboot101.entities.Cours;
import school.springboot101.service.CoursService;
import school.springboot101.service.FiliereService;

@Controller
@RequestMapping("app/cours/")
public class CoursController {

    @Autowired
    private  CoursService service;

    @Autowired
    private  FiliereService filiereService;

    @GetMapping("lister")
    public String lister(Model model) {
        // Matches the "items" in your cours/list.jsp
        model.addAttribute("cours", service.findAll());
        return "cours/list";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("cours") Cours cours) {
        service.create(cours);
        return "redirect:/app/cours/lister";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("cours") Cours cours) {
        service.update(cours);
        return "redirect:/app/cours/lister";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        // Make sure CoursService has deleteById(int id)!
        service.deleteById(id);
        return "redirect:/app/cours/lister";
    }


    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("cours", service.findById(id));

        model.addAttribute("filieres", filiereService.findAll());

        return "cours/form";
    }

    @GetMapping("/nouveau")
    public String nouveauForm(Model model) {
        model.addAttribute("cours", new Cours());
        model.addAttribute("filieres", filiereService.findAll());
        return "cours/form";
    }
}