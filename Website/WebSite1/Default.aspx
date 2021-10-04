<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Reservation and Service System</title>
    <link rel="icon" href="twitterbot.png" />
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
    <link href="style.css" rel="stylesheet" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css" />
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="css/slick.css" />
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.css" />
    <!-- Jquery-ui CSS -->
    <!-- Venobox CSS -->
    <link rel="stylesheet" href="css/venobox.css" />
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="css/nice-select.css" />
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css" />
    <!-- Bootstrap V4.1.3 Fremwork CSS -->
    <!-- Helper CSS -->
    <link rel="stylesheet" href="css/helper.css" />
    <!-- Main Style CSS -->
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Modernizr js -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <link href="floating-whatsapp-master/floating-wpp.css" rel="stylesheet" />




    <!-- Site Properties -->

    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i&amp;subset=latin-ext" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/uikit.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/tiny-date-picker.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/media-query.css" />
    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
    <style type="text/css">
        a.gflag {
            vertical-align: middle;
            font-size: 16px;
            padding: 1px 0;
            background-repeat: no-repeat;
            background-image: url(//gtranslate.net/flags/16.png);
        }

            a.gflag img {
                border: 0;
            }

            a.gflag:hover {
                background-image: url(//gtranslate.net/flags/16a.png);
            }

        #goog-gt-tt {
            display: none !important;
        }

        .goog-te-banner-frame {
            display: none !important;
        }

        .goog-te-menu-value:hover {
            text-decoration: none !important;
        }

        body {
            top: 0 !important;
        }

        #google_translate_element2 {
            display: none !important;
        }
        -->
    </style>
    <style>
        body, html {
            height: 100%;
            /* Full height */
            height: 100%;
            /* Center and scale the image nicely */
        }

        ::-webkit-scrollbar {
            width: 20px;
        }


        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: white;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #4fc1f0;
            }
    </style>
