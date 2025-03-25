<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval expression="@environment.getProperty('connectionurl')"
	var="url" />
<c:set var="imageUrl" value="${url}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>

.loader {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 10px 20px;
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
}
body {
	background: linear-gradient(45deg, #eaeaea0a, #b9c8ffa1);
	height: 100vh;
}

.bg-light-s {
	background: linear-gradient(45deg, #eaeaea0a, #b9c8ff00);
}

.container-inner {
	width: 700px;
	text-align: center;
	margin: 0rem auto;
	padding: 4rem;
}

.pay-imagee {
	width: 600px;
}

.pay-imagee img {
	width: 520px;
}

#termsCheckbox {
	width: 18px;
	height: 18px;
}

label {
	font-size: 0.95rem;
}

.payNowButton:hover {
	box-shadow: 0px 2px 4px grey;
	background: #fff;
	color: #333;
	border: 1px solid #80808075;
	transition: all 0.6s ease;
	transform: scale(1.05);
}

.payNowButton {
	background: #09508d;
	color: #fff;
	font-size: 0.851rem;
	padding: 0.425rem 1.5rem;
	text-transform: uppercase;
	font-weight: 600;
	border: 0;
}

@media only screen and (max-width:500px) {
	.container-inner {
		width: 100%;
		margin: 0 auto;
		padding: 1rem;
	}
	.pay-imagee {
		width: 100%;
	}
}
</style>
<body>
	
	<!-- Header with logo and toggler -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light-s">
		<a class="navbar-brand" href="#"> <img
			src="${imageUrl}/custom/img/Ewnplogo.png" width="120" alt="Logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Services</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			</ul>
		</div>
	</nav>

	<%-- <div class="container">
        <div class="container-inner">
            <div class="row">
                <div class="pay-now-section">
                    <div class="pay-imagee">
                        <img src="${imageUrl}/custom/img/sign-success.png" alt="pay png image" class="img-fluid"/>
                    </div>
                    <div class="form-check">
                        
                       <label class="form-check-label" for="termsCheckbox"> 
                                    <strong>Thank you.</strong><br> You have successfully signed the terms and
                                    conditions using Aadhaar eSign.<br> Now you can continue with the transaction process.
                                </label>
                    </div>
                    <!-- <div class="pay-btn mt-3">
                        <button class="payNowButton" id="payNowButton" >Close</button>
                    </div> -->
                </div>
            </div>
        </div>
    </div> --%>






	<div class="container">
		<div class="container-inner">
			<div class="row">
				<c:choose>
					<c:when
						test="${esignStatus == true  or action == 'esign-success' }">
						<div class="pay-now-section">
							<div class="pay-imagee">
								<img src="${imageUrl}/custom/img/sign-success.png"
									alt="pay png image" class="img-fluid" />
							</div>
							<div class="form-check">
								<label class="form-check-label" for="termsCheckbox"> <strong>Thank
										you.</strong><br> You have successfully signed the terms and
									conditions using Aadhaar eSign.<br> Now you can continue
									with the transaction process.
								</label>
							</div>
						</div>
					</c:when>

					<c:when test="${esignStatus != true or action != 'esign-success'}">
						<div class="pay-now-section">
							<div class="pay-imagee">
								<img src="${imageUrl}/custom/img/sign-rejected.png"
									alt="pay png image" class="img-fluid" />
							</div>
							<div class="form-check">
								<label class="form-check-label" for="termsCheckbox"> Due
									to an incorrect Aadhaar name, the terms and conditions were not
									signed. Please retry with the correct Aadhaar KYC number. </label>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="pay-now-section">
							<div class="pay-imagee">
								<img src="${imageUrl}/custom/img/sign-rejected.png"
									alt="pay png image" class="img-fluid" />
							</div>
							<div class="form-check">
								<label class="form-check-label" for="termsCheckbox"> Due
									to an incorrect Aadhaar name, the terms and conditions were not
									signed. Please retry with the correct Aadhaar KYC number. </label>
							</div>
						</div>

					</c:otherwise>
				</c:choose>
			</div>

			<div class="pay-btn mt-3">
				<button class="payNowButton" id="payNowButton"
					onclick="FunctionRedirectTxnPage()">Continue To
					Transaction</button>
			</div>
		</div>
	</div>

	<script>
      
        function FunctionRedirectTxnPage() {
            try {
                // Log the payment model for debugging
                console.log("Payment model is: " + '${paymentModel}');
                
                // Extract values from paymentModel
                var mobileNo = '${paymentModel.cust_phone_no}';
                var TxnId = '${paymentModel.txn_id}';
                var CustEmail = '${paymentModel.cust_email}';
                var actionUrl = "${imageUrl}/checkMobileForTxn";
                console.log("Payment model is: " + actionUrl);

                // Validate extracted data
                if (!mobileNo || !TxnId || !CustEmail) {
                    throw new Error("Missing required payment model fields.");
                }

                // Create a loader (spinner)
                var loader = document.createElement("div");
                loader.className = "loader"; // You can style it with CSS
                loader.innerText = "Proccessing Redirect....";  // Optional text with the loader
                document.body.appendChild(loader);  // Add the loader to the body

                // Create a form element
                var form = document.createElement("form");
                form.method = "POST"; // Use GET if the server expects query parameters in the URL
                form.action = actionUrl;

                // Add inputs for each parameter
                var inputPhone = document.createElement("input");
                inputPhone.type = "hidden";
                inputPhone.name = "customer_phone";
                inputPhone.value = mobileNo;
                form.appendChild(inputPhone);

                var inputTxnId = document.createElement("input");
                inputTxnId.type = "hidden";
                inputTxnId.name = "txn_id";
                inputTxnId.value = TxnId;
                form.appendChild(inputTxnId);

                var inputEmail = document.createElement("input");
                inputEmail.type = "hidden";
                inputEmail.name = "email";
                inputEmail.value = CustEmail;
                form.appendChild(inputEmail);

                // Append the form to the body (required for submission)
                document.body.appendChild(form);

                // Submit the form


                // Hide the loader after submitting the form (can be done in the next page or after the submission is complete)
                setTimeout(function() {
                	 form.submit();
                    loader.style.display = 'none'; // Hide the loader (after a timeout for visibility)
                }, 5000);  // Adjust timeout based on expected submission time or on the next page load
            } catch (error) {
                // Handle any errors gracefully
                console.error("An error occurred:", error.message);
                alert("Failed to redirect to the transaction page. Please try again.");
            }
        }

    </script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
	
</body>
</html>
