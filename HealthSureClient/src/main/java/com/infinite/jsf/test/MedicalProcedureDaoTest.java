package com.infinite.jsf.test;

import java.util.List;

import com.infinite.jsf.provider.model.MedicalProcedure;
import com.infinite.jsf.recepient.daoImpl.MedicalProcedureDaoImpl;

public class MedicalProcedureDaoTest {

    public static void main(String[] args) {

        String testHId = "HID001"; // Replace with a real h_id present in your DB

        MedicalProcedureDaoImpl dao = new MedicalProcedureDaoImpl();
        List<MedicalProcedure> visitList = dao.VisitHistoryByRecipient(testHId);

        if (visitList == null || visitList.isEmpty()) {
            System.out.println("No hospital visits found for Recipient ID: " + testHId);
        } else {
            System.out.println("=== Hospital Visit History for Recipient ID: " + testHId + " ===");
            for (MedicalProcedure mp : visitList) {
                System.out.println("-----------------------------------------------");
                System.out.println("Procedure ID   : " + mp.getProcedureId());
                System.out.println("Hospital Name  : " + mp.getProvider().getHospital_name());
                System.out.println("Doctor Name    : " + mp.getDoctor().getDoctorName());
                System.out.println("From Date      : " + mp.getFromDate());
                System.out.println("To Date        : " + mp.getToDate());
                System.out.println("Diagnosis      : " + mp.getDiagnosis());
            }
            System.out.println("Total visits found: " + visitList.size());
        }
    }
}
