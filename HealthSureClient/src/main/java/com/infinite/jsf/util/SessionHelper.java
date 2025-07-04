package com.infinite.jsf.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class SessionHelper {
 
    public static SessionFactory getSessionFactory() {
        return new AnnotationConfiguration().configure().buildSessionFactory();
    }
}