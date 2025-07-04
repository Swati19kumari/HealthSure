package com.infinite.jsf.provider.model;

import java.io.Serializable;
import java.util.Date;

public class ProcedureTest implements Serializable {

    private String testId;
    private Prescription prescription;
    private String testName;
    private Date testDate;
    private String resultSummary;
    private Date createdAt;

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public Prescription getPrescription() {
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public Date getTestDate() {
        return testDate;
    }

    public void setTestDate(Date testDate) {
        this.testDate = testDate;
    }

    public String getResultSummary() {
        return resultSummary;
    }

    public void setResultSummary(String resultSummary) {
        this.resultSummary = resultSummary;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public ProcedureTest() {
        this.prescription = new Prescription(); // prevents null reference
    }

    public ProcedureTest(String testId, Prescription prescription, String testName, Date testDate, String resultSummary,
                         Date createdAt) {
        this.testId = testId;
        this.prescription = prescription;
        this.testName = testName;
        this.testDate = testDate;
        this.resultSummary = resultSummary;
        this.createdAt = createdAt;
    }
}
