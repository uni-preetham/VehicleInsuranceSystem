package com.crimsonlogic.vehicleinsurancesystem.model;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Insurance implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long insuranceId;
	private Long vehicleId;
	private String policyNumber;
	private LocalDate insuranceStartDate;
	private LocalDate insuranceEndDate;
	private String insuranceValidity;
	private String approvalStatus;

	public Insurance(Long insuranceId, String policyNumber, LocalDate insuranceStartDate) {
		super();
		this.insuranceId = insuranceId;
		this.policyNumber = policyNumber;
		this.insuranceStartDate = insuranceStartDate;
	}

	public Insurance(Long insuranceId, Long vehicleId, String policyNumber, LocalDate insuranceStartDate,
			String insuranceValidity) {
		super();
		this.insuranceId = insuranceId;
		this.vehicleId = vehicleId;
		this.policyNumber = policyNumber;
		this.insuranceStartDate = insuranceStartDate;
		this.insuranceValidity = insuranceValidity;
	}

	public Insurance(Long vehicleId, String policyNumber) {
		super();
		this.vehicleId = vehicleId;
		this.policyNumber = policyNumber;
	}

	public Insurance(Long insuranceId, Long vehicleId, String policyNumber, LocalDate insuranceStartDate,
			LocalDate insuranceEndDate, String insuranceValidity, String approvalStatus) {
		super();
		this.insuranceId = insuranceId;
		this.vehicleId = vehicleId;
		this.policyNumber = policyNumber;
		this.insuranceStartDate = insuranceStartDate;
		this.insuranceEndDate = insuranceEndDate;
		this.insuranceValidity = insuranceValidity;
		this.approvalStatus = approvalStatus;
	}

}
