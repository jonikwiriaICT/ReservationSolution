<%@ Page Title="" Language="C#" MasterPageFile="~/AdminReservationMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Administrator_Dashboard" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <style>
        #container {
            height: 420px;
        }

        .highcharts-figure, .highcharts-data-table table {
            min-width: 360px;
            max-width: 600px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>
    <section class="content-header">
        <h1>Dashboard
       
            <small>Version 1.0</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Info boxes -->

        <!-- /.row -->

        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Booking Report</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12 table-responsive ">
                                <figure class="highcharts-figure">
                                    <div id="containerRetail"></div>
                                    <p class="highcharts-description">
                                        Reservation Sales
                                    </p>
                                </figure>

                            </div>
                          

                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- ./box-body -->

                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>

        <!-- /.row -->

        <!-- Main row -->

    </section>
    <!-- /.content -->
    <script src="floating-whatsapp-master/jquery-3.3.1.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/cylinder.js"></script>
    <script src="https://code.highcharts.com/modules/funnel3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/modules/pyramid3d.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script>

        $.ajax({
            type: "POST",
            url: "Report.asmx/GetBookedRoomReport",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccessProjectYear,
            error: OnErrorProjectCost
        });
       
       
       
        function OnSuccessProjectYear(reponse) {
            var sData = reponse.d;
            var sLabel = sData[0];
            var sDataSet = sData[1];
            var ints = sDataSet.map(parseFloat);

            Highcharts.chart('containerRetail', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: 'Booking Sales'
                },
                subtitle: {
                    text: 'Booking Sales'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: sLabel,
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: null
                    }
                },
                series: [{
                    name: 'Sales in Naira',
                    data: ints
                }]
            });


        }
        function OnErrorProjectCost(repo) {
            alert(" something went wrong on Sales report, please try later !");
        }
       

     


      


    </script>
</asp:Content>


