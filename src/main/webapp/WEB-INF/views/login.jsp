<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link  href="">
    <link rel="stylesheet" href="./eSign.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            margin: 0;
            height: 100vh;
            font-family: "Poppins", serif;
            font-style: normal;

        }
        .login-container {
            background-color: #a52a2a9e;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 100%;
            height: -webkit-fill-available;
        }
        .login-container h2 {
            margin-bottom: 1.5rem;
            color: #333;
        }
        .form-group label {
            font-size: 1rem;
            font-weight: 300;
            color: #181818;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 0;
            overflow: hidden;
            box-shadow: 0 0 4px #dedede;
        }
       #reporttable {
        background: #ffffff !important;
       }
        .form-control {
            border: none;
            padding: 0.5rem;
            flex: 1;
            font-weight: 400;
            letter-spacing: 1px;
            color: #272525;
            height: 18px;
            font-family: 'Poppins';
        }
        .input-group-text {
            background-color: #e0e0e0;
            padding: 0.75rem;
            font-size: 1.2rem;
            color: #555;
        }
        .rssubmit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .rssubmit:hover {
            background-color: #0056b3;
        }
        .login-container-inner {
            display: flex;
            background-image: url(images/r-bg.jpg);
            background-size: cover;
            background-position: left;
            background-repeat: no-repeat;
            height: 100%;
            /* width: 80%; */
            margin: auto;
            /* background: linear-gradient(90deg, #cecece, #a52a2a00); */
        }
        .left-section {
            width: 40%;
            /* background: brown; */
            /* background-image: url('https://img.freepik.com/free-vector/gradient-top-view-laptop-background_52683-6291.jpg?t=st=1732267011~exp=1732270611~hmac=53ba0793b7746d5f5a2efbf177f27b1cf620c690ad5b73dd48bf2878e1614f77&w=996'); */
            background-image: url('images/login-bg.jpg');
            background-size: cover;
            background-position: left;
            background-repeat: no-repeat;
        }
        .right-section {
            width: 60%;
            margin: 6rem;
        }
        .right-section-inner {
            width: 450px;
            border: 1px solid #d3cccc;
            box-shadow: 0px 2px 0px #3029a7;
            margin: auto;
        }
        .form-inner {
            padding: 1rem;
            background: #fff;
        }
        .login-head h3{
            margin: 0;
            font-weight: 300;
        }
        .login-head {
            background: #075495;
            color: #fff;
            padding: 0.5rem;
        }
        .left-section-content {
            background: #2b6596;
            display: inline-block;
            margin: 16rem 8rem;
            padding: 1rem;
            color: #fff;
        }
        .logo-section {
            text-align: center;
        }
        .logo-section img{
            width: 120px;
            padding: 1rem;
        }
        .sumt-btn {
            text-align: center;
        }
        .sumt-btn button:hover{
            background: #40de63;
            color: #ffffff;
            box-shadow: -2px -2px 2px #000000;
        } 
        .sumt-btn button{ 
            padding: 0.81rem 2rem;
            border-radius: 8px;
            background: #1bc140;
            color: #fff;
            font-weight: 600;
            border: 1px solid #919191;
            box-shadow: 2px 2px 2px #000000;
        }
/* Define keyframes for fading and background color change */
@keyframes fadeAndColorChange {
    25% {
        opacity: 0.25;
        background-color: #b81212; 
    }
    50% {
        opacity: 0.5;
        background-color: #21aa21;
    }
    75% {
        opacity: 0.75;
        background-color: #ba1995;
    }
    100% {
        opacity: 1;
        background-color: #2727a7; 
    }
}

.left-section-content {
    animation: fadeAndColorChange 5s ease-in-out infinite;
    padding: 20px;
    text-align: center;
    color: white;
    border-radius: 10px; 
}



        /* media css */
        @media only screen and (max-width:768px){
            .left-section-content {
                margin: 1rem 1.6rem;
            }
            .right-section {
                width: 100%;
                margin: 4rem 0;
                margin: 0;
            }
            .login-container-inner {
                flex-direction: column-reverse;
                justify-content: flex-end;
                padding: 1rem;
                height: 100vh;
            }
            .right-section-inner {
                width: 100%;
            }
            .left-section {
                width: 100%;
                margin-top: 1rem;
            }
           
        }
        @media only screen and (min-width:768px) and (max-width:1023px){
            .right-section-inner {
                width: 100%;
            }
            .left-section {
                width: 100%;
            }
            .left-section-content h1{
                font-size: 1.2rem;
            }
            .left-section-content {
                width: 40%;
                margin: 12rem 6rem;
            }
        }

       
        /* media css */
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-container-inner">

            <div class="right-section">
                <div class="logo-section">
                    <img src ="images/logo.png" alt ="logo" class="img-fluid"/>
                </div>
                <div class="right-section-inner">
                    <div class="login-head">
                        <h3>Login Here</h3>
                    </div>
                    <div class="form-inner">
                        <form action="dologin" method="post" autocomplete="off">
                            <div class="form-group">
                                <label for="username" class="float-start">Username</label>
                                <div class="input-group">
                                    <input id="username" name="username" type="text" class="form-control" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="float-start">Password</label>
                                <div class="input-group">
                                    <input id="password" name="password" type="password" class="form-control" required />
                                
                                </div>
                            </div>
                            <div class="sumt-btn">
                                <button type="submit">Sign In</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>

            <div class="left-section">
                <div class="left-section-content">
                    <h1>WNP E-Sign</h1>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
