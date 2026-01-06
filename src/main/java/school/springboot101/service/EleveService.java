package school.springboot101.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import school.springboot101.entities.DossierAdministratif;
import school.springboot101.entities.Eleve;
import school.springboot101.repository.EleveRepository;

import java.util.Date;
import java.util.List;

@Service
public class EleveService {

    @Autowired

    private  EleveRepository eleveRepository;

    public List<Eleve> findAll() {
        return eleveRepository.findAll();
    }

    public Eleve findById(int id){
        return eleveRepository.findById(id).orElse(null);
    }

    @Transactional // Important pour garantir que tout se fait en une seule opération
    public Eleve create(Eleve eleve) {
        DossierAdministratif dossier = new DossierAdministratif();

        dossier.setDateCreation(new Date());
        dossier.setNumeroInscription("TEMP-" + System.currentTimeMillis());
        eleve.setDossierAdministratif(dossier);
        dossier.setEleve(eleve);

        Eleve savedEleve = eleveRepository.save(eleve);
        String filiereCode = (savedEleve.getFiliere() != null) ? savedEleve.getFiliere().getCode() : "IND";

        int year = java.time.Year.now().getValue();
        String finalNumero = filiereCode + "-" + year + "-" + savedEleve.getId();
        savedEleve.getDossierAdministratif().setNumeroInscription(finalNumero);

        return eleveRepository.save(savedEleve);
    }
    public void delete(Eleve eleve){
         eleveRepository.delete(eleve);
    }
    public void deleteById(int id){
        eleveRepository.deleteById(id);
    }

    public Eleve update(Eleve eleve){
        return eleveRepository.save(eleve);
    }
}
