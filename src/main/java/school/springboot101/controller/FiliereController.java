package school.springboot101.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import school.springboot101.entities.Filiere;
import school.springboot101.service.FiliereService;

@Controller
@RequestMapping("app/filieres/")
public class FiliereController {
    @Autowired
    private  FiliereService service;

    @GetMapping("lister")
    public String lister(Model model) {
        // Important: Your list.jsp uses "filieres", not "list"
        model.addAttribute("filieres", service.findAll());
        return "filiere/list";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("filiere") Filiere filiere) {
        service.create(filiere);
        return "redirect:/app/filieres/lister";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("filiere") Filiere filiere) {
        service.update(filiere);
        return "redirect:/app/filieres/lister";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        // Ensure your FiliereService has this method!
        service.deleteById(id);
        return "redirect:/app/filieres/lister";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("filiere", service.findById(id));
        return "filiere/form";
    }

    @GetMapping("/nouveau")
    public String nouveauForm(Model model) {
        model.addAttribute("filiere", new Filiere());

        return "filiere/form";
    }
}
