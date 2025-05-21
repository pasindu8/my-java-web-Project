<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="si">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback & Ratings</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">
<%@ include file="head.jsp"%>
    <main class="container mx-auto mt-8 mb-10 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-comments"></i> Provide Feedback & Ratings</h2>
        <p class="mb-6 text-gray-700">We value your feedback! Please share your experience with us.</p>

        <!-- Feedback Form -->
        <form class="space-y-4" action="${pageContext.request.contextPath}/ratings" method="post">
            <div>
                <label for="name" class="block font-medium">Your Name</label>
                <input type="text" id="name" name="fullname" value="${firstname} ${lastname}" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter your name" readonly>
            </div>

            <div>
                <label for="tour" class="block font-medium">Tour No</label>
                <input type="text" id="tour" name="activiNo" value="${activiNo}" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter tour name" readonly>
            </div>

            <div>
                <label class="block font-medium">Your Rating</label>
                <div class="flex space-x-2 text-yellow-500 text-2xl">
                    <i id="r1" onclick="setRating(1)" class="far fa-star cursor-pointer"></i>
                    <i id="r2" onclick="setRating(2)" class="far fa-star cursor-pointer"></i>
                    <i id="r3" onclick="setRating(3)" class="far fa-star cursor-pointer"></i>
                    <i id="r4" onclick="setRating(4)" class="far fa-star cursor-pointer"></i>
                    <i id="r5" onclick="setRating(5)" class="far fa-star cursor-pointer"></i>
                </div>
            </div>
			
            <input type="text" id="rating" name="rating" hidden>

            <div>
                <label for="feedback" class="block font-medium">Your Feedback</label>
                <textarea id="feedback" rows="4" name="describeRating" class="w-full p-2 border border-gray-300 rounded" placeholder="Share your experience..."></textarea>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full">
                <i class="fas fa-paper-plane"></i> Submit Feedback
            </button>
        </form>
    </main>
<%@ include file="footer.jsp"%>
    <script>
        function setRating(rating) {
            for (let i = 1; i <= 5; i++) {
                let star = document.getElementById("r" + i);
                if (i <= rating) {
                    star.classList.add("fas");
                    star.classList.remove("far");
                } else {
                    star.classList.add("far");
                    star.classList.remove("fas");
                }
            }
            document.getElementById("rating").value = rating;
        }
    </script>

</body>
</html>
