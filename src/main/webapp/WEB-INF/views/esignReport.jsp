<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* General body styling */
        body {
            margin: 0;
            background: url('images/reortss.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            font-family: "Poppins", serif;
        }
        .search-filter i {
            background: #c2c2c2;
            padding: 5px 8px;
            height: 20px;
            color: #333;
            border: 1px solid #878484;
            position: relative;
            top: -0.4px;
            left: -2px;
        }
        /* Dashboard container styling */
        .dashboard {
            /* background: rgb(249 249 249); */
            width: 80%;
            max-width: 1140px;
            /* border-radius: 5px; */
            text-align: center;
            border: 1px solid grey;
            margin: 5rem auto;
        }

        .dfbg {
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 2;
        }
        .sidebar-left {
            background: linear-gradient(45deg, #ffffff, #f0f0f0);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 0 1rem;
        }
        .nano-content {
            display: flex;
            justify-content: space-between;
        }
        .logo-section img {
            width: 110px;
            padding: 0.5rem;
        }


        .nav-main {
            margin: 0;
            padding: 0;
            display: flex ;
            list-style: none;
        }
        .nav-main li a {
            display: flex ;
            align-items: center;
            padding: 20px 15px;
            color: #a52a2a;
            font-weight: 400;
            transition: background 0.3s, color 0.3s;
            text-decoration: none;
            font-size: 0.85rem;
        }
        /* Table responsiveness and styling */
        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px 15px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: #333;
            font-size: 0.81rem;
            border: 1px solid #ddd;
        }

        /* Table header styling */
        th {
            background-color: #b9b9b9b3;
            color: #ffffff;
            position: sticky;
            top: 0;
            z-index: 1;
            font-weight: 500;
            text-transform: uppercase;
            border: 1px solid grey;
            text-shadow: 0px 1px 4px #000000;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }
        #reporttable {
            background: #ffffff;
        }
        tr:hover {
            background-color: rgb(243 243 243);
        }

        /* Responsive font sizes for smaller screens */
        /* @media (max-width: 768px) {
            th, td {
                font-size: 0.9em;
                padding: 10px;
            }
        } */

          /* Responsive styling */
          @media (max-width: 768px) {
           
            h2 {
                font-size: 1.5em;
            }

            .dashboard {
                width: 95%;
                margin: 2rem auto;
            }


            table a button, table button {
                font-size: 0.7em;
                padding: 5px;
            }
            .nav-main li a {
                display: flex;
                align-items: center !important;
                padding: 20px 6px !important;
            }
            .container {
                padding: 1rem;
            }
            .search-details {
                flex-direction: column;
            }
        }
        

        @media (max-width: 576px) {
            th, td {
                font-size: 0.7em;
                padding: 5px;
            }

            h2 {
                font-size: 1.2em;
            }

            table a button, table button {
                font-size: 0.65em;
                padding: 4px;
            }

            .button {
                font-size: 0.8em;
                padding: 8px 15px;
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

        /* Button inside table */
        table button {
            background-color: #09941d;
            border: none;
            padding: 5px 10px;
            color: #ffffff;
            cursor: pointer;
            border-radius: 0px;
            font-size: 0.9em;
            font-family: 'Poppins';
        }

        table button:hover {
            background-color: #26b944;
        }

        /* Anchor button styling */
      
        table a button:first-child {
            background-color: rgb(148 148 148);
        }
        table a button {
            background-color: #09941d;
            border: none;
            padding: 5px 10px;
            color: #ffffff;
            cursor: pointer;
            border-radius: 0px;
            font-size: 0.9em;
            font-family: Poppins;
        }

        table a button:hover {
            background-color: #0056b3;
        }

        table a button:first-child:hover {
            background-color: #22ad60;
        }

        .report-table {
            min-height: 200px;
            overflow: auto;
            max-height: 520px;
        }
        .report-header {
            background: #085394;
            padding: 0 8px;
            line-height: 2;
        }
        .report-header h2{
            color: #ffffff;
            margin: 0;
            font-size: 1rem;
            font-weight: normal;
            line-height: 2;
            font-family: 'Poppins';
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

        /* scroll bar setting */

        
           /* Custom Scrollbar only for .report-table */
            .report-table::-webkit-scrollbar {
                width: 4px; /* Width of the scrollbar */
                height: 4px; /* Height for horizontal scrollbars */
            }

            .report-table::-webkit-scrollbar-track {
                background: rgb(172, 75, 177);
            }

            .report-table::-webkit-scrollbar-thumb {
                background: rgb(172, 75, 177); /* Green color for the thumb */
                border-radius: 10px; /* Rounded corners */
            }

            .report-table::-webkit-scrollbar-thumb:hover {
                background: rgb(139, 62, 143);
            }

            /* Firefox-specific scrollbar styling for .report-table */
            .report-table {
                scrollbar-width: thin; /* Thin scrollbar */
                scrollbar-color: rgb(85, 51, 187) #f1f1f1; /* Green thumb and light background */
            }

        .search-details {
            display: flex;
            justify-content: space-between;
            background: #085394;
        }
        #sign-dearch {
            height: 30px;
            border: 1px solid grey;
            padding: 0 1rem;
        }
        .search-filter {
            padding: 0.2rem;
        }
        /* scroll bar setting end */
    </style>
</head>
<body>
    <div class="container">

    
        <div class="dashboard">
            <div class="search-details">
                <div class="report-header">
                    <h2>E-sign Report</h2>
                </div>
                <!-- <div class="search-filter">
                    <input type ="text" class="form-control" id="sign-dearch" placeholder="Search here"/><i class="fas fa-search"></i>
                </div> -->
                <div class="search-filter">
                <i class="fas fa-search"></i>
    <input type="text" class="form-control" id="sign-search" placeholder="Search by phone no. here" />
    
    <button type="button" class="btn btn-primary" onclick="handleSearch()">Search</button>
</div>
                
            </div>
            
            <div class="card-body report-table">
                <div class="table-responsive">
                    <table class="auth-ht table table-ecommerce-simple table-borderless table-striped mb-0" id="datatable-ecommerce-list">
                        <thead>
                            <tr>
                            <th>Sr.No</th>
                                <th>User Name</th>
                                <th>Req. Id</th>
                                <th>Created On</th>
                                <th>Created By</th>
                                <th>Sign Status</th>
                                <th>Response Msg</th>
                                <th>Phone No.</th>
                                <th>Download PDF</th>
                                <th>URL</th>
                            </tr>
                        </thead>
                        <tbody id="reporttable">
                            <!-- Dynamic data will go here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $(window).on('load', function () {
            esignReport();
        });

        function esignReport() {
            let html = "";
            $.ajax({
                type: "POST",
                url: 'fetchEsignReport',
                contentType: "application/json",
                success: function (data) {
                    console.log("Response data report is----" + JSON.stringify(data));

                    $.each(data, function (index, item) {
                        html += "<tr>";
                        html += "<td>" + (index + 1) + "</td>";
                        html += "<td>" + item.name + "</td>";
                        html += "<td>" + item.reqId + "</td>";
                        html += "<td>" + item.createdOn + "</td>";
                        html += "<td>" + item.createdBy + "</td>";
                        html += "<td>" + item.signStatus + "</td>";
                        html += "<td>" + item.respMsg + "</td>";
                        html += "<td>" + item.phone + "</td>";

                        if (item.filePath === null) {
                            html += "<td>NA</td>";
                        } else {
                            html += "<td>"
                                + "<button onclick='redirectToFunction(\"" + (item.filePath ? item.filePath.replace(/\\/g, '\\\\') : '') + "\")'>Download PDF</button>"
                                + "</td>";
                        }

                        html += "<td>"
                            + "<a href='" + item.url + "' target='_blank'>"
                            + "<button>Open</button>"
                            + "</a>"
                            + "<button onclick='copyToClipboardAsInput(\"" + item.url + "\")'>Copy</button>"
                            + "</td>";
                        html += "</tr>";
                    });

                    $('#reporttable').empty().append(html);
                },
                error: function () {
                    alert('Error fetching the report.');
                }
            });
        }
        
        
        
        function handleSearch()
        {

 
 var phone = $("#sign-search").val();
 alert("inside handleSearch "+phone);
 
 var formData = new FormData();
 formData.append("phone", phone);
 
 let html = "";
 
 $.ajax({
     url: "searchBymobile", // Replace with your server endpoint
     type: "POST",
     data: formData,
     processData: false, // Do not process FormData
     contentType: false, // Do not set contentType
		/* beforeSend : function(xhr) {
			ajaxindicatorstart("Loading.....");
		}, */
     success: function (data) 
     { 

    	 console.log("Response data report in search by----" + JSON.stringify(data));

     $.each(data, function (index, item) {
         html += "<tr>";
         html += "<td>" + (index + 1) + "</td>";
         html += "<td>" + item.name + "</td>";
         html += "<td>" + item.reqId + "</td>";
         html += "<td>" + item.createdOn + "</td>";
         html += "<td>" + item.createdBy + "</td>";
         html += "<td>" + item.signStatus + "</td>";
         html += "<td>" + item.respMsg + "</td>";
         html += "<td>" + item.phone + "</td>";

         if (item.filePath === null) {
             html += "<td>NA</td>";
         } else {
             html += "<td>"
                 + "<button onclick='redirectToFunction(\"" + (item.filePath ? item.filePath.replace(/\\/g, '\\\\') : '') + "\")'>Download PDF</button>"
                 + "</td>";
         }

         html += "<td>"
             + "<a href='" + item.url + "' target='_blank'>"
             + "<button>Open</button>"
             + "</a>"
             + "<button onclick='copyToClipboardAsInput(\"" + item.url + "\")'>Copy</button>"
             + "</td>";
         html += "</tr>";
     });

     $('#reporttable').empty().append(html);
     },
     error: function (error) {
         alert("Error submitting data");
     }
 });
 
 
        }
        
        
        
        
        
        
        
        

        function redirectToFunction(filePath) {
            var link = document.createElement('a');
            link.href = 'downloadPdf?filePath=' + encodeURIComponent(filePath);
            link.download = filePath.split('/').pop();
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        function copyToClipboardAsInput(url) {
            const tempInput = document.createElement("input");
            tempInput.value = url;
            document.body.appendChild(tempInput);
            tempInput.select();
            try {
                document.execCommand("copy");
                console.log("Copied as input:", url);
            } catch (error) {
                console.error("Failed to copy as input: ", error);
            }
            document.body.removeChild(tempInput);
        }
    </script>
</body>
</html>
