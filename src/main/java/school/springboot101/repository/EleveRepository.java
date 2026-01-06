package school.springboot101.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import school.springboot101.entities.Eleve;

public interface EleveRepository  extends JpaRepository<Eleve, Integer> {
}


