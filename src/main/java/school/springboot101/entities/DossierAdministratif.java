package school.springboot101.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import java.util.Date;

@Entity
@Table(name = "dossier_administratif")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class DossierAdministratif {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique = true, nullable = false)
    private String numeroInscription;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_creation", nullable = false)
    private Date dateCreation;

    @OneToOne(mappedBy = "dossierAdministratif")
    @ToString.Exclude
    private Eleve eleve;

}