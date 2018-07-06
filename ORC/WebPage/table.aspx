<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table.aspx.cs" Inherits="WebPage_table" %>

<%@ Register Src="../UserControl/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/footer.ascx" TagName="footer" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/logout.ascx" TagName="logout" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <!-- Page level plugin CSS-->
    <link href="../css/dataTables.bootstrap4.css" rel="stylesheet">
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
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>
                <!-- Example DataTables Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i>發電數據表
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:Repeater ID="rp1" runat="server">
                                <HeaderTemplate>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>日期</th>
                                                <th>時間</th>
                                                <th>淨發電功率</th>
                                                <th>發電功率</th>
                                                <th>渦輪機進口壓力</th>
                                                <th>渦輪機出口壓力</th>
                                                <th>熱源進口溫度</th>
                                                <th>熱源出口溫度</th>
                                                <th>冷源進口溫度</th>
                                                <th>冷源出口溫度</th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("oDate") %></td>
                                        <td><%# Eval("oTime") %></td>
                                        <td><%# Eval("NET_P") %></td>
                                        <td><%# Eval("PSUM") %></td>
                                        <td><%# Eval("PT101A") %></td>
                                        <td><%# Eval("PT102") %></td>
                                        <td><%# Eval("TT101A") %></td>
                                        <td><%# Eval("TT102") %></td>
                                        <td><%# Eval("TT103") %></td>
                                        <td><%# Eval("TT106") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <tfoot>
                                        <tr>
                                            <th>日期</th>
                                            <th>時間</th>
                                            <th>淨發電功率</th>
                                            <th>發電功率</th>
                                            <th>渦輪機進口壓力</th>
                                            <th>渦輪機出口壓力</th>
                                            <th>熱源進口溫度</th>
                                            <th>熱源出口溫度</th>
                                            <th>冷源進口溫度</th>
                                            <th>冷源出口溫度</th>
                                        </tr>
                                    </tfoot>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
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
            <!-- Page level plugin JavaScript-->
            <script src="../js/jquery.dataTables.js"></script>
            <script src="../js/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="../js/sb-admin-datatables.min.js"></script>
        </div>
    </form>
</body>
</html>
