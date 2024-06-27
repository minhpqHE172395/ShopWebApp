<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<script>
    function login() {
        window.location.href = "login.jsp";
    }
    function logout() {
        window.location.href = "logout";
    }
    function changePassword() {
        window.location.href = "changepassword.jsp";
    }
</script>
<style>
    .navbar-nav .nav-item {
        margin-right: 20px;
    }
    .navbar-nav .nav-link {
        padding: 10px 15px;
        white-space: nowrap;
    }
    .input-group {
        max-width: 300px;
    }
    .btn-icon {
        display: flex;
        align-items: center;
    }
    .btn-icon i {
        margin-right: 5px;
    }
    .navbar-brand img {
        height: 90px; /* Adjust the height as needed */
    }
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">
            <img src="https://cdn.discordapp.com/attachments/930693723510165534/1255912384300843141/file-PnwqBwZk1SqmovKoPwRj6Lng.png?ex=667edb0e&is=667d898e&hm=f598fe7dba2987dfe8df101b7ccab0eefd8a14b0963455eb4ca1c8d64c01cb58&" alt="Book Haven">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <c:if test="${sessionScope.role_admin != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="managerAccount">Manager Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="managerCategory">Manager Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="manager">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!">Hello ${sessionScope.acc.user}</a>
                    </li>
                </c:if>
            </ul>
            <form action="search" class="d-flex mx-auto">
                <div class="input-group">
                    <input placeholder="Search" value="${key}" type="search" name="keyword" class="form-control" aria-label="Search">
                    <button class="btn btn-outline-secondary" type="submit">Search</button>
                </div>
            </form>
            <div class="d-flex my-2 ms-lg-3">
                <a class="btn btn-outline-dark btn-icon me-2" href="carts">
                    <i class="bi-cart-fill"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill"><%--${sessionScope.totalQuantity}--%></span>
                </a>
                <c:choose>
                    <c:when test="${sessionScope.acc == null}">
                        <button class="btn btn-outline-primary ms-lg-2 btn-icon" onclick="login()">
                            <i class="bi-box-arrow-in-right"></i>
                            Login
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-primary ms-lg-2 btn-icon" onclick="changePassword()">
                            <i class="bi-key-fill"></i>
                            Change Password
                        </button>
                        <button class="btn btn-outline-primary ms-lg-2 btn-icon" onclick="logout()">
                            <i class="bi-box-arrow-right"></i>
                            Logout
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
