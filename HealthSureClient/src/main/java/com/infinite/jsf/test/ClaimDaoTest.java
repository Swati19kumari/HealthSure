package com.infinite.jsf.test;

import java.util.List;

import com.infinite.jsf.insurance.model.InsuranceCompany;
import com.infinite.jsf.insurance.model.InsuranceCoverageOption;
import com.infinite.jsf.insurance.model.InsurancePlan;
import com.infinite.jsf.insurance.model.Subscribe;
import com.infinite.jsf.provider.model.Claims;
import com.infinite.jsf.recepient.dao.ClaimDao;
import com.infinite.jsf.recepient.daoImpl.ClaimDaoImpl;

public class ClaimDaoTest {

    public static void main(String[] args) {
        String testHId = "HID001"; // Replace with actual h_id

        ClaimDao dao = new ClaimDaoImpl();
        List<Claims> claimsList = dao.getClaimsByRecipient(testHId);

        if (claimsList == null || claimsList.isEmpty()) {
            System.out.println("No claims found for Recipient ID: " + testHId);
        } else {
            System.out.println("=== Insurance Claims for Recipient ID: " + testHId + " ===");
            for (Claims c : claimsList) {
                System.out.println("----------------------------------------");
                System.out.println("Claim ID         : " + c.getClaimId());
                System.out.println("Claim Status     : " + c.getClaimStatus());
                System.out.println("Claim Date       : " + c.getClaimDate());
                System.out.println("Amount Claimed   : ₹" + c.getAmountClaimed());
                System.out.println("Amount Approved  : ₹" + c.getAmountApproved());
                System.out.println("Diagnosis        : " + c.getProcedure().getDiagnosis());
                System.out.println("Procedure Date   : " + c.getProcedure().getProcedureDate());



                Subscribe subscription = c.getSubscribe(); // ✅ instead of getCoverage()

                if (subscription != null) {
                    InsuranceCoverageOption option = subscription.getCoverage();
                    if (option != null) {
                        InsurancePlan plan = option.getInsurancePlan();
                        if (plan != null) {
                            InsuranceCompany company = plan.getInsuranceCompany();
                            if (company != null) {
                                System.out.println("Insurance Company: " + company.getCompanyName());
                            }
                        }
                    }
                }

            System.out.println("Total claims found: " + claimsList.size());
        }
    }
    }
}

