<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval expression="@environment.getProperty('connectionurl')" var="frontendUrl" />
<c:set var="contextPath" value="${frontendUrl}" />

<!doctype html>
<html class="left-sidebar-panel sidebar-light" data-style-switcher-options="{'sidebarColor': 'light'}">
<head>
    <!-- Basic -->
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./eSign.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    
    
    <style>
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        
        .sidebar-left {
            background: linear-gradient(45deg, #ffffff, #f0f0f0);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 0 1rem;
        }

        .nav-main li a {
            display: flex;
            align-items: center;
            padding: 20px 15px;
            color: #a52a2a;
            font-weight: 600;
            transition: background 0.3s, color 0.3s;
            text-decoration: none;
            font-size: 0.85rem;
        }

        .nav-main li a:hover {
            background: #fff;
            border-top: 4px solid #0d5692;
        }

        .nav-main li a img {
            margin-right: 8px;
            width: 20px;
            height: 20px;
        }
        .nav-main {
            margin: 0;
            padding: 0;
            display: flex;
            list-style: none;
        }

        /* Datepicker styling */
        .datepicker-switch:hover {
            color: #3498db !important;
        }

        /* Body styling */
        body {
            background-color: #f5f5f5;
            margin: 0;
            height: 100vh;
            font-family: "Poppins", serif;
            font-style: normal;
        }
        .dfbg {
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 2;
        }
        .nano-content {
            display: flex;
            justify-content: space-between;
        }
        .logo-section img{
            width: 110px;
            padding: 0.5rem;
        }
        @media only screen and (max-width:768px){
            .nav-main li a {
                display: flex;
                align-items: center;
                padding: 20px 6px;
            }
            .sidebar-left {
                 padding: 0;
            }
        }
    </style>
</head>

<body>
    <div id="loader"></div>
    <section class="body">
        <!-- Header -->
        <!-- Optional header content -->

        <div class="dfbg">
            <div class="inner-wrapper">
                <!-- Sidebar -->
                <aside id="sidebar-left" class="sidebar-left">
                    <div class="nano">
                        <div class="nano-content">
                            <div class="logo-section">
                                <img src ="https://www.waitnpay.com/image/logo.png" alt ="logo" class="img-fluid"/>
                            </div>
                            <nav id="menu" class="nav-main-link" role="navigation">
                                <ul class="nav nav-main">
                                    <li>
                                        <a href="home"> 
                                            <!-- <img src="${contextPath}/img/dashboard.png" alt="Home Icon"> -->
                                            <span>Home</span>
                                        </a>
                                    </li>
                                    <li class="sidepanel-logout">
                                        <a href="esignReport"> 
                                            <!-- <img src="${contextPath}/img/logout.png" alt="Logout Icon"> -->
                                            <span>Reports</span>
                                        </a>
                                    </li>
                                    <li class="sidepanel-logout">
                                        <a href="logout"> 
                                            <!-- <img src="${contextPath}/img/logout.png" alt="Logout Icon"> -->
                                            <span>Logout </span>
                                        </a>
                                    </li>
                                  
                                   
                                </ul>
                            </nav>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="${contextPath}/js/header.js" type="application/javascript"></script>
    <script src="${contextPath}/js/spin.min.js" type="application/javascript"></script>
</body>
</html>
