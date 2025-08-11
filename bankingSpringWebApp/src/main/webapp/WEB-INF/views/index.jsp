<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Accounts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Bank Accounts</h2>
        <a href="${pageContext.request.contextPath}/addAccount" class="btn btn-primary">
            <i class="bi bi-plus-circle"></i> Add New Account
        </a>
    </div>

    <!-- Search Form -->
    <form class="row g-2 mb-4" action="${pageContext.request.contextPath}/search" method="get">
        <div class="col-md-4">
            <input type="text" name="keyword" class="form-control" placeholder="Search by type/name/contact">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-outline-secondary">Search</button>
        </div>
        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-dark">Clear</a>
        </div>
    </form>

    <!-- Accounts Table -->
    <c:choose>
        <c:when test="${not empty accountsList}">
            <div class="table-responsive">
                <table class="table table-striped table-bordered align-middle">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Holder Name</th>
                        <th>Contact</th>
                        <th>Balance</th>
                        <th>Setup Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${accountsList}">
                        <tr>
                            <td>${a.accountId}</td>
                            <td>${a.accountType}</td>
                            <td>${a.accountHolderName}</td>
                            <td>${a.accountHolderContact}</td>
                            <td>$${a.accountBalance}</td>
                            <td>${a.accountSetupDate}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/editAccount/${a.accountId}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteAccount/${a.accountId}" 
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Delete account #${a.accountId}?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">No accounts found.</div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
