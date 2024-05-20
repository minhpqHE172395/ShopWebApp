<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Change Password</div>
                        <div class="card-body">
                            <form action="ChangePassword" method="post">
                                <div class="form-group">
                                    <label for="username">Welcome <%= ((model.Account)session.getAttribute("acc")).getUser() %></label>
                                </div>
                                <div class="form-group">
                                    <label for="oldPassword">Old Password</label>
                                    <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">New Password</label>
                                    <input type="password" class="form-control" id="password" name="newPassword" required>
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">Confirm Password</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                </div>
                                <div id="error-message" class="text-danger"></div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <%-- Bootstrap JS --%>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        <%-- Custom JavaScript --%>
                        <script>
                            // Function to validate if the passwords match
                            function validatePasswords() {
                                var password = document.getElementById("password").value;
                                var confirmPassword = document.getElementById("confirmPassword").value;
                                if (password !== confirmPassword) {
                                    document.getElementById("error-message").innerHTML = "Passwords do not match!";
                                    return false;
                                }
                                return true;
                            }

                            // Event listener for form submission
                            document.getElementById("change-password-form").addEventListener("submit", function (event) {
                                if (!validatePasswords()) {
                                    event.preventDefault(); // Prevent form submission if passwords do not match
                                }
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <%-- Button to go back to home page --%>
        <div class="container mt-3">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <a href="home" class="btn btn-outline-primary">Back to Home</a>
                </div>
            </div>
        </div>
    </body>
</html>
