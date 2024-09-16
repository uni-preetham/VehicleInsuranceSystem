package com.crimsonlogic.vehicleinsurancesystem.dao;

import java.util.List;

import com.crimsonlogic.vehicleinsurancesystem.model.Insurance;

public interface InsuranceDao {
	boolean insertInsurance(Insurance insurance);

	boolean updateInsurance(Insurance insurance);

	boolean deleteInsurance(Long insuranceId);

	Insurance getInsuranceById(Long insuranceId);

	List<Insurance> getPendingInsuranceRequests();
}
