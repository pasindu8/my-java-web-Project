<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rating Management - Tour Guide</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">

    <%@ include file="head.jsp"%>

    
    <main class="container mx-auto mt-8 mb-10 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-star"></i> Rating Management</h2>
        <p class="mb-6 text-gray-700">Manage customer reviews and ratings.</p>

       
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-300 rounded-lg">
                <thead>
                    <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">Tour ID</th>
                        <th class="py-3 px-6 text-left">Rating</th>
                        <th class="py-3 px-6 text-left">Review</th>
                        <th class="py-3 px-6 text-left">Date</th>
                        <th class="py-3 px-6 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700 text-sm">
                    
                    <c:forEach var="rating" items="${ratings}">
                        <tr class="border-b border-gray-300 hover:bg-gray-100">
                            <td class="py-3 px-6">${rating.activiNo}</td>
                            <td class="py-3 px-6">
                                <span class="text-yellow-500">
                                    <c:forEach begin="1" end="${rating.rating}">★</c:forEach>
                                    <c:forEach begin="${rating.rating + 1}" end="5">☆</c:forEach>
                                </span>
                            </td>
                            <td class="py-3 px-6 w-[250px]">${rating.describeRating}</td>
                            <td class="py-3 px-6">${rating.date}</td>
                            <td class="py-3 px-6 text-center">
                                <a href="${pageContext.request.contextPath}/EditRating?id=${rating.id}" class="text-red-500 hover:text-red-700">
                                    <i class="fas fa-edit"></i> Edit
                                </a><br>
                                <a href="${pageContext.request.contextPath}/DeleteRating?id=${rating.id}" class="text-red-500 hover:text-red-700">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
<%@ include file="footer.jsp"%>
</body>
</html>
