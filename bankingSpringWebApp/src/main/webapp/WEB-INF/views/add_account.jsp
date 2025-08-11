<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="fw-bold mb-4">Add New Account</h2>

    <form action="${pageContext.request.contextPath}/saveAccount" method="post" class="row g-3">
        <div class="col-md-6">
            <label class="form-label">Account Type</label>
            <input type="text" name="accountType" class="form-control" placeholder="Savings / Current" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Holder Name</label>
            <input type="text" name="accountHolderName" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Contact</label>
            <input type="text" name="accountHolderContact" class="form-control" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Balance</label>
            <input type="number" step="0.01" name="accountBalance" class="form-control" required>
        </div>

        <div class="col-md-3">
            <label class="form-label">Setup Date</label>
            <input type="date" name="accountSetupDate" class="form-control">
        </div>

        <div class="col-12 mt-3">
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
