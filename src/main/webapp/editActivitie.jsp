<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String action = (String) session.getAttribute("action");
    if (action == "Admin") {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Activities</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body style="background-image: linear-gradient(to right, #0026ff, rgb(255, 8, 239));">
    <center>
        <div class="bg-[#E7DDFF] w-[400px] h-auto p-10 mt-[100px] mb-[60px]">
            <h1 class="font-mono text-3xl italic font-bold">Edit Activities</h1><br>
            <c:if test="${not empty magss}">
              	<script>
					alert("${magss}");
				</script>
              </c:if>
            <!-- Check if the 'activitie' object is present -->
            <c:if test="${not empty activitie}">
                <form action="${pageContext.request.contextPath}/EditActivitie" method="post">
                    <!-- Use the activitie object attributes directly -->
                    <input type="text" value="${activitie.activiNo}" name="activiNo" placeholder="Activitie No" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.title}" name="title" placeholder="Title" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.duration}" name="duration" placeholder="Duration Hours" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.language}" name="language" placeholder="Languages" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.image}" name="image" placeholder="Image Name" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.price}" name="price" placeholder="Price" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>
                    <input type="text" value="${activitie.destination}" name="destination" placeholder="Destination" class="mb-5 p-3 w-[300px] h-[35px] inset-shadow-sm border-2 border-solid outline-blue-500" required><br>

                    <label class="pr-[220px]">Description</label><br>
                    <textarea name="description" class="mb-5 p-3 w-[300px] h-[105px] inset-shadow-sm border-2 border-solid outline-blue-500" required>${activitie.description}</textarea><br>
                    
                    <button type="submit" class="mt-7 w-[300px] h-[40px] bg-cyan-500 shadow-lg shadow-cyan-500/50 text-white ">Edit</button><br><br>
                </form>
            </c:if>
        </div>
    </center>
</body>
</html>
