<%-- 
    Document   : loginpage
    Created on : Nov 26, 2020, 9:46:21 PM
    Author     : mayan
--%>

<%@page import="com.events.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
         
      @import url('https://fonts.googleapis.com/css?family=Mukta');
      body{
        font-family: 'Mukta', sans-serif;
        height:100vh;
        min-height:550px;
        background-image: url(http://www.planwallpaper.com/static/images/Free-Wallpaper-Nature-Scenes.jpg);
        background-repeat: no-repeat;
        background-size:cover;
        background-position:center;
        position:relative;
          overflow-y: hidden;
      }
      a{
        text-decoration:none;
        color:#444444;
      }
      .login-reg-panel{
          position: relative;
          top: 50%;
          transform: translateY(-50%);
        text-align:center;
          width:70%;
        right:0;left:0;
          margin:auto;
          height:400px;
          background-color: rgb(19, 38, 57);
      }
      .white-panel{
          background-color: rgba(255,255, 255, 1);
          height:500px;
          position:absolute;
          top:-50px;
          width:50%;
          right:calc(50% - 50px);
          transition:.3s ease-in-out;
          z-index:0;
          box-shadow: 0 0 15px 9px #00000096;
      }
      .login-reg-panel input[type="radio"]{
          position:relative;
          display:none;
      }
      .login-reg-panel{
          color:rgb(179, 205, 229);
      }
      .login-reg-panel #label-login, 
      .login-reg-panel #label-register{
          border:1px solid #9E9E9E;
          padding:5px 5px;
          width:150px;
          display:block;
          text-align:center;
          border-radius:10px;
          cursor:pointer;
          font-weight: 600;
          font-size: 18px;
      }
      .login-info-box{
          width:30%;
          padding:0 50px;
          top:20%;
          left:0;
          position:absolute;
          text-align:left;
      }
      .register-info-box{
          width:30%;
          padding:0 50px;
          top:20%;
          right:0;
          position:absolute;
          text-align:left;
          
      }
      .right-log{right:50px !important;}

      .login-show, 
      .register-show{
          z-index: 1;
          display:none;
          opacity:0;
          transition:0.3s ease-in-out;
          color:#242424;
          text-align:left;
          padding:50px;
      }
      .show-log-panel{
          display:block;
          opacity:0.9;
      }
      .login-show input[type="email"], .login-show input[type="password"]{
          width: 100%;
          display: block;
          margin:20px 0;
          padding: 15px;
          border: 1px solid #b5b5b5;
          outline: none;
      }
      .login-show input[type="submit"] {
          max-width: 150px;
          width: 100%;
          background: #444444;
          color: #f9f9f9;
          border: none;
          padding: 10px;
          text-transform: uppercase;
          border-radius: 2px;
          float:right;
          cursor:pointer;
      }
      .login-show a{
          display:inline-block;
          padding:10px 0;
      }

      .register-show input[type="email"], .register-show input[type="password"],.register-show input[type="text"]{
          width: 100%;
          display: block;
          margin:20px 0;
          padding: 15px;
          border: 1px solid #b5b5b5;
          outline: none;
      }
      .register-show input[type="submit"] {
          max-width: 150px;
          width: 100%;
          background: #444444;
          color: #f9f9f9;
          border: none;
          padding: 10px;
          text-transform: uppercase;
          border-radius: 2px;
          float:right;
          cursor:pointer;
      }
      .credit {
          position:absolute;
          bottom:10px;
          left:10px;
          color: #3B3B25;
          margin: 0;
          padding: 0;
          font-family: Arial,sans-serif;
          text-transform: uppercase;
          font-size: 12px;
          font-weight: bold;
          letter-spacing: 1px;
          z-index: 99;
      }
      a{
        text-decoration:none;
        color:rgb(255, 77, 77);
      }
    
    
    </style>
  </head>
  <body>
          <div class="login-reg-panel">
      <div class="login-info-box">
        <h2>Have an account?</h2>
        <!-- <p>Lorem ipsum dolor sit amet</p> -->
        <label id="label-register" for="log-reg-show">Login</label>
        <input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
      </div>
                
      <div class="register-info-box">
        <h2>Don't have an account?</h2>
        <!-- <p>Lorem ipsum dolor sit amet</p> -->
        <label id="label-login" for="log-login-show">Register</label>
        <input type="radio" name="active-log-panel" id="log-login-show">
      </div>
                
      <div class="white-panel">
        <div class="login-show">
          <h2>LOGIN</h2>
          <input type="email" placeholder="Email" name="">
          <input type="password" placeholder="Password">
          <input type="submit" value="Login">
          <a href="">Forgot password?</a>
        </div>
          <form action="RegisterServlet" method="POST" id="reg-form">
              <div class="register-show">
          <h2>REGISTER</h2>
          <input type="text" placeholder="FullName" name="user_name">
          <input type="email" placeholder="Email" name="user_email">
          <input type="password" placeholder="Password" name="user_password">
          <center><div class="spinner-border text-info" role="status" id="loader" style="display:none">
  <span class="sr-only">Loading</span>
              </div></center>
          <br>
          <input type="submit" value="Register" id="sub-btn">
        </div>
          </form>
        
      </div>
    </div>
          <%
        Connection con=ConnectionProvider.getConnection();
        
        %>
    <script>

    $(document).ready(function(){
    $('.login-info-box').fadeOut();
    $('.login-show').addClass('show-log-panel');
});


$('.login-reg-panel input[type="radio"]').on('change', function() {
    if($('#log-login-show').is(':checked')) {
        $('.register-info-box').fadeOut(); 
        $('.login-info-box').fadeIn();
        
        $('.white-panel').addClass('right-log');
        $('.register-show').addClass('show-log-panel');
        $('.login-show').removeClass('show-log-panel');
        
    }
    else if($('#log-reg-show').is(':checked')) {
        $('.register-info-box').fadeIn();
        $('.login-info-box').fadeOut();
        
        $('.white-panel').removeClass('right-log');
        
        $('.login-show').addClass('show-log-panel');
        $('.register-show').removeClass('show-log-panel');
    }
});
  </script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
//      sending data to servlet
$(document).ready(function (){
    console.log("loaded....")
    
    $('#reg-form').on('submit',function (event){
        event.preventDefault();
        
        
        let form=new FormData(this);
        $("#sub-btn").hide();
        $("#loader").show();
        
        //send register servlet
        $.ajax({
            url:"RegisterServlet",
            type:'POST',
            data:form,
            success:function(data,textstatus,jqXHR){
                console.log(data)
                $("#sub-btn").show();
        $("#loader").hide();
        swal("Good job!", "Successfully Registered!", "success");
        
            },
            error: function(jqXHR,textStatus,errorThrown){
                console.log(jqXHR)
                $("#sub-btn").show();
        $("#loader").hide();
            },
            processData:false,
            contentType:false
        });
    });
    
});

  </script>
  </body>
</html>
