package school.springboot101.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import school.springboot101.entities.DossierAdministratif;

public interface DossierAdministratifRepository extends JpaRepository<DossierAdministratif, Integer> {
}
