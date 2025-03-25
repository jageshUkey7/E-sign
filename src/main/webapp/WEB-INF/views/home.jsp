<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    
    <style>
        /* Background and body styling */
        body {
            margin: 0;
            height: 100vh;
            font-family: "Poppins", serif;
            font-style: normal;
            background-image: url(images/report.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: right;

        }

        /* Dashboard container styling */
        .dashboard {
            background: #fff;
            width: 80%;
            max-width: 800px;
            margin: 6% auto;
            box-shadow: 0 0 4px grey;
        }

        /* Header styling */
        h2 {
            font-size: 2em;
            color: #00ccff;
            margin-bottom: 20px;
        }

        /* Form styling */
        .form-field  textarea{
            width: 99%;
            border-radius: 5px;
            border: 1px solid #aca4a4;
            box-shadow: 0 1px 2px #c6c3c3;
        }
        .form-field {
            margin: 10px 0;
            /* display: flex; */
            /* flex-direction: column; */
            /* align-items: flex-start; */
            width: 48%;
        }
        .form-fiels-joints {
            display: flex;
            justify-content: space-between;
        }
        .form-field label span{
            color: #ff4040;
        }
        .form-field label {
            font-size: 0.8em;
            color: #171414;
            margin-bottom: 2px;
            font-weight: 500;
        }

        .form-field input[type="text"],
        .form-field input[type="number"],
        .form-field input[type="file"] {
            width: -webkit-fill-available;
            padding: 10px;
            font-size: 0.8em;
            border: 1px solid #9c9c9c;
            border-radius: 5px;
            color: #424141;
            outline: none;
            box-shadow: 0 1px 2px #d0cdcd;
            height: 16px;
        }

        /* Button styling */
        .button {
            background-color: #00ccff;
            color: #ffffff;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 20px;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        .text-field {
            width: 100% !important;
            margin: 0;
        }

        .button:hover {
            background-color: #0099cc;
        }

        /* Hover effects and transition */
        .form-field input[type="text"]:focus,
        .form-field input[type="file"]:focus {
            border-color: #0099cc;
        }
        .sign-btn {
            text-align: center;
            margin-top: 1rem;
        }
        .sign-btn button:hover{
            background: #fff;
            color: #0f5793;
            box-shadow: 0 1px 2px rgb(207, 207, 207);
        }
        .sign-btn button{
            padding: 0.5rem 2rem;
            background: #0f5793;
            color: #fff;
            border: 1px solid grey;
            font-weight: 600;
            letter-spacing: 0.4px;
        }
        .form-section-dash {
            padding: 1rem 2rem;
        }
        .dash-head {
            background: #0f5793;
            text-align: center;
            padding: 0.25rem;
        }
        .dash-head  h2{
            font-size: 1.2em;
            color: #ffffff;
            margin: 0;
            font-weight: 300;
        }
        .dash-heade-2 {
            text-align: center;
            margin-bottom: -13px;
            margin-top: 1rem;
        }
        .dash-heade-2 h4{
            font-weight: 500;
            border-bottom: 2px solid #a42123;
            display: inline;
            padding: 0.25rem;
        }

        .error-message {
            color: red;
            font-size: 0.8em;
            display: none; /* Hide by default */
        }

         /* media css */
        @media only screen and (max-width:768px){
            .dashboard {
                max-width: 100% !important;
                margin: 25% auto !important;
                width: 100% !important;
            }
            .form-field {
                margin: 10px 0;
                width: 100%;
            }
            .form-fiels-joints {
                display: block;
            }
        }
        .radio-inputs {
            display: flex;
        }
        .radio-inputs .form-check {
            margin: 0 25px 0px 0px;
        }
        .radio-inputs .form-check input {
            margin: 0;
            height: 16px;
            width: 16px;
            position: relative;
            top: 3px;
        }
        .radio-inputs .form-check label {
            font-size: 0.8rem;
            font-weight: 500;
            font-family: 'Poppins';
        }
        .alert-notify {
            font-size: 0.81rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard">
            <div class="dash-head">
                <h2>Welcome !</h2>
            </div>
            <div class="dash-heade-2">
                <h4>Please Start E-sign Process ..!</h4>
            </div>
        <div class="form-section-dash">
                <form action="submitForm" method="post" enctype="multipart/form-data">
                    <div class="form-fiels-joints">
                        <div class="form-field">
                            <label for="param1">Name <span>*</span></label>
                            <input type="text" id="name" name="name" required>
                             <span id="nameError" class="error-message"></span>
                        </div>
                        <div class="form-field">
                            <label for="param2">Email <span>*</span></label>
                            <input type="text" id="email" name="email" required>
                             <span id="emailError" class="error-message"></span>
                        </div>
                    </div>
                   

                    <div class="form-fiels-joints">
                        <div class="form-field">
                            <label for="param2">Phone <span>*</span></label>
                            <input type="text" id="phone" name="phone" required>
                            <span id="phoneError" class="error-message"></span>
                            
                        </div>
                        <div class="form-field">
                            <label for="param2">City</label>
                            <input type="text" id="city" name="city" required>
                            <span id="cityError" class="error-message"></span>
                        </div>
                    </div>


                    <div class="form-field  text-field">
                        <label for="param2">Purpose <span>*</span></label>
                       
                        <textarea id="purpose" name="myTextarea" rows="4" cols="50" required>  </textarea>
                        <span id="purposeError" class="error-message"></span>
                    </div>

                    <div class="form-fiels-joints" style ="display: none;">
                        <div class="form-field">
                            <label for="param2">WebhookUrl:</label>
                            <input type="text" id="webhookUrl" value="http://203.192.228.125:7081/eSignWeb/webhookResp"  name="webhookUrl" required>
                        <span id="webhookUrlError" class="error-message"></span>
                        </div>
                        <div class="form-field">
                            <label for="param2">RedirectUrl:</label>
                            <input type="text" id="redirectUrl" value="http://203.192.228.125:7081/eSignWeb/returnUrlResp"  name="redirectUrl" required>
                        <span id="redirectUrlError" class="error-message"></span>
                        </div>
                    </div>
                    

                    <div class="form-fiels-joints">
                        <div class="form-field">
                            <label for="param2">Sign Page No <span>*</span></label>
                            <input type="number" id="signPageNo" name="signPageNo" placeholder="0" required>
                             <span id="signError" class="error-message"></span>
                        </div>
                        <div class="form-field">
                            <label for="param3">Upload File <span>*</span></label>
                            <input type="file" id="file" name="file" accept="application/pdf" required>
                        <span id="fileError" class="error-message"></span>
                        </div>
                    </div>
                    <label class="alert-notify">Alert Notifications</label>
                    <div class="radio-inputs">
                        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="email" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                               E-mail
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" value="sms" id="flexRadioDefault2" >
                            <label class="form-check-label" for="flexRadioDefault2">
                               SMS
                            </label>
                        </div>
                    </div>

                    <div class="sign-btn">
                        <button type="button" onclick="esign()" class="wp-seller">Submit</button>
                    </div>
                    
                </form>
                <p id="responseMessage"></p>
        </div>
        </div>
    </div>
</body>

<script>

function ajaxindicatorstart(message) {
    // Example implementation of a loading indicator
    $('body').append('<div id="ajaxIndicator" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: rgba(0, 0, 0, 0.8); color: white; padding: 10px; border-radius: 5px; z-index: 10000;">' + message + '</div>');
}

// To stop the indicator (when the AJAX call is done)
function ajaxindicatorstop() {
    $('#ajaxIndicator').remove();
}




function esign()
{

	

	
    $(".error-message").hide();

    var isValid = true; // Flag to track validation status

    var name = $("#name").val().trim();
    if (name === "") {
        $("#nameError").text("Please enter name").show();
        isValid = false;
        return;
    }

    var email = $("#email").val().trim();
    if (email === "") {
        $("#emailError").text("Please enter email").show();
        isValid = false;
        return;
    }

    var phone = $("#phone").val().trim();
    if (phone === "") {
        $("#phoneError").text("Please enter phone").show();
        isValid = false;
        return;
    }

    var city = $("#city").val().trim();
    if (city === "") {
        $("#cityError").text("Please enter city").show();
        isValid = false;
        return;
    }

    var purpose = $("#purpose").val().trim();
    if (purpose === "") {
        $("#purposeError").text("Please enter purpose").show();
        isValid = false;
        return;
    }

    var webhookUrl = $("#webhookUrl").val().trim();
    if (webhookUrl === "") {
        $("#webhookUrlError").text("Please enter webhook URL").show();
        isValid = false;
        return;
    }
    alert("webhookUrl: " + webhookUrl);

    var redirectUrl = $("#redirectUrl").val().trim();
    if (redirectUrl === "") {
        $("#redirectUrlError").text("Please enter redirect URL").show();
        isValid = false;
        return;
    }

    
   var signPageNo = $("#signPageNo").val();
     if (signPageNo === "") {
        $("#signError").text("Please enter valid page no.").show();
        isValid = false;
        return;
    }
    
    

    // Validate File Upload
  const fileInput = document.getElementById("file");
        if (fileInput.files.length === 0) {
            $("#fileError").text("Please upload a file").show();
            isValid = false;
            return;
        } else {
            $("#fileError").hide();
        }

        // Stop submission if invalid
        if (!isValid) {
            return;
        }
        
        
        var selectedNotify = $("input[name='flexRadioDefault']:checked").val();

    	alert("Selected Notification: " + selectedNotify);
    	
    
    // Create FormData object to include the file and other form data
    var formData = new FormData();
    formData.append("name", name);
    formData.append("email", email);
    formData.append("phone", phone);
    formData.append("city", city);
    formData.append("purpose", purpose);
    formData.append("webhookUrl", webhookUrl);
    formData.append("redirectUrl", redirectUrl);
    formData.append("signPageNo", signPageNo);
    formData.append("file", fileInput.files[0]);
    formData.append("notificationType",selectedNotify);

    // Log data for debugging
    console.log("FormData contents:");
    for (var pair of formData.entries()) {
        console.log(pair[0] + ": " + pair[1]);
    }

    
    $.ajax({
        url: "esignForm", // Replace with your server endpoint
        type: "POST",
        data: formData,
        processData: false, // Do not process FormData
        contentType: false, // Do not set contentType
		beforeSend : function(xhr) {
			ajaxindicatorstart("Loading.....");
		},
        success: function (response) 
        {
        	 console.log("Data submitted successfully!"+response);
        	 $('#responseMessage').html(response);
        	 
        	 setTimeout(function(){
      			window.location.href = " ";
          },5000); 
		  ajaxindicatorstop();
        },
        error: function (error) {
            alert("Error submitting data");
        }
    });
	
	
}


</script>

