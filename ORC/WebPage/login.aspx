<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="WebPage_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ORC管理系統</title>
    <!-- Bootstrap core CSS-->
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom fonts for this template-->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet"/>
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>
                <div class="card-body">
                    
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <asp:TextBox ID="tbx_account" runat="server" class="form-control" type="email" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <asp:TextBox ID="tbx_password" runat="server" class="form-control" type="password" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox">
                                    Remember Password</label>
                            </div>
                        </div>
                        <a class="btn btn-primary btn-block" href="index.aspx">Login</a>
                    
                    <div class="text-center">
                        <a class="d-block small mt-3" href="register.html">Register an Account</a>
                        <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../js/jquery.easing.min.js"></script>
    </form>
</body>
</html>
