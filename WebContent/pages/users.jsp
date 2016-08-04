<!DOCTYPE HTML5>
<html>
  <head>
    <meta charset="utf-8" />

    <title>Ticket System</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/ui.jqgrid-bootstrap.css"/>
    <!-- JAVASCRIPT SOURCES -->
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/i18n/grid.locale-en.js"></script>
    <script type="text/javascript" src="../js/jquery.jqGrid.min.js"></script>


  </head>

  <body>
    <div class="container-fluid">
      <nav class="navbar navbar-default">
        <div class="navbar-header">
          <a class="navbar-brand" href="dashboard.jsp">TicketSystem</a>
        </div>
        <div class="collapse navbar-collapse" >
          <ul class="nav navbar-nav">
            <li id="nav_dash" ><a href="dashboard.jsp">Dashboard</a></1i>
            <li id="nav_tickets"><a href="tickets.jsp">Tickets</a></1i>
            <li id="nav_users"  class="active"><a href="users.jsp">Users</a></1i>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-haspopup="true"
              aria-expanded="false"><b id="nickname" >nickname</b><span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="profile.jsp">My Profile</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="logout.jsp">Logout</a></li>
              </ul>
            </li>
          </ul>
        </div> <!--navbar collapse -->
      </nav>

      <nav class="navbar navbar-default">
        <div class="container-fluid collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a id="allUsers" href="users.jsp">All Users</a></li>
            <li><a id="addUser" href="users_add.jsp">Add User</a></li>
          </ul>
        </div>
      </nav> <!-- mini ticket navbar-->
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <table id="jqGrid"></table>
          <div id="jqGridPager" style="height:36px"></div>
          <script type="text/javascript">
            $(document).ready(function () {
              $("#jqGrid").jqGrid({
                caption: "USER LIST",
                url: "/Ticket_System/rest/admin/getAllUsers",
                mtype: "GET",
                datatype: "json",
                colModel:[
                  {label:"Name", name:'name', width:80},
                  {label:"Surname", name:'surname', width:80,},
                  {label:"E-Mail", name:'email', width:100},
                  {label:"Password", name:'password', width:100},
                  {label:"Company", name:'company', width:100},
                ],
                viewrecords: true,
                height: 150,
                width:780,
                styleUI: 'Bootstrap',
                rowNum: 10,
                pager: "#jqGridPager"
              });

              $('#jqGrid').navGrid('#jqGridPager',
               {
                   edit: false,
                   add: false,
                   del: false,
                   search: true,
                   refresh: true,
                   view: true,
                   position: "left",
                   cloneToTop: false
               });
            });
         </script>
        </div>
      </div><!-- row -->
    </div> <!-- main container fluid-->

    <!-- prepare page -->
    <script type="text/javascript" src="../js/ticket_security.js"></script>
    <script type="text/javascript">
      var arr ="${sessionScope.LOGIN_USER.email}";
      $("#nickname").html(arr);
    </script>
  </body>
</html>
