package com.infinite.jsf.recepient.dao;


import java.util.List;
import com.infinite.jsf.provider.model.Claims;

public interface ClaimDao {
    List<Claims> getClaimsByRecipient(String hId);  // Only filter by recipient ID
}
