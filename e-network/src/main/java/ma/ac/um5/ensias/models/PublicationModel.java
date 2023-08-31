package ma.ac.um5.ensias.models;

import ma.ac.um5.ensias.entities.Groupe;
import ma.ac.um5.ensias.entities.Jaime;
import ma.ac.um5.ensias.entities.Publication;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class PublicationModel {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public List<Publication> findALL() {
        List<Publication> publications = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            publications = session.createQuery("from Publication p where p.estVisible = true and p.groupe.id is null order by p.datePublication desc ").getResultList();
            transaction.commit();
        } catch (Exception e) {
            publications = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publications;
    }

    public List<Publication> findALLByGroup(int id_user) {
        List<ma.ac.um5.ensias.entities.Publication> publications = null;
        Session session = null;
        Transaction transaction = null;
        try {
            String sql ="select * from publication p where p.groupe_id in (select g.groupe_id from adherent_groupe g where g.adherent_id = "+id_user+") order by p.datePublication desc";
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            publications = session.createSQLQuery(sql).addEntity(Publication.class).getResultList();
            transaction.commit();
        } catch (Exception e) {
            publications = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publications;
    }

    public Publication findOneByID(int id) {
        Publication publication = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            publication = (Publication) session.createQuery("from Publication where id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            publication = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publication;
    }

    public Publication create(Publication publication) {
        Session session = null;
        Transaction transaction = null;
        try {
            publication.setEstVisible(true);
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(publication);
            transaction.commit();
        } catch (Exception e) {
            publication = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publication;
    }

    public Publication update(Publication publication) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(publication);
            transaction.commit();
        } catch (Exception e) {
            publication = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publication;
    }

    public boolean delete(Publication publication) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(publication);
            transaction.commit();
        } catch (Exception e) {
            result = false;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }
    public List<Publication> findPublicationsByGroup(int id_group) {
        List<Publication> publications = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            publications = session.createQuery("from Publication p where p.groupe.id = :idGroupe")
                    .setParameter("idGroupe",id_group)
                    .getResultList();
            transaction.commit();
        } catch (Exception e) {
            publications = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return publications;
    }
}
