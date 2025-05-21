<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String action = (String) session.getAttribute("action");
    if (action == "Admin") {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
		<title></title>
	</head>
	<body style="background-image: linear-gradient(to right, #0026ff, rgb(255, 8, 239));">
	<%@ include file="head.jsp"%>
        <center>
              
        <div class="bg-[#E7DDFF] w-[400px] h-auto p-10 mt-[100px] mb-[60px]">
            <h1 class="font-mono text-3xl italic font-bold">Add activities</h1><br>
            
            <form action="${pageContext.request.contextPath}/AddActivitie" method="post">
            <input type="text" name="activitieNo" placeholder="Activitie No" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="title" placeholder="Title" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="duration" placeholder="Duration Hours" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="languages" placeholder="Languages" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="image" placeholder="Image Name" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="price" placeholder="Price" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="time" name="time" placeholder="Time" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            <input type="text" name="destination" placeholder="Destination" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
            
            <label class="pr-[220px]">Description</label><br>
            <textarea name="description" class="mb-5 p-3 w-[300px] h-[105px] inset-shadow-sm border-2 border-solid outline-blue-500" required></textarea><br>
            
            <button type="submit" id="submitButton" class="mt-7 w-[300px] h-[40px] bg-cyan-500 shadow-lg shadow-cyan-500/50 text-white ">Register</button><br><br>
            
        </form>
        </div>
    </center>
      <%@ include file="footer.jsp"%>  
    </body>
</html>