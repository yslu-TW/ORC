<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="WebPage_index" %>

<%@ Register Src="../UserControl/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/footer.ascx" TagName="footer" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/logout.ascx" TagName="logout" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ORC管理系統</title>
    <!-- Bootstrap core CSS-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <form id="form1" runat="server">
        <!-- Navigation-->
        <uc1:header ID="header" runat="server" />
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.html">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Blank Page</li>
                </ol>
                <asp:ListView ID="PanelList" runat="server">
                    <ItemTemplate>
                        <div class="col-md-2">
                            <div class="panel panel-default">
                                <div class="panel-heading"><strong><%#Eval("PRODUCTID") %></strong>, <%#Eval("PRODUCTNAMEE") %></div>
                                <div class="panel-body">
                                    <a class="thumbnail">
                                        <img src='<%#Eval("PHOTO") %>' /></a>
                                </div>

                                <div class="panel-footer">
                                    <%#Eval("PRODUCTPRICE") %>
                                </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <uc2:footer ID="footer1" runat="server" />
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <uc3:logout ID="logout" runat="server" />
            <!-- Bootstrap core JavaScript-->
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="../js/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/sb-admin.min.js"></script>
        </div>
    </form>
</body>
</html>
