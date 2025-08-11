<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="fw-bold mb-4">Edit Account</h2>

    <form action="${pageContext.request.contextPath}/updateAccount" method="post" class="row g-3">
        <div class="col-md-2">
            <label class="form-label">ID</label>
            <input type="number" name="accountId" class="form-control" value="${account.accountId}" readonly>
        </div>

        <div class="col-md-4">
            <label class="form-label">Account Type</label>
            <input type="text" name="accountType" class="form-control" value="${account.accountType}" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Holder Name</label>
            <input type="text" name="accountHolderName" class="form-control" value="${account.accountHolderName}" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Contact</label>
            <input type="text" name="accountHolderContact" class="form-control" value="${account.accountHolderContact}" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Balance</label>
            <input type="number" step="0.01" name="accountBalance" class="form-control" value="${account.accountBalance}" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Setup Date</label>
            <input type="date" name="accountSetupDate" class="form-control" value="${account.accountSetupDate}">
        </div>

        <div class="col-12 mt-3">
            <button type="submit" class="btn btn-success">Update</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
