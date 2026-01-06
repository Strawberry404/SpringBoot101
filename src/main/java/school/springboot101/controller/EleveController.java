package school.springboot101.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import school.springboot101.entities.DossierAdministratif;
import school.springboot101.entities.Eleve;
import school.springboot101.service.EleveService;
import school.springboot101.service.FiliereService;

@Controller

@RequestMapping("app/eleves")
public class EleveController {
    @Autowired
    private   EleveService service;

    @Autowired
    private  FiliereService filiereService;

    @GetMapping("/lister")
    public String lister(Model model) {
    model.addAttribute("eleves", service.findAll());
        return "eleve/list";
    }
    @PostMapping("/create")
    public String create(@ModelAttribute("eleve") Eleve element) {
        service.create(element);
        return "redirect:/app/eleves/lister";    }

    @PostMapping("/update")
    public String update(@ModelAttribute("eleve") Eleve element) {
        service.update(element);
        return "redirect:/app/eleves/lister";    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        Eleve e = service.findById(id);
        if (e == null) {
            throw new RuntimeException("Student with ID " + id + " not found!");
        }
        model.addAttribute("eleve", e);
        model.addAttribute("filieres", filiereService.findAll());
        return "eleve/form";

    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        service.deleteById(id);
        return "redirect:/app/eleves/lister";    }

    @GetMapping("/nouveau")
    public String nouveauForm(Model model) {
        Eleve eleve = new Eleve();

        // Initialiser un dossier vide pour éviter les erreurs "null" dans le formulaire
        eleve.setDossierAdministratif(new DossierAdministratif());

        model.addAttribute("eleve", eleve);
        model.addAttribute("filieres", filiereService.findAll());
        return "eleve/form";
    }

    }


