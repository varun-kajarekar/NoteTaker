package com.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.entity.Note;

public class DAO {
	
	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
								.addAnnotatedClass(Note.class).buildSessionFactory();
	
	public void addFileDetails(Note note) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(note);
		session.getTransaction().commit();
		System.out.println(note.getTitle()+" --->is added");
		session.close();
	}

	public List<Note> listFiles() {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		List<Note> files= session.createQuery("from notetaker").list();
		session.close();
		return files;
	}

	public void adduserDetails(Note notes) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(notes);
		session.getTransaction().commit();
		System.out.println(notes.getName()+" --->is added");
		session.close();
		
	}
	public boolean validateregister(String userName, String password) {

        Transaction transaction = null;
        Note user = null;
        try  {
        	Session session = factory.getSessionFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (Note) session.createQuery("FROM notetaker U WHERE U.username = :userName").setParameter("userName", userName).uniqueResult();
            if (user == null ) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;    
            }
        return false;
    }
	public boolean validate(String userName, String password) {

        Transaction transaction = null;
        Note user = null;
        try  {
        	Session session = factory.getSessionFactory().openSession();
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (Note) session.createQuery("FROM notetaker U WHERE U.username = :userName").setParameter("userName", userName).uniqueResult();

            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	public void deletenote(int nid) {
		Session session = factory.getCurrentSession();
		session.beginTransaction();
		Note note = session.get(Note.class, nid);
		session.delete(note);
		session.getTransaction().commit();
		System.out.println("Note--->is delete");
	}
}
