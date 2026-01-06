package school.springboot101.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import school.springboot101.entities.Cours;

public interface CoursRepository extends JpaRepository<Cours, Integer> {
}
