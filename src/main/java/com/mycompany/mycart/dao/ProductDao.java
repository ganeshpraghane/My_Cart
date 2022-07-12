package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product p) {
        boolean f = false;
        try {
            Session hsession = this.factory.openSession();
            Transaction tx = hsession.beginTransaction();
            hsession.save(p);
            tx.commit();
            hsession.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    public List<Product> getAllProducts(){
       Session s=this.factory.openSession();
       Query query=s.createQuery("from Product");
       List<Product> list=query.list();
       s.close();
       return list;
    }
    public List<Product> getAllProductsById(int cid){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list=query.list();
        return list;
    }
}
