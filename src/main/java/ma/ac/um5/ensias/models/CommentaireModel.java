package ma.ac.um5.ensias.models;

import ma.ac.um5.ensias.entities.Commentaire;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class CommentaireModel {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public List<Commentaire> findALL() {
        List<Commentaire> commentaires = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            commentaires = session.createQuery("from Commentaire").getResultList();
            transaction.commit();
        } catch (Exception e) {
            commentaires = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return commentaires;
    }

    public Commentaire findOneByID(int id) {
        Commentaire commentaire = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            commentaire = (Commentaire) session.createQuery("from Commentaire where id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            commentaire = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return commentaire;
    }
    public Commentaire create(Commentaire commentaire) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(commentaire);
            transaction.commit();
        } catch (Exception e) {
            commentaire=null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return commentaire;
    }
    public Commentaire update(Commentaire commentaire) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(commentaire);
            transaction.commit();
        } catch (Exception e) {
            commentaire=null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return commentaire;
    }
    public boolean delete(Commentaire commentaire) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(commentaire);
            transaction.commit();
        } catch (Exception e) {
            result= false;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }
}
