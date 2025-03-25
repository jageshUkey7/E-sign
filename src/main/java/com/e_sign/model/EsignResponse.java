package com.e_sign.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class EsignResponse 
{
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	private String ReqId;
	private String expireAt;
	private String msg;
	private String phone;
	private String name;
	private String url;
	private String createdBy;
	private String createdOn;
	private boolean signStatus=false;
	private String filePath;
	private String updatedBy;
	private String updatedOn;
	private String signerDetails;
	private String respMsg;

}
