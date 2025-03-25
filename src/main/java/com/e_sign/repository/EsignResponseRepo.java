package com.e_sign.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.e_sign.model.EsignResponse;

import java.util.List;

import javax.transaction.Transactional;

@Repository
public interface EsignResponseRepo extends JpaRepository<EsignResponse, Long>{

	
	@Transactional
	@Modifying
	@Query(value = "update WaitnpayEsign.esign_response set sign_status=1,updated_by=?2,updated_on=?3,file_path=?4,signer_details=?5 ,resp_msg=?6 where req_id=?1  ",nativeQuery = true)
	 public int updateEsignReponse( String reqId, String updatedBy, String updatedOn,String destination,String signerDetails,String respMsg);

	
	@Query(value = "SELECT * FROM WaitnpayEsign.esign_response order by created_on desc;",nativeQuery = true)
	public List<EsignResponse> findReportdata();

	@Query(value = "SELECT * FROM WaitnpayEsign.esign_response where phone=?1 order by created_on desc;",nativeQuery = true)
	public List<EsignResponse> searchByPhone(String phone);



}
