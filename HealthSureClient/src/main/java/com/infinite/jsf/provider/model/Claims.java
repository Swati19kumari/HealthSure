package com.infinite.jsf.provider.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.infinite.jsf.insurance.model.Subscribe;
import com.infinite.jsf.recepient.model.Recipient;

public class Claims implements Serializable {

    private String claimId;

    private Subscribe subscribe; // maps to subscribe_id

    private MedicalProcedure procedure; // maps to procedure_id

    private Providers providers; // maps to provider_id

    private Recipient recipient; // maps to h_id

    private ClaimStatus claimStatus; // Enum: PENDING, APPROVED, DENIED

    private Date claimDate;

    private double amountClaimed;

    private double amountApproved;

    private List<ClaimHistory> claimHistories; // One-to-many

    // ===== Getters and Setters =====

    public String getClaimId() {
        return claimId;
    }

    public void setClaimId(String claimId) {
        this.claimId = claimId;
    }

    public Subscribe getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(Subscribe subscribe) {
        this.subscribe = subscribe;
    }

    public MedicalProcedure getProcedure() {
        return procedure;
    }

    public void setProcedure(MedicalProcedure procedure) {
        this.procedure = procedure;
    }

    public Providers getProviders() {
        return providers;
    }

    public void setProviders(Providers providers) {
        this.providers = providers;
    }

    public Recipient getRecipient() {
        return recipient;
    }

    public void setRecipient(Recipient recipient) {
        this.recipient = recipient;
    }

    public ClaimStatus getClaimStatus() {
        return claimStatus;
    }

    public void setClaimStatus(ClaimStatus claimStatus) {
        this.claimStatus = claimStatus;
    }

    public Date getClaimDate() {
        return claimDate;
    }

    public void setClaimDate(Date claimDate) {
        this.claimDate = claimDate;
    }

    public double getAmountClaimed() {
        return amountClaimed;
    }

    public void setAmountClaimed(double amountClaimed) {
        this.amountClaimed = amountClaimed;
    }

    public double getAmountApproved() {
        return amountApproved;
    }

    public void setAmountApproved(double amountApproved) {
        this.amountApproved = amountApproved;
    }

    public List<ClaimHistory> getClaimHistories() {
        return claimHistories;
    }

    public void setClaimHistories(List<ClaimHistory> claimHistories) {
        this.claimHistories = claimHistories;
    }
}
