<%--
  Created by IntelliJ IDEA.
  User: xiaoy_000
  Date: 2017/7/6
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from condorthemes.com/cleanzone/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:21 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../images/favicon.png">

    <title>NBIOT - 智能环境管理</title>

    <!-- Bootstrap core CSS -->/
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../js/jquery.gritter/css/jquery.gritter.css" />

    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../js/jquery.nanoscroller/nanoscroller.css" />
    <link rel="stylesheet" type="text/css" href="../js/jquery.easypiechart/jquery.easy-pie-chart.css" />
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.switch/bootstrap-switch.css" />
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="../js/jquery.select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="../js/bootstrap.slider/css/slider.css" />
    <link rel="stylesheet" type="text/css" href="../js/jquery.datatables/bootstrap-adapter/css/datatables.css" />
    <link href="../css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <style>
        .header h3{
            display:inline;
        }
        .header h4{
            color: #0e90d2;
            font-weight: bold;
            display:inline;
        }
        .header a{
            color: #0e90d2;
            font-weight: bold;
            display:inline;
            float: right;
        }
    </style>
    <script type="text/javascript">

    </script>
</head>

<body>
<jsp:include page="/WEB-INF/include/info.jsp" flush="true" />  <!-- 悬浮栏-->

<div id="cl-wrapper">
    <div class="cl-sidebar">
        <div class="cl-toggle"><i class="fa fa-bars"></i></div>
        <div class="cl-navblock">
            <div class="menu-space">
                <div class="content">
                    <div class="side-user">
                        <div class="avatar"><img src="../images/avatar1_50.jpg" alt="Avatar" /></div>
                        <div class="info">
                            <a href="#">
                                <%
                                    String u=session.getAttribute("name").toString();
                                %>
                                <%out.print(u); %>
                            </a>
                            <img src="../images/state_online.png" alt="Status" /> <span>Online</span>
                        </div>
                    </div>
                    <jsp:include page="/WEB-INF/include/menu.jsp" flush="true" /> <!-- 菜单栏-->
                </div>
            </div>
            <div class="text-right collapse-button" style="padding:7px 9px;">
                <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
            </div>
        </div>
    </div>



    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2>智能环境列表信息</h2>
            <ol class="breadcrumb">
                <li><a href="#">主页</a></li>
                <li><a href="#">智能环境管理</a></li>
                <li class="active">智能环境列表信息</li>
            </ol>
        </div>
        <div class="cl-mcont">

            <div class="row">
                <div class="col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3>智能环境列表信息</h3>
                            <h4 style="">(${deviceID})</h4>
                            <a href="${pageContext.request.contextPath }/sensor/findByThing.do">返回列表</a>
                        </div>
                        <div class="content">
                            <div class="table-responsive">
                                <div id="main" style="height:400px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<script src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
<script type="text/javascript" src="../js/jquery.sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="../js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="../js/behaviour/general.js"></script>
<script src="../js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.nestable/jquery.nestable.js"></script>
<script type="text/javascript" src="../js/bootstrap.switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="../js/jquery.select2/select2.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="../js/jquery.datatables/jquery.datatables.min.js"></script>
<script type="text/javascript" src="../js/jquery.datatables/bootstrap-adapter/js/datatables.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        //initialize the javascript
        App.init();
        App.dataTables();

        /* Formating function for row details */
        function fnFormatDetails ( oTable, nTr )
        {
            var aData = oTable.fnGetData( nTr );
            var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
            sOut += '<tr><td>Rendering engine:</td><td>'+aData[1]+' '+aData[4]+'</td></tr>';
            sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
            sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
            sOut += '</table>';

            return sOut;
        }

        /*
         * Insert a 'details' column to the table
         */
        var nCloneTh = document.createElement( 'th' );
        var nCloneTd = document.createElement( 'td' );
        nCloneTd.innerHTML = '<img class="toggle-details" src="images/plus.png" />';
        nCloneTd.className = "center";

        $('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
        $('.dataTables_length select').addClass('form-control');

        //Horizontal Icons dataTable
        $('#datatable-icons').dataTable();
    });
</script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../js/behaviour/voice-commands.js"></script>
<script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="../js/jquery.flot/jquery.flot.labels.js"></script>
</body>
<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>

<script type="text/javascript">
    function changeChart(){
        var myChart = echarts.init(document.getElementById('main'));
        var TemData = []
        var HumData = []
        var PressureData = []
        var xValue = []
        <c:if test="${sensorinfosList.size() > 30}">
            <c:forEach items="${sensorinfosList}" var="s" begin="${sensorinfosList.size()-30}" end="${sensorinfosList.size()-1}">
                TemData.push(${s.getTem()})
                HumData.push(${s.getHum()})
                PressureData.push(${s.getPressure()})
                xValue.push(${sensorinfosList.indexOf(s)+31-sensorinfosList.size()})
            </c:forEach>
        </c:if>
        <c:if test="${sensorinfosList.size() <= 30}">
            <c:forEach items="${sensorinfosList}" var="s" >
                TemData.push(${s.getTem()})
                HumData.push(${s.getHum()})
                PressureData.push(${s.getPressure()})
                xValue.push(${sensorinfosList.indexOf(s)+1})
            </c:forEach>
        </c:if>
        myChart.setOption(setOption(xValue,TemData,HumData,PressureData));
    }
    changeChart()

    function setOption(index,tem,hum,pressure){
        var option = {
            title : {
                text: '数据折线图显示',
                subtext: '最近30次观测数据'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['温度','湿度','大气压']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : index
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}'
                    }
                }
            ],
            series : [
                {
                    name:'温度',
                    type:'line',
                    data:tem
                },
                {
                    name:'湿度',
                    type:'line',
                    data:hum
                },
                {
                    name:'大气压',
                    type:'line',
                    data:pressure
                }
            ]
        };
        return option
    }
</script>
<!-- Mirrored from condorthemes.com/cleanzone/tables-datatables.html by HTTrack Website Copier/3.x [XR&CO'2013], Mon, 31 Mar 2014 14:37:27 GMT -->
</html>

