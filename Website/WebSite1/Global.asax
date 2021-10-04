<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">
    static void RegisterRoutes(RouteCollection routes)
    {
        //first param is unique, second param is the expected url, thrid param is the actual file/page
        //general root menu
        //Administration Users
        routes.MapPageRoute("rtencf", "en", "~/Error.aspx");
        routes.MapPageRoute("rten", "error", "~/Default.aspx");
        routes.MapPageRoute("rtIndex", "Index", "~/Default.aspx");
        //Administrator
        routes.MapPageRoute("rtAdminSignin", "Signin", "~/AdminSignin.aspx");
        routes.MapPageRoute("rtDashboard", "Dashboard", "~/Administrator/Dashboard.aspx");
        routes.MapPageRoute("rtChangePassword", "Change-Password", "~/Administrator/ChangePassword.aspx");
        routes.MapPageRoute("rtRoomType", "Room-Type", "~/Administrator/RoomType.aspx");
        routes.MapPageRoute("rtRoom", "Room", "~/Administrator/Room.aspx");
        routes.MapPageRoute("rtCustomer", "Manage-Customer", "~/Administrator/Customer.aspx");
        routes.MapPageRoute("rtManageAdministrator", "Manage-Administrator", "~/Administrator/ManageAdministrator.aspx");
        routes.MapPageRoute("rtReservation", "Reservation", "~/Administrator/Reservation.aspx");
        routes.MapPageRoute("rtReservationReport", "Reservation-Report", "~/Administrator/ReservationReport.aspx");
        routes.MapPageRoute("rtManageBookedRoom", "Manage-Booked-Room", "~/Administrator/ManageBookedRoom.aspx");
        routes.MapPageRoute("etBookedRoomReport", "Booked-Room-Report", "~/Administrator/BookedRoomReport.aspx");
        routes.MapPageRoute("rtNonBookedRoomReport", "Non-Booked-Room-Report", "~/Administrator/NonBookedRoomReport.aspx");
        routes.MapPageRoute("rtAuditTrail", "Audit-Trail", "~/Administrator/AuditTrail.aspx");


        //Customer
        routes.MapPageRoute("rtCustomerSignin", "Login", "~/CustomerSignin.aspx");
        routes.MapPageRoute("rtCustomerRegister", "Register", "~/CustomerRegister.aspx");
        routes.MapPageRoute("rtCart", "Cart", "~/Cust/Cart.aspx");
        routes.MapPageRoute("rtEmptyCart", "Empty-Cart", "~/Cust/EmptyCart.aspx");
        routes.MapPageRoute("rtCheck", "Check", "~/Cust/Check.aspx");
        routes.MapPageRoute("rtPaymentFailure", "Payment-Failure", "~/Cust/PaymentFailure.aspx");
        routes.MapPageRoute("rtCheckOut", "Check-Out", "~/Cust/CheckOut.aspx");
        routes.MapPageRoute("rtPaymentSuccess", "Payment-Success", "~/Cust/PaymentSuccess.aspx");
        routes.MapPageRoute("rtMyCustomer", "My-Customer", "~/Cust/MyCustomer.aspx");
        routes.MapPageRoute("rtCustomerDashboard", "Customer-Dashboard", "~/Cust/CustomerDashboard.aspx");
         routes.MapPageRoute("rtChatBot", "Chat-Bot", "~/Cust/ChatBot.aspx");
         routes.MapPageRoute("rtChatHistory", "Chat-History", "~/Cust/ChatHistory.aspx");
           routes.MapPageRoute("RTFeedback", "Feedback", "~/Cust/Feedback.aspx");
          routes.MapPageRoute("rtClientReservationReport", "Client-Reservation-Report", "~/Cust/ClientReservationReport.aspx");
        
             routes.MapPageRoute("rtPaidError", "Paid-Error", "~/Cust/PaidError.aspx");

        
        
        









    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        // SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
    }
</script>
