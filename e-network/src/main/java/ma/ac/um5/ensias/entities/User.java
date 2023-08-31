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
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String fullName;
    private String passWord;
    private String gmail;
    private String filiere;
    private LocalDate dateCreation;

    @OneToMany
    @JoinColumn(name = "admin_id")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Groupe> groupes = new ArrayList<>();
    
    @OneToMany
    @JoinColumn(name = "user_id")
    private List<Publication> publications = new ArrayList<>();

    @OneToMany
    @JoinColumn(name = "user_id")
    private List<Commentaire> commentaires=  new ArrayList<>();

    @OneToMany
    @JoinColumn(name = "user_id")
    private List<Jaime> jaimes = new ArrayList<>();

    @ManyToMany(mappedBy = "adherents")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Groupe> groupesAdhesion = new HashSet<>();

    public Set<Groupe> getGroupesAdhesion() {
        return groupesAdhesion;
    }

    public void setGroupesAdhesion(Set<Groupe> groupesAdhesion) {
        this.groupesAdhesion = groupesAdhesion;
    }

    public List<Jaime> getJaimes() {
        return jaimes;
    }

    public void setJaimes(List<Jaime> jaimes) {
        this.jaimes = jaimes;
    }

    public List<Publication> getPublications() {
        return publications;
    }

    public void setPublications(List<Publication> publications) {
        this.publications = publications;
    }

    public List<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(List<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }


    public List<Groupe> getGroupes() {
        return groupes;
    }

    public void setGroupes(List<Groupe> groupes) {
        this.groupes = groupes;
    }

    public LocalDate getDateCreation() {
        return dateCreation;
    }
    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getFiliere() {
        return filiere;
    }

    public void setFiliere(String filiere) {
        this.filiere = filiere;
    }

    public User() {
        super();
    }

    public User(String fullName, String passWord, String gmail, String filiere, LocalDate dateCreation) {
        this.fullName = fullName;
        this.passWord = passWord;
        this.gmail = gmail;
        this.filiere = filiere;
        this.dateCreation = dateCreation;
    }

    public User(int id, String fullName, String passWord, String gmail, String filiere, LocalDate dateCreation) {
        this.id = id;
        this.fullName = fullName;
        this.passWord = passWord;
        this.gmail = gmail;
        this.filiere = filiere;
        this.dateCreation = dateCreation;
    }
}
