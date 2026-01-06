package school.springboot101.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "eleve")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Eleve {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String matricule;
    private String nom;
    private String prenom;
    private String email;

    @ManyToOne
    @JoinColumn(name = "filiere_id")
    private Filiere filiere;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "dossier_administratif_id", referencedColumnName = "id")
    private DossierAdministratif dossierAdministratif;
}