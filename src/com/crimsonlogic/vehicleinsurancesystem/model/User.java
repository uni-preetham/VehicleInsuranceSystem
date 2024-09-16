package com.crimsonlogic.vehicleinsurancesystem.model;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User implements Serializable{


	private static final long serialVersionUID = 1L;

	private Long userId;
	private String username;
	private String password;
	private String userEmail;
	private String userPhone;
	private String userFname;
	private String userLname;
	private boolean isAdmin;
	
	
}
