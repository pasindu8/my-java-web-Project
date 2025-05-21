<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
    
<%@ include file="head.jsp"%>

    <div class="flex space-x-6 m-10">
        <h3 class="font-bold text-4xl">All activities</h3>
        <button class="border-2 border-solid rounded-xl p-3 absolute right-10" onclick="Filters()"><i class="fa-solid fa-filter"></i>Filters</button>
    </div>
    <br><br><br>

    <div id="Filter" class="flex">
        <div class="bg-white shadow-lg rounded-lg p-6 w-196 h-80 overflow-y-scroll">
            <h2 class="text-lg font-semibold">Filters</h2>

            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Destinations</h3>
                <div class="mt-2 space-y-2">
                    <select name="destination" class="destination-filter border border-gray-300 rounded-md px-3 py-2 w-full focus:ring-2 focus:ring-blue-500">
                        <option value="">Select a destination</option>
                        <option value="Colombo">Colombo</option>
                        <option value="Kandy">Kandy</option>
                        <option value="Ella">Ella</option>
                        <option value="Hambantota">Hambantota</option>
                        <option value="Sigiriya">Sigiriya</option>
                        <option value="Dambulla">Dambulla</option>
                        <option value="Mirissa">Mirissa</option>
                        <option value="Galle">Galle</option>
                        <option value="Anuradhapura">Anuradhapura</option>
                        <option value="Nuwara Eliya">Nuwara Eliya</option>
                    </select>
                </div>
            </div>

            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Price Range</h3>
                <div class="flex justify-between mt-2">
                    <input type="number" name="min" id="min-price" class="border border-gray-300 rounded-md px-3 py-2 w-32 focus:ring-2 focus:ring-blue-500" placeholder="$ Min">
                    <input type="number" name="max" id="max-price" class="border border-gray-300 rounded-md px-3 py-2 w-32 focus:ring-2 focus:ring-blue-500" placeholder="$ Max">
                </div>
            </div>

            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Duration (Hours)</h3>
                <div class="mt-2 space-y-2">
                <input type="number" name="duration" class="duration-filter border border-gray-300 rounded-md px-3 py-2 w-full focus:ring-2 focus:ring-blue-500" placeholder="e.g., 4">
                </div>
            </div>

            <div class="mt-4">
                <h3 class="text-sm font-semibold text-gray-700">Minimum Star rating</h3>
                <div class="mt-2 space-y-2">
                    <select class="rating-filter border border-gray-300 rounded-md px-3 py-2 w-full focus:ring-2 focus:ring-blue-500">
                        <option value="">Select minimum rating</option>
                        <option value="3.0">3.0+</option>
                        <option value="3.5">3.5+</option>
                        <option value="4.0">4.0+</option>
                        <option value="4.5">4.5+</option>
                    </select>
                </div>
            </div>

            <div class="flex justify-between mt-6">
                <button id="reset-btn" class="text-blue-600 text-sm">Reset all</button>
                <button id="show-results" onclick="showResults()" class="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm">Show results</button>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 justify-items-center">
        <c:set var="limit" value="8" />
        <c:forEach var="activitie" items="${activitie}" begin="0" end="${limit - 1}">
            <c:set var="found" value="false" />
            <c:set var="ratingTotal" value="0" />
            <c:set var="ratingCount" value="0" />

            <c:forEach var="rating" items="${rating}">
                <c:if test="${activitie.activiNo == rating.activiNo}">
                    <c:set var="ratingTotal" value="${ratingTotal + rating.rating}" />
                    <c:set var="ratingCount" value="${ratingCount + 1}" />
                    <c:set var="found" value="true" />
                </c:if>
            </c:forEach>

            <c:set var="averageRating" value="0" />
            <c:if test="${ratingCount > 0}">
                <c:set var="averageRating" value="${ratingTotal / ratingCount}" />
            </c:if>

            <div class="m-5 rounded-xl border-2 border-solid overflow-hidden bg-[#e6ffff] activity-card"
                 data-destination="${activitie.destination}"
                 data-price="${activitie.price}"
                 data-duration="${activitie.duration}"
                 data-rating="${averageRating}"
                 style="width: 250px; height: 500px;">
                <a href="${pageContext.request.contextPath}/bookinga?booking=${activitie.activiNo}">
                    <img src="assets/A/1${activitie.image}" class="rounded-t-lg transition-transform duration-500 hover:scale-110" style="width: 251px; height: 251px;">
                    <div class="p-4">
                        <h4 class="font-bold text-lg">${activitie.title}</h4><br>
                        <p class="font-bold text-sm">${activitie.duration} <sub>.</sub> Pickup available</p><br>
                        <p class="font-bold text-base">
                            <c:set var="currentActivityRating" value="${averageRating}" />
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${currentActivityRating >= i}">
                                        <i class="fa-solid fa-star"></i>
                                    </c:when>
                                    <c:when test="${currentActivityRating > (i - 1) && currentActivityRating < i}">
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-regular fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${found}">${fn:substring(averageRating, 0, 3)}</c:if> <c:if test="${found}">(${ratingCount})</c:if>
                        </p><br>
                        <h3 class="font-bold text-base" style="color: red">From $${activitie.price}</h3>
                    </div>
                </a>
            </div>
            <c:set var="ratingCount" value="0" />
            <c:set var="ratingTotal" value="0" />
        </c:forEach>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 justify-items-center" id="nextContainer">
        <c:set var="limit" value="${fn:length(activitie)}" />
        <c:forEach var="activitie" items="${activitie}" begin="8" end="${limit - 1}">
            <c:set var="found" value="false" />
            <c:set var="ratingTotal" value="0" />
            <c:set var="ratingCount" value="0" />

            <c:forEach var="rating" items="${rating}">
                <c:if test="${activitie.activiNo == rating.activiNo}">
                    <c:set var="ratingTotal" value="${ratingTotal + rating.rating}" />
                    <c:set var="ratingCount" value="${ratingCount + 1}" />
                    <c:set var="found" value="true" />
                </c:if>
            </c:forEach>

            <c:set var="averageRating" value="0" />
            <c:if test="${ratingCount > 0}">
                <c:set var="averageRating" value="${ratingTotal / ratingCount}" />
            </c:if>

            <div class="m-5 rounded-xl border-2 border-solid overflow-hidden bg-[#e6ffff] activity-card"
                 data-destination="${activitie.destination}"
                 data-price="${activitie.price}"
                 data-duration="${activitie.duration}"
                 data-rating="${averageRating}"
                 style="width: 250px; height: 500px;">
                <a href="${pageContext.request.contextPath}/bookinga?booking=${activitie.activiNo}">
                    <img src="assets/A/1${activitie.image}" class="rounded-t-lg transition-transform duration-500 hover:scale-110" style="width: 251px; height: 251px;">
                    <div class="p-4">
                        <h4 class="font-bold text-lg">${activitie.title}</h4><br>
                        <p class="font-bold text-sm">${activitie.duration} <sup>.</sup> Pickup available</p><br>
                        <p class="font-bold text-base">
                            <c:set var="currentActivityRating" value="${averageRating}" />
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${currentActivityRating >= i}">
                                        <i class="fa-solid fa-star"></i>
                                    </c:when>
                                    <c:when test="${currentActivityRating > (i - 1) && currentActivityRating < i}">
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-regular fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${found}">${fn:substring(averageRating, 0, 3)}</c:if> <c:if test="${found}">(${ratingCount})</c:if>
                        </p><br>
                        <h3 class="font-bold text-base" style="color: red">From $${activitie.price}</h3>
                    </div>
                </a>
            </div>
            <c:set var="ratingCount" value="0" />
            <c:set var="ratingTotal" value="0" />
        </c:forEach>
    </div>

    <center><button class="rounded-xl border-4 border-sky-500 p-2 my-10" onclick="activShow()" id="myBtnActiv">Show More</button></center>
    <br><br>

    <h1 class="font-bold text-4xl m-10">Our most recommended things to do in Sri Lanka</h1>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 m-10">
        <c:set var="limit" value="10" />
        <c:forEach var="activitie" items="${activitie}" begin="0" end="${limit - 1}">
            <div class="grid grid-cols-2 gap-4 bg-gray-100 p-4 rounded-lg shadow-md">
                <a href="${pageContext.request.contextPath}/bookinga?booking=${activitie.activiNo}">
                    <img src="assets/A/1${activitie.image}" class="rounded-lg transition-transform duration-500 hover:scale-110 w-full h-auto object-cover" style="max-width: 250px; max-height: 170px;">
                </a>
                <div class="flex flex-col justify-center">
                    <a href="${pageContext.request.contextPath}/bookinga?booking=${activitie.activiNo}">
                        <p class="font-bold text-2xl">${activitie.title}</p>
                    </a>
                    <p class="activity-description" id="descript_${activitie.activiNo}">
                        <c:choose>
                            <c:when test="${fn:length(activitie.description) > 100}">
                                ${fn:substring(activitie.description, 0, 100)}...
                            </c:when>
                            <c:otherwise>
                                ${activitie.description}
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>

    <br>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-1 bg-cyan-500 rounded-xl border-2 border-solid m-10 p-5">
        <img src="assets/13.png" class="rounded-lg w-full h-auto object-cover" style="max-width: 600px; max-height: 290px;">
        <div class="grid grid-rows-3 gap-1 content-center">
            <p class="font-bold text-3xl m-2">Discover the wonder of travel every week</p>
            <p class="text-xl m-2">Get personalized travel inspiration, the latest travel hacks, and exclusive deals straight to your inbox.</p>
            <center><a href="${pageContext.request.contextPath}/singup" class="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm w-fit">Sign up</a></center>
        </div>
    </div>
    <br>

    <h1 class="font-bold text-4xl m-10">What people are saying about Sri Lanka</h1>

    <c:set var="overallRatingTotal" value="0" />
    <c:set var="overallRatingCount" value="0" />
    <c:set var="overallFound" value="false" />

    <c:forEach var="rating" items="${rating}">
        <c:set var="overallRatingTotal" value="${overallRatingTotal + rating.rating}" />
        <c:set var="overallRatingCount" value="${overallRatingCount + 1}" />
        <c:set var="overallFound" value="true" />
    </c:forEach>

    <c:set var="overallAverageRating" value="0" />
    <c:if test="${overallRatingCount > 0}">
        <c:set var="overallAverageRating" value="${overallRatingTotal / overallRatingCount}" />
    </c:if>

    <p class="font-bold text-2xl m-10">Overall rating</p>
    <p class="text-1xl m-10">
        <c:set var="displayOverallRating" value="${overallAverageRating}" />
        <c:forEach var="i" begin="1" end="5">
            <c:choose>
                <c:when test="${displayOverallRating >= i}">
                    <i class="fa-solid fa-star text-[#FFEF0F] text-2xl"></i>
                </c:when>
                <c:when test="${displayOverallRating > (i - 1) && displayOverallRating < i}">
                    <i class="fa-solid fa-star-half-stroke text-[#FFEF0F] text-2xl"></i>
                </c:when>
                <c:otherwise>
                    <i class="fa-regular fa-star text-[#FFEF0F] text-2xl"></i>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${overallFound}">(${fn:substring(overallAverageRating, 0, 3)})</c:if> (<c:if test="${overallFound}">${overallRatingCount}</c:if> reviews)
    </p>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 m-10">
        <c:set var="limit" value="6" />
        <c:forEach var="rating" items="${rating}" begin="0" end="${limit - 1}">
            <c:set var="matchedTitle" value="N/A"/>
            <c:forEach var="activitie" items="${activitie}">
                <c:if test="${rating.activiNo eq activitie.activiNo}">
                    <c:set var="matchedTitle" value="${activitie.title}"/>
                </c:if>
            </c:forEach>

            <div class="bg-white p-4 rounded-lg shadow">
                <div class="flex items-center space-x-1 text-yellow-500">
                    <c:forEach var="i" begin="1" end="5">
                        <c:choose>
                            <c:when test="${i le rating.rating}">
                                <span>⭐</span>
                            </c:when>
                            <c:otherwise>
                                <span>☆</span>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <p class="text-gray-800 mt-2">
                   ${rating.describeRating}
                </p>
                <a href="${pageContext.request.contextPath}/bookinga?booking=${rating.activiNo}" class="text-blue-600 font-medium mt-2 inline-block">${matchedTitle}</a>
                <p class="text-gray-500 text-sm">Reviewed by <span class="font-semibold">${rating.fullname}</span>, ${rating.date}</p>
            </div>
        </c:forEach>
    </div>

