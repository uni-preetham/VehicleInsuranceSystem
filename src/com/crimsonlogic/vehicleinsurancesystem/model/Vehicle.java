package com.crimsonlogic.vehicleinsurancesystem.model;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Vehicle implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long vehicleId;
	private Long userId;
	private String vehicleType;
	private String vehicleColor;
	private String vehiclePlateNumber;
	private LocalDate vehicleRegistrationDate;
	


	

	public Vehicle(Long vehicleId, Long userId, String vehicleType, String vehicleColor, String vehiclePlateNumber,
			LocalDate vehicleRegistrationDate) {
		super();
		this.vehicleId = vehicleId;
		this.userId = userId;
		this.vehicleType = vehicleType;
		this.vehicleColor = vehicleColor;
		this.vehiclePlateNumber = vehiclePlateNumber;
		this.vehicleRegistrationDate = vehicleRegistrationDate;
	}



	public Vehicle(Long vehicleId, String vehicleType, String vehicleColor, String vehiclePlateNumber,
			LocalDate vehicleRegistrationDate) {
		super();
		this.vehicleId = vehicleId;
		this.vehicleType = vehicleType;
		this.vehicleColor = vehicleColor;
		this.vehiclePlateNumber = vehiclePlateNumber;
		this.vehicleRegistrationDate = vehicleRegistrationDate;
	}



	public Vehicle(String vehicleType, String vehicleColor, String vehiclePlateNumber,
			LocalDate vehicleRegistrationDate, Long userId) {
		super();
		this.userId = userId;
		this.vehicleType = vehicleType;
		this.vehicleColor = vehicleColor;
		this.vehiclePlateNumber = vehiclePlateNumber;
		this.vehicleRegistrationDate = vehicleRegistrationDate;
	}
	
	
	
	
	
}
