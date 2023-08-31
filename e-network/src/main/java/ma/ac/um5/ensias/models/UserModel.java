package ma.ac.um5.ensias.models;


import ma.ac.um5.ensias.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

public class UserModel {
    private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    public List<User> findALL() {
        List<User> users = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            users = session.createQuery("from User").getResultList();
            transaction.commit();
        } catch (Exception e) {
            users = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return users;
    }

    public User findOneByEmail(String mail) {
        User user = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            user = (User) session.createQuery("from User where gmail like :gmail")
                    .setParameter("gmail", mail)
                    .getResultList().get(0);
            transaction.commit();
        } catch (Exception e) {
            user = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return user;
    }

    public User findOneByID(int id) {
        User user = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            user = (User) session.createQuery("from User where id = :id")
                    .setParameter("id", id)
                    .getSingleResult();
            transaction.commit();
        } catch (Exception e) {
            user = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return user;
    }

    public User create(User user) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            user = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return user;
    }

    public User update(User user) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
        } catch (Exception e) {
            user = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return user;
    }

    public boolean delete(User user) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.delete(user);
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

    public List<User> getTopTenActif() {
        List<User> users = null;
        Session session = null;
        Transaction transaction = null;
        try {
            String sql = "select user.* from user right join (select user_id, count(*) as total from publication group by user_id order by total desc limit 10 ) as result on user.id = result.user_id";
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            users = session.createSQLQuery(sql).list();
            transaction.commit();
        } catch (Exception e) {
            users = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return users;
    }

    public List<User> findToPTen() {
        List<Object> rows;
        List<User> users = null;
        Session session = null;
        Transaction transaction = null;
        try {
            String sql = "select user.* from user right join (select user_id, count(*) as total from publication group by user_id order by total desc limit 10 ) as result on user.id = result.user_id";
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            users= session.createSQLQuery(sql).addEntity(User.class).getResultList();
            transaction.commit();
        } catch (Exception e) {
            users = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return users;
    }
}
