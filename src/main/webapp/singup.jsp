<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        response.sendRedirect("dashboard");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
    <title>Register</title>
</head>
<body class="flex items-center justify-center h-screen bg-gradient-to-r from-blue-500 to-purple-600">

    <div class="bg-white bg-opacity-20 backdrop-blur-lg rounded-lg p-8 shadow-lg w-96 text-center">
        <h1 class="text-white text-3xl font-bold mb-4">Register</h1>

       
        <c:if test="${not empty message}">
            <div class="bg-red-200 text-red-700 p-2 rounded mb-4">
                <p>${message}</p>
            </div>
        </c:if>

        
        <form action="${pageContext.request.contextPath}/singup" method="post">
            
            <div class="flex gap-2 mb-4">
                <input type="text" name="fName" placeholder="First Name" class="w-1/2 py-2 px-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
                <input type="text" name="lName" placeholder="Last Name" class="w-1/2 py-2 px-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
            </div>

            
            <div class="relative mb-4">
                <i class="fas fa-envelope absolute left-4 top-3 text-white"></i>
                <input type="email" name="email" placeholder="Email" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
            </div>

           
            <div class="relative mb-4">
                <i class="fas fa-user absolute left-4 top-3 text-white"></i>
                <input type="text" name="username" placeholder="Username" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
            </div>

           
            <div class="relative mb-4">
                <i class="fas fa-lock absolute left-4 top-3 text-white"></i>
                <input type="password" id="password" name="password" placeholder="Password" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
                <button type="button" onclick="togglePassword('password', 'eyeIcon1')" class="absolute right-4 top-3 text-white">
                    <i id="eyeIcon1" class="fas fa-eye"></i>
                </button>
            </div>

            
            <div class="relative mb-4">
                <i class="fas fa-lock absolute left-4 top-3 text-white"></i>
                <input type="password" id="cpassword" name="cpassword" placeholder="Confirm Password" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white" required>
                <button type="button" onclick="togglePassword('cpassword', 'eyeIcon2')" class="absolute right-4 top-3 text-white">
                    <i id="eyeIcon2" class="fas fa-eye"></i>
                </button>
            </div>

            
            <p id="passwordCheck" class="text-red-400 text-sm hidden">Passwords do not match</p>

           
            <p class="text-white text-sm mb-4">
                <input id="termsCheckbox" type="checkbox" onclick="enableRegisterButton()"> 
                I accept the <a href="#" class="underline">Terms of Use & Privacy Policy</a>.
            </p>

           
            <button type="submit" id="registerBtn" class="w-full py-2 bg-cyan-500 text-white rounded-full shadow-lg shadow-cyan-500/50 transition duration-300 disabled:opacity-50" disabled>
                Register Now
            </button>

            
            <p class="text-white text-sm mt-4">
                Already a member? <a href="${pageContext.request.contextPath}/login" class="underline">Login here</a>
            </p>
        </form>
    </div>

    
    <script>
        function togglePassword(fieldId, iconId) {
            var passwordField = document.getElementById(fieldId);
            var eyeIcon = document.getElementById(iconId);

            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }

        function enableRegisterButton() {
            var checkbox = document.getElementById("termsCheckbox");
            var registerBtn = document.getElementById("registerBtn");
            registerBtn.disabled = !checkbox.checked;
        }
    </script>
</body>
</html>