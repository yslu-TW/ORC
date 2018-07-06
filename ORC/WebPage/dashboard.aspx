<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="WebPage_dashboard" %>

<%@ Register Src="../UserControl/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/footer.ascx" TagName="footer" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/logout.ascx" TagName="logout" TagPrefix="uc3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ORC管理系統</title>
    <!-- Bootstrap core CSS-->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Page level plugin CSS-->
    <link href="../css/dataTables.bootstrap4.css" rel="stylesheet" />
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet" />
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
                    <li class="breadcrumb-item active">My Dashboard</li>
                </ol>
                <!-- Area Chart Example-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>淨發電功率
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart1" width="100%" height="30"></canvas>
                    </div>
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i>近十次停機(日期/分)
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart2" width="100%" height="30"></canvas>
                    </div>
                    <div class="card-footer small text-muted">
                        <asp:Label ID="lbl_date1" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Example Bar Chart Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-bar-chart"></i>Bar Chart Example
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-8 my-auto">
                                        <canvas id="myBarChart" width="100" height="50"></canvas>
                                    </div>
                                    <div class="col-sm-4 text-center my-auto">
                                        <div class="h4 mb-0 text-primary">$34,693</div>
                                        <div class="small text-muted">YTD Revenue</div>
                                        <hr>
                                        <div class="h4 mb-0 text-warning">$18,474</div>
                                        <div class="small text-muted">YTD Expenses</div>
                                        <hr>
                                        <div class="h4 mb-0 text-success">$16,219</div>
                                        <div class="small text-muted">YTD Margin</div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">
                                <asp:Label ID="lbl_date2" runat="server" Text=""></asp:Label></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <!-- Example Pie Chart Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-pie-chart"></i>Pie Chart Example
                            </div>
                            <div class="card-body">
                                <canvas id="myPieChart" width="100%" height="100"></canvas>
                            </div>
                            <div class="card-footer small text-muted">
                                <asp:Label ID="lbl_date3" runat="server" Text=""></asp:Label></div>
                        </div>
                    </div>
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
            <script src="../js/Chart.min.js"></script>
            <script src="../js/jquery.dataTables.js"></script>
            <script src="../js/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="../js/sb-admin-datatables.min.js"></script>
            <script src="../js/sb-admin-charts.min.js"></script>
        </div>
    </form>
    <script type="text/javascript">
        var ctx1 = document.getElementById("myAreaChart1");
        var ctx2 = document.getElementById("myAreaChart2");
        var netarray = <%=JavaScript.Serialize(this.netarray) %>;
        var tnetarray = <%=JavaScript.Serialize(this.tnetarray) %>;
        var datearray = <%=JavaScript.Serialize(this.datearray) %>;

        var myLineChart = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: datearray,
                datasets: [{
                    label: "平均淨發電功率",
                    lineTension: 0.3,
                    backgroundColor: "rgba(2,117,216,0.2)",
                    borderColor: "rgba(2,117,216,1)",
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(2,117,216,1)",
                    pointBorderColor: "rgba(255,255,255,0.8)",
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                    pointHitRadius: 20,
                    pointBorderWidth: 2,
                    data: netarray,
                }, {
                    label: "累積淨發電功率",
                    lineTension: 0.3,
                    backgroundColor: "rgba(2,117,216,0.2)",
                    borderColor: "rgba(2,117,216,1)",
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(2,117,216,1)",
                    pointBorderColor: "rgba(255,255,255,0.8)",
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                    pointHitRadius: 20,
                    pointBorderWidth: 2,
                    data: tnetarray,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'date'
                        },
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 7
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 200000,
                            maxTicksLimit: 5
                        },
                        gridLines: {
                            color: "rgba(0, 0, 0, .125)",
                        }
                    }],
                },
                legend: {
                    display: false
                }
            }
        });

        var stopdatearray = <%=JavaScript.Serialize(this.stopdatearray) %>;
        var stoptimearray = <%=JavaScript.Serialize(this.stoptimearray) %>;
        var myLineChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: stopdatearray,
                datasets: [{
                    label: "停機時間(分)",
                    lineTension: 0.3,
                    backgroundColor: "rgba(2,117,216,0.2)",
                    borderColor: "rgba(2,117,216,1)",
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(2,117,216,1)",
                    pointBorderColor: "rgba(255,255,255,0.8)",
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                    pointHitRadius: 20,
                    pointBorderWidth: 2,
                    data: stoptimearray,
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'date'
                        },
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            maxTicksLimit: 7
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 1440,
                            maxTicksLimit: 5
                        },
                        gridLines: {
                            color: "rgba(0, 0, 0, .125)",
                        }
                    }],
                },
                legend: {
                    display: false
                }
            }
        });
    </script>
</body>
</html>
