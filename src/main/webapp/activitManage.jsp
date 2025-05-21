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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - Tour Guide</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">
<%@ include file="head.jsp"%>
	
    <!-- Main Content -->
    <main class="container mx-auto mt-8 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fa-solid fa-map"></i> Activities Management</h2>
        
        <!-- User Table -->
        <div class="overflow-x-auto">
            <table class="w-full border-collapse bg-white shadow-md rounded-lg">
                <thead>
                    <tr class="bg-gray-200 text-gray-700">
                        <th class="p-3 text-left">Activitie No</th>
                        <th class="p-3 text-left">Title</th>
                        <th class="p-3 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:forEach var="acti" items="${activitie}">
				       <tr class="border-b">
                        	<td class="p-3">${acti.activiNo}</td>
                        	<form action="${pageContext.request.contextPath}/ActivitieDShow" method="post">
            				<input type="text" name="activiNo" value="${acti.activiNo}" hidden>
                        	<td class="p-3">${acti.title}</td>
                        	<td class="p-3">
                            	<button type="submit" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i> Edit</button>
                            	<a href="${pageContext.request.contextPath}/DeleteActivit?no=${acti.activiNo}" class="text-red-500 hover:text-red-700 ml-4"><i class="fas fa-trash"></i> Delete</a>
                            	</form>
                        	</td>
                   		</tr>
				      </c:forEach>
                </tbody>
            </table>
        </div>
    </main><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>
    