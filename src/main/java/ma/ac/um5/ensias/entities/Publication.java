package ma.ac.um5.ensias.entities;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import javax.swing.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "publication")
public class Publication {

    @Id

    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String contenu;
    private LocalDateTime datePublication;
    private Boolean estVisible;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany
    @JoinColumn(name = "publication_id")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Commentaire> commentaires = new ArrayList<>();

    @OneToMany
    @JoinColumn(name = "publication_id")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Jaime> jaimes = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "groupe_id")
    private Groupe groupe;


    public Groupe getGroupe() {
        return groupe;
    }

    public void setGroupe(Groupe groupe) {
        this.groupe = groupe;
    }

    public List<Jaime> getJaimes() {
        return jaimes;
    }

    public void setJaimes(List<Jaime> jaimes) {
        this.jaimes = jaimes;
    }

    public List<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(List<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public LocalDateTime getDatePublication() {
        return datePublication;
    }

    public void setDatePublication(LocalDateTime datePublication) {
        this.datePublication = datePublication;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getEstVisible() {
        return estVisible;
    }

    public void setEstVisible(Boolean estVisible) {
        this.estVisible = estVisible;
    }

    public Publication(int id, String contenu, LocalDateTime datePublication, User user) {
        this.id = id;
        this.contenu = contenu;
        this.datePublication = datePublication;
        this.user = user;
    }

    public Publication() {
        super();
    }

    public Publication(String contenu, LocalDateTime datePublication) {
        this.contenu = contenu;
        this.datePublication = datePublication;
    }


}
