package ma.ac.um5.ensias.models;

import ma.ac.um5.ensias.entities.Groupe;
import ma.ac.um5.ensias.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class GroupeModel {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public List<Groupe> findALL() {
        List<Groupe> groupes = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            groupes = session.createQuery("from Groupe").getResultList();
            transaction.commit();
        } catch (Exception e) {
            groupes = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupes;
    }

    public List<Groupe> getAllMyGroup(int idUser) {
        List<Groupe> groupes = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            groupes = session.createQuery("from Groupe g where g.user.id = :idUser")
                    .setParameter("idUser", idUser)
                    .getResultList();
            transaction.commit();
        } catch (Exception e) {
            groupes = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupes;
    }

    public Groupe findOneByID(int id) {
        Groupe groupe = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            groupe = (Groupe) session.createQuery("from Groupe where id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            groupe = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupe;
    }

    public Groupe create(Groupe groupe) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(groupe);
            transaction.commit();
        } catch (Exception e) {
            groupe = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupe;
    }

    public Groupe update(Groupe groupe) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(groupe);
            transaction.commit();
        } catch (Exception e) {
            groupe = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupe;
    }

    public boolean delete(Groupe groupe) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(groupe);
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

    public List<Groupe> getOtherGroup(int idUser) {
        List<Groupe> groupes = null;
        Session session = null;
        Transaction transaction = null;
        try {
            String sql ="select * from ( select * from groupe g where g.admin_id != "+idUser+") as res where id not in (select a.groupe_id from adherent_groupe a where a.adherent_id = "+idUser+")";
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            groupes= session.createSQLQuery(sql).addEntity(Groupe.class).getResultList();
            transaction.commit();
        } catch (Exception e) {
            groupes = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return groupes;
    }
}
