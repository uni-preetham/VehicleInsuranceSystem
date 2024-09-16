package com.crimsonlogic.vehicleinsurancesystem.model;

import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Policy implements Serializable {

	private static final long serialVersionUID = 1L;

	private String policyNumber;
	private String policyType;
	private BigDecimal premiumAmount;
	private BigDecimal idv;

	public Policy(String policyNumber, String policyType, BigDecimal premiumAmount, BigDecimal idv) {
		this.policyNumber = policyNumber;
		this.policyType = policyType;
		this.premiumAmount = premiumAmount;
		this.idv = idv;
	}

	public Policy(String policyNumber, String policyType) {
		super();
		this.policyNumber = policyNumber;
		this.policyType = policyType;
	}

}
