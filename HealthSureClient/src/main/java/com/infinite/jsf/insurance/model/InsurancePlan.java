package com.infinite.jsf.insurance.model;

import java.io.Serializable;
import java.util.Date;

public class InsurancePlan implements Serializable {

    private String planId;
    private InsuranceCompany insuranceCompany; // company_id (FK)

    private String planName;
    private PlanType planType;
    private int minEntryAge;
    private int maxEntryAge;
    private String planDescription;
    private String availableCoverAmounts;
    private String waitingPeriod;
    private Date createdOn;
    private Date expireDate;
    private YesNo periodicDiseases;

    // Default constructor
    public InsurancePlan() {}

    // All-args constructor
    public InsurancePlan(String planId, InsuranceCompany insuranceCompany, String planName, PlanType planType,
                         int minEntryAge, int maxEntryAge, String planDescription, String availableCoverAmounts,
                         String waitingPeriod, Date createdOn, Date expireDate, YesNo periodicDiseases) {
        this.planId = planId;
        this.insuranceCompany = insuranceCompany;
        this.planName = planName;
        this.planType = planType;
        this.minEntryAge = minEntryAge;
        this.maxEntryAge = maxEntryAge;
        this.planDescription = planDescription;
        this.availableCoverAmounts = availableCoverAmounts;
        this.waitingPeriod = waitingPeriod;
        this.createdOn = createdOn;
        this.expireDate = expireDate;
        this.periodicDiseases = periodicDiseases;
    }

    // Getters and Setters

    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public InsuranceCompany getInsuranceCompany() {
        return insuranceCompany;
    }

    public void setInsuranceCompany(InsuranceCompany insuranceCompany) {
        this.insuranceCompany = insuranceCompany;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public PlanType getPlanType() {
        return planType;
    }

    public void setPlanType(PlanType planType) {
        this.planType = planType;
    }

    public int getMinEntryAge() {
        return minEntryAge;
    }

    public void setMinEntryAge(int minEntryAge) {
        this.minEntryAge = minEntryAge;
    }

    public int getMaxEntryAge() {
        return maxEntryAge;
    }

    public void setMaxEntryAge(int maxEntryAge) {
        this.maxEntryAge = maxEntryAge;
    }

    public String getPlanDescription() {
        return planDescription;
    }

    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }

    public String getAvailableCoverAmounts() {
        return availableCoverAmounts;
    }

    public void setAvailableCoverAmounts(String availableCoverAmounts) {
        this.availableCoverAmounts = availableCoverAmounts;
    }

    public String getWaitingPeriod() {
        return waitingPeriod;
    }

    public void setWaitingPeriod(String waitingPeriod) {
        this.waitingPeriod = waitingPeriod;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public YesNo getPeriodicDiseases() {
        return periodicDiseases;
    }

    public void setPeriodicDiseases(YesNo periodicDiseases) {
        this.periodicDiseases = periodicDiseases;
    }

    @Override
    public String toString() {
        return "InsurancePlan{" +
                "planId='" + planId + '\'' +
                ", insuranceCompany=" + insuranceCompany +
                ", planName='" + planName + '\'' +
                ", planType=" + planType +
                ", minEntryAge=" + minEntryAge +
                ", maxEntryAge=" + maxEntryAge +
                ", planDescription='" + planDescription + '\'' +
                ", availableCoverAmounts='" + availableCoverAmounts + '\'' +
                ", waitingPeriod='" + waitingPeriod + '\'' +
                ", createdOn=" + createdOn +
                ", expireDate=" + expireDate +
                ", periodicDiseases=" + periodicDiseases +
                '}';
    }
}
