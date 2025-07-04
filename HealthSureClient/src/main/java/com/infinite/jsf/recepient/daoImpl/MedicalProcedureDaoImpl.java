package com.infinite.jsf.recepient.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.infinite.jsf.provider.model.MedicalProcedure;
import com.infinite.jsf.provider.model.PrescribedMedicines;
import com.infinite.jsf.provider.model.ProcedureTest;
import com.infinite.jsf.recepient.dao.MedicalProcedureDao;
import com.infinite.jsf.util.SessionHelper;

public class MedicalProcedureDaoImpl implements MedicalProcedureDao {

    @Override
    public List<MedicalProcedure> VisitHistoryByRecipient(String hId) {
        Session session = SessionHelper.getSessionFactory().openSession();
        String hql = "FROM MedicalProcedure mp WHERE mp.recipient.hId = :hId ORDER BY mp.fromDate DESC";
        Query query = session.createQuery(hql);
        query.setParameter("hId", hId);
        List<MedicalProcedure> list = query.list();
        session.close();
        return list;
    }

    @Override
    public List<PrescribedMedicines> getPrescribedMedicinesByProcedureId(String procedureId) {
        Session session = SessionHelper.getSessionFactory().openSession();
        String hql = "FROM PrescribedMedicines pm WHERE pm.prescription.procedure.procedureId = :procedureId";
        Query query = session.createQuery(hql);
        query.setParameter("procedureId", procedureId);
        List<PrescribedMedicines> list = query.list();
        session.close();
        return list;
    }

    @Override
    public List<ProcedureTest> getProcedureTestsByPrescriptionId(String prescriptionId) {
        Session session = SessionHelper.getSessionFactory().openSession();
        String hql = "FROM ProcedureTest pt WHERE pt.prescription.prescriptionId = :prescriptionId";
        Query query = session.createQuery(hql);
        query.setParameter("prescriptionId", prescriptionId);
        List<ProcedureTest> list = query.list();
        session.close();
        return list;
    }
}
