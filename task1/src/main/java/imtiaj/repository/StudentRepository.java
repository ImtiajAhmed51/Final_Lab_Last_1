package imtiaj.repository;

import imtiaj.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentRepository {

    private final SessionFactory sessionFactory;

    public StudentRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    public void edit(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = get(id);
        if (user != null) {
            session.delete(user);
        }
    }

    public List<User> getAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<User> studentQuery = session.createQuery("from User", User.class);
        return studentQuery.getResultList();
    }

    public User get(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(User.class, id);
    }
}