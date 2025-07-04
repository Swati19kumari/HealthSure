package com.infinite.jsf.recepient.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.infinite.jsf.provider.model.Claims;
import com.infinite.jsf.recepient.dao.ClaimDao;
import com.infinite.jsf.util.SessionHelper;

public class ClaimDaoImpl implements ClaimDao {

    @Override
    public List<Claims> getClaimsByRecipient(String hId) {
        SessionFactory sf = SessionHelper.getSessionFactory();
        Session session = sf.openSession();

        String hql = "FROM Claims c " +
                     "JOIN FETCH c.subscribe s " +
                     "JOIN FETCH s.coverage co " +
                     "JOIN FETCH co.insurancePlan ip " +
                     "JOIN FETCH ip.insuranceCompany ic " +
                     "JOIN FETCH c.procedure mp " +
                     "WHERE c.recipient.hId = :hId";

        Query query = session.createQuery(hql);
        query.setParameter("hId", hId);

        List<Claims> list = query.list();
        return list;
    }

    //  Added this method to support validation
    public boolean isRecipientExist(String hId) {
        SessionFactory sf = SessionHelper.getSessionFactory();
        Session session = sf.openSession();

        String hql = "SELECT COUNT(*) FROM Recipient WHERE hId = :hId";
        Query query = session.createQuery(hql);
        query.setParameter("hId", hId);

        Long count = (Long) query.uniqueResult();
        return count > 0;
    }
}
