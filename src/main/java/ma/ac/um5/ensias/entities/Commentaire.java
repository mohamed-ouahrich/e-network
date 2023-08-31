package ma.ac.um5.ensias.entities;

import javax.persistence.*;


@Entity
@Table(name = "commentaire")
public class Commentaire {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String contenu;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "publication_id")
    private Publication publication;

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

    public Publication getPublication() {
        return publication;
    }

    public void setPublication(Publication publication) {
        this.publication = publication;
    }

    public Commentaire(int id, String contenu, User user, Publication publication) {
        this.id = id;
        this.contenu = contenu;
        this.user = user;
        this.publication = publication;
    }

    public Commentaire() {
        super();
    }
}
