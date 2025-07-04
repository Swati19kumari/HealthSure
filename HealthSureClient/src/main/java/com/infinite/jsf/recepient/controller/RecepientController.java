package com.infinite.jsf.recepient.controller;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import com.infinite.jsf.provider.model.MedicalProcedure;
import com.infinite.jsf.provider.model.PrescribedMedicines;
import com.infinite.jsf.provider.model.ProcedureTest;
import com.infinite.jsf.provider.model.Prescription;
import com.infinite.jsf.recepient.dao.MedicalProcedureDao;
import com.infinite.jsf.recepient.daoImpl.MedicalProcedureDaoImpl;
import com.infinite.jsf.recepient.model.Recipient;

public class RecepientController {

    private MedicalProcedureDao medicalProcedureDao = new MedicalProcedureDaoImpl();

    private List<MedicalProcedure> visitList;
    private List<PrescribedMedicines> prescribedMedicinesList;
    private List<ProcedureTest> procedureTestList;

    private MedicalProcedure medicalProcedure = new MedicalProcedure();
    private Prescription prescription = new Prescription();

    private Recipient recipient = new Recipient();

    // ====== Visit History ======
    public String showVisitHistory() {
        if (recipient.gethId() == null || recipient.gethId().isEmpty()) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Recipient ID is missing", null));
            return null;
        }
        visitList = medicalProcedureDao.VisitHistoryByRecipient(recipient.gethId());
        return "visitHistory.jsp?faces-redirect=true";
    }

    // ====== Prescribed Medicines by Procedure ID ======
    public String showPrescribedMedicines(String procedureId) {
        prescribedMedicinesList = medicalProcedureDao.getPrescribedMedicinesByProcedureId(procedureId);
        return "prescribedMedicines.jsp?faces-redirect=true";
    }

    // ====== Procedure Test History by Prescription ID ======
    public String showProcedureTests(String prescriptionId) {
        procedureTestList = medicalProcedureDao.getProcedureTestsByPrescriptionId(prescriptionId);
        return "procedureTestHistory.jsp?faces-redirect=true";
    }

    // ========== Getters and Setters ==========

    public List<MedicalProcedure> getVisitList() {
        return visitList;
    }

    public void setVisitList(List<MedicalProcedure> visitList) {
        this.visitList = visitList;
    }

    public List<PrescribedMedicines> getPrescribedMedicinesList() {
        return prescribedMedicinesList;
    }

    public void setPrescribedMedicinesList(List<PrescribedMedicines> prescribedMedicinesList) {
        this.prescribedMedicinesList = prescribedMedicinesList;
    }

    public List<ProcedureTest> getProcedureTestList() {
        return procedureTestList;
    }

    public void setProcedureTestList(List<ProcedureTest> procedureTestList) {
        this.procedureTestList = procedureTestList;
    }

    public MedicalProcedure getMedicalProcedure() {
        return medicalProcedure;
    }

    public void setMedicalProcedure(MedicalProcedure medicalProcedure) {
        this.medicalProcedure = medicalProcedure;
    }

    public Prescription getPrescription() {
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    public Recipient getRecipient() {
        return recipient;
    }

    public void setRecipient(Recipient recipient) {
        this.recipient = recipient;
    }
}
