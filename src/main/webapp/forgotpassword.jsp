<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="flex items-center justify-center h-screen bg-gradient-to-b from-blue-400 to-indigo-600">
        
			
<div class="bg-white bg-opacity-20 backdrop-blur-lg rounded-lg p-8 shadow-lg w-96 text-center">
       
       <form action="${pageContext.request.contextPath}/forgotpassword" method="post">
       
       <c:if test="${not empty error}">
              	<div class="bg-[#ffe6e6] pt-1 text-[#ff0000]">
              	<span class="text-[#ff0000] pl-[260px]" onclick="this.parentElement.style.display='none';">&times;</span>
              		<p class="pb-3">${error}</p>
              	</div>
              </c:if>
              
        <div class="flex justify-center">
            <img src="https://cdn-icons-png.flaticon.com/512/3064/3064155.png" class="w-20 mb-4" alt="Lock Icon">
        </div>

        <h2 class="text-white text-xl font-semibold mb-4">Reset Your Password</h2>
        <p class="text-white text-sm mb-6">Enter your details to reset your password.</p>

      
        <div class="relative mb-4">
            <i class="fas fa-user absolute left-4 top-3 text-white"></i>
            <input type="text" name="username" placeholder="Username" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
        </div>

     
        <div class="relative mb-4">
            <i class="fas fa-lock absolute left-4 top-3 text-white"></i>
            <input type="password" name="password" id="password" placeholder="New Password" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
        </div>

       
        <div class="relative mb-4">
            <i class="fas fa-lock absolute left-4 top-3 text-white"></i>
            <input type="password" name="cpassword" id="cpassword" onchange="passwordChecking()" placeholder="Confirm Password" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
        	<p id="passwordCheck" class="text-[#F70D0D] text-sm absolute flex" style="top: 475px; right: 630px;">Passwords do not match</p>
        </div>

        
        <button id="submitButton" class="w-full py-2 mt-4 bg-yellow-400 text-black font-bold rounded-full hover:bg-yellow-500 transition" disabled>
            Reset Password
        </button>

        
        <div class="mt-4 text-white text-sm">
            Remembered? <a href="${pageContext.request.contextPath}/login" class="border border-white px-3 py-1 rounded-full hover:bg-white hover:text-indigo-600 transition">Go back to Login</a>
        </div>
    </div>
    
	 <script>
        var pval = document.getElementById("cpassword");
        var pcheck = document.getElementById("passwordCheck");
        var button = document.getElementById("submitButton");
        pcheck.style.display = "none";

        function passwordChecking() {
            var inputp = document.getElementById("cpassword").value;
            var inputpc = document.getElementById("password").value;
            var pcheck = document.getElementById("passwordCheck");
            var button = document.getElementById("submitButton");

            if (inputp === inputpc && inputp.trim() !== "") 
            {
            	button.removeAttribute("disabled");
                pcheck.style.display = "none";
            } else {
                button.setAttribute("disabled", true);
                pcheck.style.display = "flex";
            }
        }
        </script>
</body>
</html>  
  
