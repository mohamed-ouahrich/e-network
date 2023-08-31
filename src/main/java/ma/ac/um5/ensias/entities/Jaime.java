package ma.ac.um5.ensias.entities;

import javax.persistence.*;

@Entity
@Table(name = "jaime")
public class Jaime {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name = "publication_id")
    private Publication publication;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Publication getPublication() {
        return publication;
    }

    public void setPublication(Publication publication) {
        this.publication = publication;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Jaime() {
        super();
    }

    public Jaime(int id, Publication publication, User user) {
        this.id = id;
        this.publication = publication;
        this.user = user;
    }

    public Jaime(Publication publication, User user) {
        this.publication = publication;
        this.user = user;
    }
}
