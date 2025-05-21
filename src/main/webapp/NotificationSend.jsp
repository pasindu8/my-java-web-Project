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
    <title>Send Notifications</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">

   <%@ include file="head.jsp"%>

    
    <main class="container mx-auto mt-8 mb-10 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-paper-plane"></i> Send Notification</h2>
        <p class="mb-6 text-gray-700">Send a new notification to all users.</p>

        
        <form action="${pageContext.request.contextPath}/NotificationSend" method="post" class="space-y-4">
            <div>
                <label for="title" class="block font-medium">Posted on Date</label>
                <input type="date" name="date" id="title" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter title" required>
            </div>

            <div>
                <label for="message" class="block font-medium">Message</label>
                <textarea id="message" name="description" class="w-full p-2 border border-gray-300 rounded" rows="4" placeholder="Enter notification message" required></textarea>
            </div>

            <div>
                <label for="type" class="block font-medium">Notification Type</label>
                <select id="type" name="type" class="w-full p-2 border border-gray-300 rounded">
                    <option value="1">Weather</option>
                    <option value="2">Discount</option>
                </select>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full">
                <i class="fas fa-bell"></i> Send Notification
            </button>
        </form>

    </main>

<%@ include file="footer.jsp"%>
</body>
</html>
