package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveCategory(Category cat) {
        boolean f = false;
        try {
            Session hibersession = factory.openSession();
            Transaction tx = hibersession.beginTransaction();
            hibersession.save(cat);
            tx.commit();
            hibersession.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }

    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }

    public Category getCategoryById(int cid) {
        Session session = factory.openSession();
        Category cat = session.get(Category.class, cid);
        session.close();
        return cat;
    }
}
