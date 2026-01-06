package school.springboot101.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.springboot101.entities.Filiere;
import school.springboot101.repository.FiliereRepository;

import java.util.List;

@Service
public class FiliereService {
    @Autowired

    private  FiliereRepository filiereRepository;

    public List<Filiere> findAll() {
        return filiereRepository.findAll();
    }

    public Filiere findById(int id){
        return filiereRepository.findById(id).orElse(null);
    }

    public Filiere create(Filiere value){
        return filiereRepository.save(value);
    }

    public void delete(Filiere value){
        filiereRepository.delete(value);
    }

    public Filiere update(Filiere value){
        return filiereRepository.save(value);
    }
    public void deleteById(int id){
        filiereRepository.deleteById(id);
    }
}
