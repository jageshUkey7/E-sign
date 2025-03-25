<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    
    <style>
        /* Background and body styling */
        body {
            /* background: linear-gradient(45deg, #dcdcdc, #e4eafffa);*/
            margin: 0;
            height: 100vh;
            font-family: "Poppins", serif;
            font-style: normal; 
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
            max-width: 960px;
            margin: 8% auto;
            box-shadow: 0 0 4px grey;
        }

        /* Header styling */
        h2 {
            font-size: 2em;
            color: #00ccff;
            margin-bottom: 20px;
        }

        /* Table styling */
        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            color: #434141;
            border: 1px solid grey;
            font-size: 0.7rem;
            white-space: nowrap;
            padding: 5px 13px;
            font-weight: 500;
            cursor: pointer;
        }

        th {
            background-color: #014d8d;
            color: #ffffff;
            padding: 6px 10px;
            white-space: nowrap;
            border: 1px solid grey;
            font-size: 0.8rem;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover td {
            color:#fff
        }
        tr:hover {
            background-color: #653ca2;
        }
        .table-responsive {
            overflow-x: auto;
            height: 60vh;
        }

        /* Responsive table styles */
        @media (max-width: 768px) {
            table, th, td {
                font-size: 0.9em;
            }

            th, td {
                padding: 8px;
            }
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

        .button:hover {
            background-color: #0099cc;
        }

        /* Hover effects and transition */
        .form-field input[type="text"]:focus,
        .form-field input[type="file"]:focus {
            border-color: #0099cc;
        }
        .dash-head {
            background: brown;
            text-align: center;
            padding: 0.25rem;
        }
        .dash-head  h2{
            font-size: 1.32em;
            color: #ffffff;
            margin: 0;
        }
        .transaction-table {
            height: 60vh;
            background-image: url(images/r-bg.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard">
            <div class="dash-head">
                <h2>E-sign Report !</h2>
            </div>
            
            <div class="transaction-table">
                <div class="table-responsive">
                    <table class="table-striped mb-0 w-100">
                        <thead>
                            <tr>
                                <th>User Name</th>
                                <th>Req. Id</th>
                                <th>Created On</th>
                                <th>Created By</th>
                                <th>Sign Status</th>
                                <th>Phone No.</th>
                                <th>Url</th>
                            </tr>
                        </thead>
                        <tbody id="reporttable">
                         <!-- dynamic data goes here.. -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
$(window).on('load',function() {


	esignReport(); 
	
});
</script>

<script>
function  esignReport(){

	alert("inside  esignReport() function");
	
	
	
		
		let html = "";
		$.ajax({
	        type : "POST",

	        url : 'fetchEsignReport',

	       /*  data : JSON.stringify(SendInfo), */

	        contentType : "application/json",

	        success : function(data){

	        	 console.log("Response data report is----" + JSON.stringify(data));
	        	  
	        	 $.each(data, function(index, item) {

	        		 console.log("name" + item.name);
	        		 
	        		 html += "<tr>";

						html += "<td >"
								+ item.name
								+ "</td>";
								
								html += "<td >"
									+ item.reqId
									+ "</td>";	
									
									html += "<td >"
										+ item.createdOn
										+ "</td>";	
										html += "<td >"
											+ item.createdBy
											+ "</td>";	
							
											html += "<td >"
												+ item.signStatus
												+ "</td>";	
												
										html += "<td >"
											+ item.phone
											+ "</td>";	

											/* html += "<td >"
												+ item.url
												+ "</td>";	 */
												html += "<td>"
												       + "<a href='" + item.url + "' target='_blank'>"
												       + "<button>Open & Copy</button>"
												       + "</a>"
												       + "</td>";

											
										
						html += "</tr>";		
	                 
	             });

	        	
	        	 $('#reporttable').empty().append(html);
	        },
	        error : function() {

				alert('error');
			}

	        

	    });

		
	 



}

</script>

   
</body>
</html>
