package com.infinite.jsf.recepient.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import com.infinite.jsf.provider.model.Claims;
import com.infinite.jsf.recepient.daoImpl.ClaimDaoImpl;
import com.infinite.jsf.recepient.model.Recipient;

public class ClaimController {

    private ClaimDaoImpl claimDao;
    private Claims claim;
    private Recipient recipient;

    private List<Claims> claimList;
    private List<Claims> result;

    private int page = 0;
    private int pageSize = 5;

    private String sortField;
    private boolean ascending = true;

    // ───── Getters and Setters ─────

    public ClaimDaoImpl getClaimDao() {
        return claimDao;
    }

    public void setClaimDao(ClaimDaoImpl claimDao) {
        this.claimDao = claimDao;
    }

    public Claims getClaim() {
        return claim;
    }

    public void setClaim(Claims claim) {
        this.claim = claim;
    }

    public Recipient getRecipient() {
        return recipient;
    }

    public void setRecipient(Recipient recipient) {
        this.recipient = recipient;
    }

    public String getSortField() {
        return sortField;
    }

    public void setSortField(String sortField) {
        this.sortField = sortField;
    }

    public boolean isAscending() {
        return ascending;
    }

    public void setAscending(boolean ascending) {
        this.ascending = ascending;
    }

    // ───── Custom Sort Logic ─────

    private Comparable getSortValue(Claims claim) {
        switch (sortField) {
            case "claimId":
                return claim.getClaimId();

            case "claimDate":
                return claim.getClaimDate();

            case "amountClaimed":
                return claim.getAmountClaimed();

            case "amountApproved":
                return claim.getAmountApproved();

            case "claimStatus":
                return claim.getClaimStatus();

            case "procedure.diagnosis":
                return claim.getProcedure() != null ? claim.getProcedure().getDiagnosis() : null;

            case "procedure.procedureDate":
                return claim.getProcedure() != null ? claim.getProcedure().getProcedureDate() : null;

            case "subscribe.coverage.insurancePlan.insuranceCompany.companyName":
                if (claim.getSubscribe() != null &&
                    claim.getSubscribe().getCoverage() != null &&
                    claim.getSubscribe().getCoverage().getInsurancePlan() != null &&
                    claim.getSubscribe().getCoverage().getInsurancePlan().getInsuranceCompany() != null) {
                    return claim.getSubscribe().getCoverage().getInsurancePlan().getInsuranceCompany().getCompanyName();
                }
                return null;

            default:
                return null;
        }
    }

    private void sortClaimList() {
        if (sortField == null || result == null) return;

        Collections.sort(result, (c1, c2) -> {
            Comparable val1 = getSortValue(c1);
            Comparable val2 = getSortValue(c2);
            if (val1 == null) return ascending ? -1 : 1;
            if (val2 == null) return ascending ? 1 : -1;
            return ascending ? val1.compareTo(val2) : val2.compareTo(val1);
        });
    }

    public void sortByAsc(String field) {
        this.sortField = field;
        this.ascending = true;
    }

    public void sortByDesc(String field) {
        this.sortField = field;
        this.ascending = false;
    }

    // ───── Pagination ─────

    public List<Claims> getPaginatedClaimList() {
        if (claimList == null || claimList.isEmpty()) {
            result = null;
            return null;
        }

        int fromIndex = page * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, claimList.size());

        result = claimList.subList(fromIndex, toIndex);
        sortClaimList();
        return result;
    }

    public void nextPage() {
        if ((page + 1) * pageSize < claimList.size()) page++;
    }

    public void previousPage() {
        if (page > 0) page--;
    }

    public boolean isHasNextPage() {
        return claimList != null && (page + 1) * pageSize < claimList.size();
    }

    public boolean isHasPreviousPage() {
        return claimList != null && page > 0;
    }

    // ───── Load Claims ─────

    public String viewMyClaims() {
        FacesContext context = FacesContext.getCurrentInstance();
        String hId = recipient.gethId();

        if (hId == null || hId.trim().isEmpty()) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Please enter a Recipient HId", null));
            return null;
        }

        if (!Pattern.matches("^[a-zA-Z0-9]+$", hId)) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Invalid HId format", null));
            return null;
        }

        if (!claimDao.isRecipientExist(hId)) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Recipient ID not found", null));
            return null;
        }

        claimList = claimDao.getClaimsByRecipient(hId);

        if (claimList == null || claimList.isEmpty()) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "No claims found for this recipient", null));
            return null;
        }

        page = 0;
        return null;
    }
}