</head>
<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="hold-transition skin-blue layout-boxed sidebar-mini">
    <!-- Site wrapper -->
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="wrapper layout-top-nav">

            <header class="main-header">
                <!-- Logo -->
                <nav class="navbar navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <a href="index" class="navbar-brand"><b>Reserved</b>&nbsp System</a>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                                <i class="fa fa-bars"></i>
                            </button>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">

                            <div class="navbar-form navbar-left" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="navbarsearchinput" runat="server" placeholder="Search" />
                                </div>
                            </div>
                        </div>
                        <div class="navbar-custom-menu">
                            <ul class="nav navbar-nav">
                                <li class="dropdown messages-menu">
                                    <asp:LinkButton ID="lnkCartCheck" OnClick="CartCheck" runat="server">
                                      <i class=" fa fa-cart-plus"></i>
              <span class="label label-success"><%=sCountCart  %></span>
                                    </asp:LinkButton>


                                </li>

                                <li class="dropdown user user-menu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <img runat="server" id="UserImage" src="dist/img/avatar.png" class="user-image" alt="User Image" />
                                        <span class="hidden-xs">
                                            <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <!-- User image -->
                                        <li class="user-header">
                                            <img runat="server" id="UserImage1" src="dist/img/avatar.png" class="img-circle" alt="User Image" />


                                        </li>
                                        <!-- Menu Body -->

                                        <!-- Menu Footer-->
                                        <li class="user-footer">
                                            <div class="pull-right">
                                                <%
                                                    if (Session["audit_username"] == null)
                                                    {
                                                %>
                                                <asp:LinkButton ID="lnkSignin" OnClick="SignOut" CssClass="btn btn-default btn-flat" runat="server"><i class="fa fa-sign-in"></i>&nbsp Sign in</asp:LinkButton>
                                                <%
                                                    }
                                                    else
                                                    {

                                                %>
                                                <asp:LinkButton ID="lnkSignOut" OnClick="SignOut" CssClass="btn btn-default btn-flat" runat="server"><i class="fa fa-sign-out"></i>&nbsp Sign Out</asp:LinkButton>

                                                <%
                                                    }
                                                %>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <!-- Control Sidebar Toggle Button -->
                                <li>
                                    <div id="google_translate_element" class="input-sm"></div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                        <!-- Navbar Right Menu -->

                        <!-- /.navbar-custom-menu -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
            </header>
                  
            <div class="content-wrapper">
               
                <div class="container">
               
                    <!-- Main content -->
                    <section class="content ">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel ">

                                    <div class="panel-body table-responsive">
                                       
                                        <div class="uk-container-expand">
                                            <div class="impx-slide-container style1">
                                                <div class="impx-slideshow-fw">

                                                    <div data-uk-slideshow="autoplay: true; autoplay-interval: 6000; animation: fade; finite: false; min-height: 319; max-height: 980;">
                                                        <div class="uk-position-relative uk-visible-toggle uk-light">

                                                            <ul class="uk-slideshow-items">
                                                                <li>
                                                                    <!-- Slideshow Item #1 -->
                                                                    <div class="uk-position-cover uk-animation-kenburns uk-animation-reverse uk-transform-origin-bottom-center">
                                                                        <img src="images/slideshow/full-slide-1.jpg" alt="" data-uk-cover="height:319px">
                                                                        <div class="uk-overlay-primary uk-position-cover impx-overlay dark"></div>
                                                                    </div>
                                                                    <div class="uk-container uk-position-relative uk-height-1-1">
                                                                        <div class="uk-position-left uk-flex uk-flex-middle">
                                                                            <div class="impx-slide-fw-caption">
                                                                                <div class="impx-slide-fw-caption-outline uk-transition-slide-left"></div>
                                                                                <h1 class="uk-margin-remove impx-text-shadow uk-transition-slide-top uk-text-left">Home Reservation and &amp; Services</h1>
                                                                                <p class="impx-text-large impx-text-aqua uk-margin-remove impx-text-shadow uk-transition-slide-bottom uk-text-right uk-text-uppercase">Reserve the best room for one or more persons</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Slideshow Item #1 End -->
                                                                <li>
                                                                    <!-- Slideshow Item #2 -->
                                                                    <div class="uk-position-cover uk-animation-kenburns uk-animation-reverse uk-transform-origin-center-right">
                                                                        <img src="images/slideshow/full-slide-2.jpg" alt="" data-uk-cover>
                                                                        <div class="uk-overlay-primary uk-position-cover impx-overlay dark"></div>
                                                                    </div>
                                                                    <div class="uk-container uk-position-relative uk-height-1-1">
                                                                        <div class="uk-position-right uk-flex uk-flex-middle">
                                                                            <div class="impx-slide-fw-caption right">
                                                                                <div class="impx-slide-fw-caption-outline right bottom uk-transition-slide-left"></div>
                                                                                <h1 class="uk-margin-remove impx-text-shadow uk-transition-slide-top uk-text-right">Beautiful Panorama</h1>
                                                                                <p class="uk-text-large impx-text-aqua uk-margin-remove impx-text-shadow uk-transition-slide-bottom uk-text-right uk-text-uppercase">Enjoy the Best View</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Slideshow Item #2 End -->
                                                                <li>
                                                                    <!-- Slideshow Item #3 -->
                                                                    <div class="uk-position-cover uk-animation-kenburns uk-animation-reverse uk-transform-origin-center-left">
                                                                        <img src="images/slideshow/full-slide-3.jpg" alt="" data-uk-cover>
                                                                        <div class="uk-overlay-primary uk-position-cover impx-overlay dark"></div>
                                                                    </div>
                                                                    <div class="uk-container uk-position-relative uk-height-1-1">
                                                                        <div class="uk-position-left uk-flex uk-flex-middle">
                                                                            <div class="impx-slide-fw-caption text-right">
                                                                                <div class="impx-slide-fw-caption-outline uk-transition-slide-top"></div>
                                                                                <h1 class="impx-text-white uk-margin-remove impx-text-shadow uk-transition-scale-down">Luxurious &amp; Convenient</h1>
                                                                                <p class="uk-text-large impx-text-gold uk-margin-remove impx-text-shadow uk-transition-scale-up uk-text-right uk-text-uppercase">Choose The Best One</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Slideshow Item #3 End -->
                                                                <li>
                                                                    <!-- Slideshow Item #4 -->
                                                                    <div class="uk-position-cover uk-animation-kenburns uk-animation-reverse uk-transform-origin-bottom-right">
                                                                        <img src="images/slideshow/full-slide-4.jpg" alt="" data-uk-cover>
                                                                        <div class="uk-overlay-primary uk-position-cover impx-overlay dark"></div>
                                                                    </div>
                                                                    <div class="uk-container uk-position-relative uk-height-1-1">
                                                                        <div class="uk-position-center uk-flex uk-flex-middle">
                                                                            <div class="impx-slide-fw-caption bottom">
                                                                                <div class="impx-slide-fw-caption-outline center bottom uk-transition-slide-left"></div>
                                                                                <h1 class="uk-margin-remove impx-text-shadow uk-transition-slide-top uk-text-center">Oriental Spa</h1>
                                                                                <p class="uk-text-large impx-text-aqua uk-margin-remove impx-text-shadow uk-transition-slide-bottom uk-text-center uk-text-uppercase">Our Spa Service</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Slideshow Item #4 End -->

                                                            </ul>

                                                            <!-- Slideshow Nav -->
                                                            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" data-uk-slidenav-previous data-uk-slideshow-item="previous"></a>
                                                            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" data-uk-slidenav-next data-uk-slideshow-item="next"></a>
                                                            <!-- Slideshow Nav End -->

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="impx-content impx-services style2 bg-color-aqua pattern-1">
                                             <div id="WAButton"></div>
                                            <div class="uk-container">

                                                <div class="uk-margin-medium-bottom impx-margin-bottom-small" data-uk-grid>

                                                    <!-- Services List -->
                                                    <div class="uk-width-expand impx-services-list uk-margin-bottom impx-margin-bottom-small">
                                                        <h6 class="uk-heading-line uk-text-center uk-light uk-margin-bottom impx-text-white"><span>Our Services</span></h6>
                                                        <div class="uk-child-width-1-4@xl uk-child-width-1-4@l uk-child-width-1-4@m uk-child-width-1-2@s uk-grid-medium" data-uk-grid>
                                                            <asp:ListView ID="LVProducts" runat="server" OnItemCommand="dtSpouse_itemCommand">
                                                                <ItemTemplate>
                                                                    <div>
                                                                        <!-- Services Item #1 -->
                                                                        <div class="uk-card uk-card-default uk-box-shadow-hover-xlarge impx-service-card uk-padding-bottom">
                                                                            <div class="uk-card-media-top">
                                                                                <img src='<%#Eval("Pic") %>' runat ="server"  alt="Pic"/>
                                                                            </div>
                                                                            <div class="uk-card-body uk-card-small uk-text-center">
                                                                                <div class="uk-card-badge uk-label uk-label-danger bg-color-aqua"><%#Eval("Room Type") %></div>
                                                                                <p><%#Eval("Room Name") %></p>
                                                                                <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="uk-button uk-button-default uk-button-small impx-button gold impx-button-outline outline-gold button-wide impx-button-rounded small-border"
                                                                                                        CommandName="btnAddToCart" CommandArgument='<%#Eval("RecID")%>'>
                                                                                            <i class=" fa fa-shopping-cart"></i>&nbsp Reserve &raquo;
                                                                                                    </asp:LinkButton>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- Services Item #1 End -->
                                                                </ItemTemplate>
                                                            </asp:ListView>



                                                        </div>
                                                    </div>
                                            
                                                    <!-- Services List End -->

                                                </div>
                                                
                                                        <div class="paginatoin-area">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dlPager"
                                                                    OnItemCommand="dlPager_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <nav aria-label="Page navigation example" class="mt-50">
                                                                            <ul class="pagination justify-content-center">
                                                                                <li class="page-item ">
                                                                                    <asp:LinkButton Enabled='<%#Eval("Enabled") %>' CssClass="page-link bg-dark text-white" runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>

                                                                                </li>
                                                                            </ul>
                                                                        </nav>

                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>

                                                        </div>
                                                    </div>
                                                <!-- Booking Form -->


                                            </div>
                                        </div>
                                        <!-- SERVICES LIST & BOOKING FORM END -->

                                    </div>

                                    <!-- Li's Laptop Product Area End Here -->

                                </div>
                            </div>

                        </div>
                    </section>

                    <!-- /.content -->
                </div>
                <!-- /.container -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="container">
                    <div class="pull-right hidden-xs">
                        <b>Version</b> 1.0
                    </div>
                    <strong>Copyright &copy; <%=DateTime .UtcNow .Year  %> <a href="https://veritas.edu.ng">Designed  Department of Computer and Information Technology.</a>.</strong> All rights
                    reserved.
                </div>
                <!-- /.container -->
            </footer>
        </div>
    </form>
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- Sparkline -->
    <script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- jvectormap  -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- SlimScroll -->
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- ChartJS -->
    <script src="bower_components/chart.js/Chart.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard2.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <script src="plugins/iCheck/icheck.min.js"></script>
    <script src="floating-whatsapp-master/floating-wpp.js"></script>

    <!-- Page Script -->
    <script>
        $(function () {
            //Enable iCheck plugin for checkboxes
            //iCheck for checkbox and radio inputs
            $('.mailbox-messages input[type="checkbox"]').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-blue'
            });

            //Enable check and uncheck all functionality
            $(".checkbox-toggle").click(function () {
                var clicks = $(this).data('clicks');
                if (clicks) {
                    //Uncheck all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
                    $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
                } else {
                    //Check all checkboxes
                    $(".mailbox-messages input[type='checkbox']").iCheck("check");
                    $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
                }
                $(this).data("clicks", !clicks);
            });

            //Handle starring for glyphicon and font awesome
            $(".mailbox-star").click(function (e) {
                e.preventDefault();
                //detect type
                var $this = $(this).find("a > i");
                var glyph = $this.hasClass("glyphicon");
                var fa = $this.hasClass("fa");

                //Switch states
                if (glyph) {
                    $this.toggleClass("glyphicon-star");
                    $this.toggleClass("glyphicon-star-empty");
                }

                if (fa) {
                    $this.toggleClass("fa-star");
                    $this.toggleClass("fa-star-o");
                }
            });
        });
    </script>
    <script>
        $(function () {
            $('.catr').DataTable()
            $('.catrdd').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })
    </script>
    <script type="text/javascript">
        $(function () {
            $('#WAButton').floatingWhatsApp({
                phone: '<%=Session ["UserID"].ToString ()%>', //WhatsApp Business phone number
                headerTitle: ' Chat with us on our AI!', //Popup Title
                popupMessage: 'Welcome to Reservation and service system., how can we help you?', //Popup Message
                showPopup: true, //Enables popup display
                buttonImage: '<img src="twitterbot.png" />', //Button Image
                headerColor: 'white', //Custom header color
                backgroundColor: 'crimson', //Custom background button color
                position: "right" //Position: left | right

            });
        });
    </script>
    <script type="text/javascript">
        (function () {
            var scriptElement = document.createElement('script');
            scriptElement.type = 'text/javascript';
            scriptElement.async = false;
            scriptElement.src = '/BotService.aspx?Get=Script';
            (document.getElementsByTagName('head')[0] ||
                document.getElementsByTagName('body')[0]).appendChild(scriptElement);
        })();
    </script>
    <!--End of Tawk.to Script-->
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({ pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
        }
    </script>
    <script>
        function isNumber(evt, element) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (
                (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
                (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
                (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>
    <script>
        $('.decimal').keypress(function (event) {
            return isNumber(event, this)
        });
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script src="js/jquery.meanmenu.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- Main/Activator js -->
    <script src="js/main.js"></script>
<%--    <script src="js/jquery.js"></script>--%>
    <script src="js/uikit.min.js"></script>
    <script src="js/uikit-icons.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBGb3xrNtz335X4G2KfoOXb-XuIyHAzlVo"></script>
    <script src="js/jquery.gmap.min.js"></script>
    <script src="js/jquery.parallax.min.js"></script>
    <script src="js/tiny-date-picker.min.js"></script>
    <script src="js/date-config.js"></script>
    <script src="js/template-config.js"></script>
</body>
</html>
