package ma.ac.um5.ensias.entities;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "groupe")
public class Groupe {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "name")
    private String name;


    @Column(name = "dateCreation")
    private LocalDate dateCreation;

    @ManyToOne
    @JoinColumn(name = "admin_id")
    private User user;

    @OneToMany
    @JoinColumn(name = "groupe_id")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Publication> publications = new HashSet<>();



    @ManyToMany(cascade = CascadeType.ALL)
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(
            name = "adherent_groupe",
            joinColumns ={@JoinColumn(name = "groupe_id")},
            inverseJoinColumns = {@JoinColumn(name = "adherent_id")}
    )

    private Set<User> adherents = new HashSet<>();


    public Set<Publication> getPublications() {
        return publications;
    }

    public void setPublications(Set<Publication> publications) {
        this.publications = publications;
    }



    public Set<User> getAdherents() {
        return adherents;
    }

    public void setAdherents(Set<User> adherents) {
        this.adherents = adherents;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public LocalDate getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation = dateCreation;
    }

    public Groupe(String name, LocalDate dateCreation) {
        this.name = name;
        this.dateCreation = dateCreation;
    }

    public Groupe(int id, String name, LocalDate dateCreation) {
        this.id = id;
        this.name = name;
        this.dateCreation = dateCreation;
    }

    public Groupe() {
    }
}
