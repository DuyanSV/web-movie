<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><dec:title default="Trang chủ"></dec:title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value="/template/admin/css/tailwind.output.css"/> "/>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="<c:url value="/template/admin/js/init-alpine.js"/> "></script>

<%--    css table--%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link href="<c:url value="/template/admin/datatable/sb-admin-2.min.css"/> " rel="stylesheet">
    <link href="<c:url value="/template/admin/css/edituser.css"/> " rel="stylesheet">
    <link href="<c:url value="/template/alert/sweetalert2.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/template/alert/toastr/css/toastr.min.css"/>" rel="stylesheet"/>
<%--    <link href="<c:url value="/template/alert/toastr/style.css"/>" rel="stylesheet"/>--%>

</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen }"
>
    <%@include file="/commont/admin/menu.jsp"%>

    <div class="flex flex-col flex-1 w-full">
        <%@include file="/commont/admin/header.jsp"%>
        <main class="h-full overflow-y-auto">
            <div class="container px-6 mx-auto grid">
                <dec:body></dec:body>
                <%@include file="/commont/alert/errorAlert.jsp" %>
                <%@include file="/commont/alert/successAlert.jsp" %>
            </div>
        </main>
    </div>
</div>

<%--data table--%>
<script src="<c:url value="/template/alert/toastr/common.min.js"/> "></script>
<script src="<c:url value="/template/alert/toastr/js/toa.js"/> "></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/template/ajax/ajax.js"/> "></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/template/admin/datatable/jquery.dataTables.min.js"/> " crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="/template/admin/datatable/datatables-demo.js" />"></script>
<script src="<c:url value="/template/alert/sweetalert2.all.min.js" />"></script>
<script src="<c:url value="/template/ckeditor/ckeditor.js"/> "></script>

<script>
    CKEDITOR.replace('motaNgan');
</script>
</body>
</html>
