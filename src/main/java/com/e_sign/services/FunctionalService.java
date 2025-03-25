package com.e_sign.services;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.util.UriComponentsBuilder;
import reactor.core.publisher.Mono;
import java.io.*;
import java.net.URL;

import com.e_sign.model.EsignResponse;
import com.e_sign.model.User;
import com.e_sign.repository.EsignResponseRepo;
import com.e_sign.repository.UserRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class FunctionalService {

	Logger log =LoggerFactory.getLogger(getClass());

	@Autowired
	private WebClient.Builder webClientBuilder;


	@Autowired
	EsignResponseRepo esignResponseRepo;

	@Autowired
	UserRepository userRepository;

	@Value("${destination}")
	private String destination;


	@Value("${updatedBy}")
	private String updatedBy;

	@Value("${kycUrl}")
	private String kycUrl;


	@Value("${baseUrl}")
	private String baseUrl;


	@Value("${transactionbody}")
	private String transactionbody;

	@Value("${from}")
	private String from;


	@Value("${cc}")
	private String cc;

	@Value("${subject}")
	private String subject;

	@Value("${password}")
	private String password;


	@Value("${naming}")
	private String naming;


	@Value("${host}")
	private String host;

	@Value("${port}")
	private String port;


	public String esignForm(String name, String email, String phone, String city, String purpose, String webhookUrl,
			String redirectUrl, String signPageNo, MultipartFile file
			,String notificationType, HttpServletRequest request) {



		try {
			String url = kycUrl;

			// Create form data
			MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
			formData.add("name", name);
			formData.add("email", email);
			formData.add("phone", phone);
			formData.add("city", city);
			formData.add("purpose", purpose);
			formData.add("webhookUrl", webhookUrl);
			formData.add("redirectUrl", redirectUrl);
			formData.add("signPageNo", signPageNo);

			if (file != null && !file.isEmpty()) {
				formData.add("file", new ByteArrayResource(file.getBytes()) {
					@Override
					public String getFilename() {
						return file.getOriginalFilename();
					}
				});
			}

			String response = webClientBuilder.baseUrl(url)
					.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.MULTIPART_FORM_DATA_VALUE)
					.build()
					.post()
					.uri(uriBuilder -> uriBuilder.build())
					.bodyValue(formData)
					.retrieve()
					.bodyToMono(String.class)
					.block(); 

			log.info("Response from aadhar: " + response);
			ObjectMapper objectMapper = new ObjectMapper();
			// Parse JSON response into a Map
			Map<String, Object> responseMap = objectMapper.readValue(response, Map.class);
			// Extract statusCode
			int statusCode = (Integer) responseMap.get("statusCode");
			String msg=(String) responseMap.get("message");
			// Extract data map
			Map<String, Object> dataMap = (Map<String, Object>) responseMap.get("data");

			// Print extracted values
			log.info("Status Code: " + statusCode);
			log.info("msg: " + msg);
			log.info("Data:");
			log.info("  Req ID: " + dataMap.get("req_id"));
			log.info("  Expires At: " + dataMap.get("expires_at"));
			log.info("  Phone: " + dataMap.get("phone"));
			log.info("  Name: " + dataMap.get("name"));
			log.info("  URL: " + dataMap.get("url"));

			User user =getLoggedUser();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date createdOn = new Date(); 
			String formattedDate = sdf.format(createdOn);

			log.info("username  :"+user.getUsername());
			log.info("formattedDate :"+formattedDate);



			if(statusCode== 200)
			{

				EsignResponse esignResponse=new EsignResponse();
				esignResponse.setExpireAt(""+dataMap.get("expires_at"));
				esignResponse.setReqId(""+dataMap.get("req_id"));
				esignResponse.setMsg(msg);
				esignResponse.setName(""+dataMap.get("name"));
				esignResponse.setPhone(""+dataMap.get("phone"));
				esignResponse.setUrl(""+dataMap.get("url"));
				esignResponse.setCreatedBy(""+user.getUsername());
				esignResponse.setCreatedOn(""+formattedDate);
				esignResponseRepo.save(esignResponse);

				if(notificationType.equalsIgnoreCase("email"))
				{
					String responsee=sendEmailNotification(email,phone);

				}
				return msg;	
			}



		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return "Something went wrong !";
	}

	private String sendEmailNotification(String email, String phone) {
		String response="";
		try 
		{

			log.info("Transactionbody :"+transactionbody);
			String page1 = transactionbody + "/eSign-template.html";
			String mailstring1 =readUsingFileInputStream(page1);
			//	mailstring1 = mailstring1.replace("{{MerchantName}}", merchantInfo.getMerchantName());
			log.info("mailstring1:-"+mailstring1);
			try 
			{
				log.info("inside method of email send chatnpay");
				// Set up WebClient
				WebClient webClient = WebClient.builder()
						.baseUrl(baseUrl)
						.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.MULTIPART_FORM_DATA_VALUE)
						.build();
				// Define the URI and request body
				String emailServiceUrl = UriComponentsBuilder.fromUriString("/sendEmail").toUriString();
				MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
				body.add("to", email);
				body.add("from", from);
				body.add("body", mailstring1);
				body.add("cc", cc);
				body.add("subject", subject);
				body.add("password", password);
				body.add("username", naming);
				body.add("mailHost", host);
				body.add("mailPort", port);

				log.info("body :"+body);
				Mono<String> responses = webClient.post()
						.uri(emailServiceUrl)
						.body(BodyInserters.fromMultipartData(body))
						.retrieve()
						.bodyToMono(String.class);
				responses.subscribe(
						responseBody -> log.info("The API Response is: " + responseBody),
						error -> log.error("Exception is: " + error.toString())
						);
				response="Mail Sent Successfully";	

			} catch (Exception e) {
				log.error("Exception is: " + e.toString());
				response="Something went wrong while sending mail";	
			}
		} catch (Exception e) 
		{
			log.error("--------Exception------" + e.toString());
			response="something went wrong";
		}
		return response;
	}

	public List<EsignResponse> getEsignReport() {
		try 
		{
			return esignResponseRepo.findReportdata();
		}
		catch(Exception e)
		{
			log.info(e.getMessage());
		}
		return null;
	}


	public List<EsignResponse> searchByPhone(String phone) {
		try 
		{
			return esignResponseRepo.searchByPhone(phone);		
		}
		catch(Exception e)
		{
			log.info(e.getMessage());
		}
		return null;
	}



	public User getLoggedUser() {
		SecurityContextHolder.getContext().getAuthentication().getDetails();
		String name = SecurityContextHolder.getContext().getAuthentication()
				.getName();

		String username = (!name.equals("anonymousUser")) ? name : null;
		User user = userRepository.findByUsername(username);
		return user != null ? user : null;
	}

	

	public String updateEsignReponse(String requestBody) throws JsonMappingException, JsonProcessingException 
	{
		String response;
		ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(requestBody);
       
		log.info("Processing updateEsignReponse."+rootNode);

		int statusCode = rootNode.get("statusCode").asInt();
		
		System.out.println("statusCode"+statusCode);
		if(statusCode == 99)
		{
			return response="name match score is less than 80%";
		}
		else
		{
		try {
			
			
			String postalCode = rootNode.path("data").path("signerDetails").path("postalCode").asText();
			String fetchedName = rootNode.path("data").path("signerDetails").path("fetchedName").asText();
			String fileUrl = rootNode.path("data").path("fileUrl").asText();
			String reqId = rootNode.path("data").path("reqId").asText();
			String respMsg = rootNode.path("message").asText();

			log.info("Postal Code: {}, Fetched Name: {}, File URL: {}, Request ID: {}, respMsg:{}", 
					postalCode, fetchedName, fileUrl, reqId,respMsg);
			
			
			// Prepare file destination
			String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String baseDirectory = destination;
			String destinationPath = baseDirectory+"signed_document_" + timestamp + ".pdf";

			// Download file from the signed URL
			downloadFile(fileUrl, destinationPath);

			// Prepare for database update
			String signerDetailsJson = rootNode.path("data").path("signerDetails").toString();;
			//String signerDetailsJson = rootNode.path("result").path("signer").toString();
			String updatedOn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			// Replace with actual user if applicable

			log.info("File downloaded to: {}", destinationPath);
			log.info("Signer Details JSON: {}", signerDetailsJson);

			// Update the database
			int updateResult = esignResponseRepo.updateEsignReponse(reqId, updatedBy, updatedOn, destinationPath, signerDetailsJson,respMsg);

			log.info("updateResult", updateResult);
			if(updateResult == 1)
			{
				response="Succesfully updated !";
			}
			else
			{
				response="Failed to update";
			}
		} catch (Exception e) {
			log.error("Error updating eSign response", e);
			response = "Error: " + e.getMessage();
		}
		return response;
		}
		
		
	}


	public static void downloadFile(String urlString,String destinationPath) {
		try (InputStream in = new URL(urlString).openStream()) {
			Files.copy(in, Paths.get(destinationPath), StandardCopyOption.REPLACE_EXISTING);
			System.out.println("File downloaded successfully to: " + destinationPath);
		} catch (IOException e) {
			System.err.println("Error while downloading file: " + e.getMessage());
		}
	}



	public static String readUsingFileInputStream(String fileName) throws IOException {
		FileInputStream fis = null;
		byte[] buffer = new byte[10];
		StringBuilder sb = new StringBuilder();
		try {
			fis = new FileInputStream(fileName);

			while (fis.read(buffer) != -1) {
				sb.append(new String(buffer));
				buffer = new byte[10];
			}
			fis.close();

		} catch (FileNotFoundException e) {
			e.toString();
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return sb.toString();
	}

}
