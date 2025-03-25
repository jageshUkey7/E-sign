package com.e_sign.controllers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.e_sign.model.EsignResponse;
import com.e_sign.services.FunctionalService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;


@Controller
public class FunctionalController {
	
	Logger log =LoggerFactory.getLogger(getClass());
	
	@Autowired
	FunctionalService functionalService;
	
	@ResponseBody
	@RequestMapping("/esignForm")
    public String esignForm(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("city") String city,
            @RequestParam("purpose") String purpose,
            @RequestParam("webhookUrl") String webhookUrl,
            @RequestParam("redirectUrl") String redirectUrl,
            @RequestParam("signPageNo") String signPageNo,
            @RequestParam("file") MultipartFile file,
            @RequestParam("notificationType") String notificationType,
            HttpServletRequest request, Model model) 
	{
		log.info("file :"+file.getOriginalFilename());
		log.info("notificationType :"+notificationType);
    	String response=functionalService.esignForm(name,email,phone,city,purpose,webhookUrl,redirectUrl,signPageNo,file,notificationType,request);
        return response;
        
    }
	
	@ResponseBody
	@RequestMapping("fetchEsignReport")
	public List<EsignResponse> fetchEsignReport()
	{
		try 
		{
			log.info("fetchEsignReport inside");
			List<EsignResponse> response=functionalService.getEsignReport();
			log.info("fetchEsignReport response :"+response);
			return response;
		}
		catch(Exception e)
		{
			e.getMessage();
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("/searchBymobile")
	 public List<EsignResponse> searchByMobile( @RequestParam("phone") String phone)
	 {
		try 
		{
			log.info(" inside searchByMobile :"+phone);
			List<EsignResponse> response=functionalService.searchByPhone(phone);
			log.info("fetchEsignReport response :"+response);
			return response;
		}
		catch(Exception e)
		{
			e.getMessage();
			return null;
		}
	 }
	
	
	@ResponseBody
	@PostMapping("/webhookResp")
    public String webhookResp(@RequestBody String requestBody) {
		 try {
			 
			 log.info("requestBody"+requestBody);
		     
		        
		      return  functionalService.updateEsignReponse(requestBody);

		    } catch (Exception e) {
		        log.error("Error parsing JSON response", e);
		        return "Error processing webhook response";
		    }
    }
	
	 @GetMapping("/downloadPdf")
	    public ResponseEntity<FileSystemResource> downloadPdf(@RequestParam String filePath) {
	        //String filePath = "C:\\Users\\LENOVO\\Desktop\\UATWNP-13-11-24\\e-sign\\src\\main\\resources\\signed_document_20241209114746.pdf";
	        System.out.println("File path inn downloadPdf: " + filePath);

	        FileSystemResource fileResource = new FileSystemResource(filePath);
	        if (!fileResource.exists()) {
	            return ResponseEntity.notFound().build(); // Return 404 if file doesn't exist
	        }

	        // Set response headers to indicate a file download
	        HttpHeaders headers = new HttpHeaders();
	        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileResource.getFilename());
	        headers.add(HttpHeaders.CONTENT_TYPE, "application/pdf");

	        // Return the file as a response with the appropriate headers
	        return ResponseEntity.ok()
	                             .headers(headers)
	                             .body(fileResource);
	    }
	
	
	 

}
