<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="flex items-center justify-center h-screen bg-gradient-to-b from-blue-400 to-indigo-600">
     <% String success = request.getParameter("success"); %>
    <% if (success != null) { %>
        <script>
            alert("<%= success %>");
        </script>
    <% } %>   
  <div class="bg-white bg-opacity-20 backdrop-blur-lg rounded-lg p-8 shadow-lg w-96 text-center">
       <form action="${pageContext.request.contextPath}/login" method="post">
        	<c:if test="${not empty message}">
              	<div class="bg-[#ffe6e6] pt-1 text-[#ff0000]">
              	<span class="text-[#ff0000] pl-[260px]" onclick="this.parentElement.style.display='none';">&times;</span>
              		<p class="pb-3">${message}</p>
              	</div>
             </c:if>
        <div class="flex justify-center">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="w-20 mb-4" alt="User Icon">
        </div>

       
        <div class="relative mb-4">
            <i class="fas fa-user absolute left-4 top-3 text-white"></i>
            <input type="text" name="username" placeholder="Username" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white">
        </div>

       
        <div class="relative mb-4">
            <i class="fas fa-lock absolute left-4 top-3 text-white"></i>
            <input type="password" name="password" placeholder="Password" class="w-full py-2 pl-10 pr-4 border border-white bg-transparent text-white placeholder-white rounded-full focus:outline-none focus:ring-2 focus:ring-white">
        </div>

       
        <button type="submit" class="w-full py-2 mt-4 bg-yellow-400 text-black font-bold rounded-full hover:bg-yellow-500 transition">
            Login Now
        </button>

       
        <div class="flex justify-between text-white text-sm mt-3">
            <label><input type="checkbox" class="mr-2">Remember me</label>
            <a href="${pageContext.request.contextPath}/forgotpassword.jsp" class="hover:underline">Forgot password?</a>
        </div>

     
        <div class="mt-4 text-white text-sm">
            Not a member?<br><br> 
            <a href="${pageContext.request.contextPath}/singup" class="border border-white px-3 py-1 rounded-full hover:bg-white hover:text-indigo-600 transition">Create account</a>
        </div>
    </div>

</body>
</html>