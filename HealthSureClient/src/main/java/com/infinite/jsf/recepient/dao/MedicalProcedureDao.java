package com.infinite.jsf.recepient.dao;

import java.util.List;
import com.infinite.jsf.provider.model.MedicalProcedure;
import com.infinite.jsf.provider.model.PrescribedMedicines;
import com.infinite.jsf.provider.model.ProcedureTest;

public interface MedicalProcedureDao {
    List<MedicalProcedure> VisitHistoryByRecipient(String hId);
    
    List<PrescribedMedicines> getPrescribedMedicinesByProcedureId(String procedureId);

    List<ProcedureTest> getProcedureTestsByPrescriptionId(String prescriptionId);
}