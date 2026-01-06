package school.springboot101.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.springboot101.entities.DossierAdministratif;
import school.springboot101.repository.DossierAdministratifRepository;

import java.util.List;

@Service
public class DossierAdministratifService {
    @Autowired

    private  DossierAdministratifRepository dossierRepository;

    public List<DossierAdministratif> findAll() {
        return dossierRepository.findAll();
    }

    public DossierAdministratif findById(int id){
        return dossierRepository.findById(id).orElse(null);
    }

    public DossierAdministratif create(DossierAdministratif value){
        return dossierRepository.save(value);
    }

    public void delete(DossierAdministratif value){
        dossierRepository.delete(value);
    }

    public DossierAdministratif update(DossierAdministratif value){
        return dossierRepository.save(value);
    }
}