<%@ include file="footer.jsp"%>

<script>
    document.addEventListener("DOMContentLoaded", function() {

        // Filter section visibility toggle
        var filterDiv = document.getElementById("Filter");
        filterDiv.style.display = "none"; // Ensure it's initially hidden

        window.Filters = function() { 
            if (filterDiv.style.display === "none") {
                filterDiv.style.display = "block";
            } else {
                filterDiv.style.display = "none";
            }
        };

        // Reset button functionality
        document.getElementById('reset-btn').addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default button behavior
            document.querySelector('.destination-filter').value = "";
            document.querySelector('.duration-filter').value = "";
            document.querySelector('.rating-filter').value = "";
            document.getElementById('min-price').value = "";
            document.getElementById('max-price').value = "";
            applyFilters(); 
        });

       
        var activnext = document.getElementById("nextContainer");
        var btnText = document.getElementById("myBtnActiv");
        activnext.style.display = "none";

        window.activShow = function() {
            if (activnext.style.display === "none") {
                activnext.style.display = "grid";
                btnText.innerHTML = "Show Less";
            } else {
                activnext.style.display = "none";
                btnText.innerHTML = "Show More";
            }
        };

        
        document.querySelectorAll('.activity-description').forEach(function(element) {
            let fullText = element.innerText;
            if (fullText.length > 100) {
                element.innerText = fullText.substring(0, 100) + "...";
            }
        });

       
        window.showResults = function() { 
            applyFilters();
            Filters(); 
        };

        function applyFilters() {
            const selectedDestination = document.querySelector('.destination-filter').value;
            const minPrice = parseFloat(document.getElementById('min-price').value) || 0;
            const maxPrice = parseFloat(document.getElementById('max-price').value) || Infinity;
            const selectedDuration = parseInt(document.querySelector('.duration-filter').value) || 0;
            const minRating = parseFloat(document.querySelector('.rating-filter').value) || 0;

            const activityCards = document.querySelectorAll('.activity-card');

            activityCards.forEach(card => {
                const cardDestination = card.dataset.destination;
                const cardPrice = parseFloat(card.dataset.price);
                const cardDuration = parseInt(card.dataset.duration);
                const cardRating = parseFloat(card.dataset.rating);

                let isVisible = true;

                
                if (selectedDestination && cardDestination !== selectedDestination) {
                    isVisible = false;
                }

                
                if (cardPrice < minPrice || cardPrice > maxPrice) {
                    isVisible = false;
                }

                
                if (selectedDuration > 0 && cardDuration < selectedDuration) {
                    isVisible = false;
                }

                
                if (minRating > 0 && cardRating < minRating) {
                    isVisible = false;
                }

                card.style.display = isVisible ? 'block' : 'none';
            });
           
            activnext.style.display = "none";
            btnText.innerHTML = "Show More";
        }

        
        applyFilters();
    });
</script>
</body>