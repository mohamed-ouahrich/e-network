package ma.ac.um5.ensias.models;

import ma.ac.um5.ensias.entities.Jaime;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class LikeModel {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public List<Jaime> findALL() {
        List<Jaime> likes = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            likes = session.createQuery("from Jaime").getResultList();
            transaction.commit();
        } catch (Exception e) {
            likes = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return likes;
    }

    public Jaime findOneByID(int id) {
        Jaime jaime = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            jaime = (Jaime) session.createQuery("from Jaime where id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            jaime = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return jaime;
    }

    public Jaime findOneUserAndPublication(int id_user, int id_publication) {
        Jaime jaime = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            jaime = (Jaime) session.createQuery("from Jaime j where j.user.id = :idUser and j.publication.id = :idPub")
                    .setParameter("idUser",id_user)
                    .setParameter("idPub", id_publication)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            jaime = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return jaime;
    }



    public Jaime create(Jaime jaime) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(jaime);
            transaction.commit();
        } catch (Exception e) {
            jaime =null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return jaime;
    }
    public Jaime update(Jaime jaime) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(jaime);
            transaction.commit();
        } catch (Exception e) {
            jaime =null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return jaime;
    }
    public boolean delete(Jaime jaime) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(jaime);
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
