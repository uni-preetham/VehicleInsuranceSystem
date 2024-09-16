package com.crimsonlogic.vehicleinsurancesystem.model;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4990302048286861230L;

	private String username;
	private String password;
	private boolean isAdmin;

}
