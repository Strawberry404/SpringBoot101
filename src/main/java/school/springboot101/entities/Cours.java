package school.springboot101.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cours")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Cours {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique = true, nullable = false)
    private String code;

    @Column(nullable = false)
    private String intitule;

    // We removed 'mappedBy' here so this class owns the relationship
    @ManyToMany
    @JoinTable(name="filiere_cours",
            joinColumns = @JoinColumn(name = "cours_id"),
            inverseJoinColumns = @JoinColumn(name = "filiere_id")
    )
    private List<Filiere> filieres = new ArrayList<>();

    @ManyToMany
    @JoinTable(name="eleve_cours",
            joinColumns = @JoinColumn(name = "cours_id"),
            inverseJoinColumns = @JoinColumn(name = "eleve_id")
    )
    private List<Eleve> eleves = new ArrayList<>();

}