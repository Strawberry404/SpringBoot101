

package school.springboot101.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "filiere")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Filiere {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique=true , nullable=false)
    private String code;

    @Column(nullable=false)
    private String nom;

    private String description;

    @ManyToMany(mappedBy = "filieres")
    private List<Cours> cours;

    @OneToMany(mappedBy = "filiere" , cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<Eleve> Eleves = new ArrayList<>();

}
