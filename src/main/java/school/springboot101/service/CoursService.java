package school.springboot101.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.springboot101.entities.Cours;
import school.springboot101.repository.CoursRepository;

import java.util.List;


@Service
public class CoursService {
    @Autowired

    private  CoursRepository coursRepository;

    public List<Cours> findAll() {
        return coursRepository.findAll();
    }

    public Cours findById(int id){
        return coursRepository.findById(id).orElse(null);
    }

    public Cours create(Cours value){
        return coursRepository.save(value);
    }

    public void delete(Cours value){
        coursRepository.delete(value);
    }

    public Cours update(Cours value){
        return coursRepository.save(value);
    }
    public void deleteById(int id){
        coursRepository.deleteById(id);
    }
}
