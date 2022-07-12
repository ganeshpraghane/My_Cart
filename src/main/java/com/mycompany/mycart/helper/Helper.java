
package com.mycompany.mycart.helper;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
    public static boolean saveFile(InputStream is,String path){
        boolean f=false;
        try {
            byte data[]=new byte[is.available()];
            is.read(data);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(data);
            fos.flush();
            fos.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public static String get10Words(String desc){
        String []strs=desc.split(" ");
        if(strs.length>10){
            String res="";
            for(int i=0;i<10;i++){
                res=res+strs[i]+" ";
            }
            return (res+"...");
        }
        else{
            return (desc+"...");
        }
    }
    public static Map<String,Long> getCounts(SessionFactory factory){
        Session session=factory .openSession();
        String q1="select count(*) from User";
        String q2="select count(*) from Product";
        Query query1=session.createQuery(q1);
        Query query2=session.createQuery(q2);
        Long userCount=(Long)query1.list().get(0);
        Long productCount=(Long)query2.list().get(0);
        Map<String,Long> map=new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        session.close();
        return map;
    }
}
