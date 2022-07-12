package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
//    get user by email and password

    public User getUserByEmailAndPass(String email, String pass) {
        User user = null;
        try {
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", pass);
            user = (User) q.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean saveUser(User user) {
        boolean f=false;
        try {
            Session hsession = this.factory.openSession();
            Transaction tx = hsession.beginTransaction();
            hsession.save(user);
            tx.commit();
            hsession.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }
}
