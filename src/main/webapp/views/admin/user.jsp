<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lí người dùng</title>
</head>
<body>
<br/>
<div id="comfirm" class="swal2-container swal2-center swal2-backdrop-show" style="display: none; overflow-y: auto; text-align: center;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-icon-warning swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: grid;">
        <div class="swal2-icon swal2-warning swal2-icon-show" style="display: flex;">
            <div class="swal2-icon-content">!</div>
        </div>
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Bạn có chắc?</h2>
        <div class="swal2-html-container" id="swal2-html-container" style="display: block;">Bạn có chắc muốn xóa người dùng này!</div>
        <div class="swal2-actions">
            <a href="" id="btnDongY"
               class="swal2-confirm swal2-styled swal2-default-outline btn-primary" aria-label=""
               style="display: inline-block; background-color: rgb(48, 133, 214);">Đồng ý</a>
            <button type="button" class="swal2-cancel swal2-styled swal2-default-outline" aria-label=""
                    style="display: inline-block; background-color: rgb(221, 51, 51);" onclick="closeConfirmAlert();">Hủy bỏ</button>
        </div>
    </div>
</div>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen}">
    <div class="flex flex-col flex-1 w-full">
            <div class="container grid px-6 mx-auto">
                <div class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
                     href="https://github.com/estevanmaito/windmill-dashboard">
                    <div class="flex items-center">
                        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path
                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                            </path>
                        </svg>
                        <span>Quản lí người dùng</span>
                    </div>
                </div>

                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                    Table with actions
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto table-responsive" style="padding: 15px;">
                        <table class="w-full whitespace-no-wrap" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Client</th>
                                <th class="px-4 py-3">Fullname</th>
                                <th class="px-4 py-3">Active</th>
                                <th class="px-4 py-3">Role</th>
                                <th class="px-4 py-3">Actions</th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <c:forEach var="userItem" items="${listUser}">
                                <tr class="text-gray-700 dark:text-gray-400" style="height: 100px;">
                                    <td class="px-4 py-3" style="padding: 0;">
                                        <div class="flex items-center text-sm">
                                            <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                                                <img class="object-cover w-full h-full rounded-full"
                                                     src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                     alt="" loading="lazy"/>
                                                <div class="absolute inset-0 rounded-full shadow-inner"
                                                     aria-hidden="true"></div>
                                            </div>
                                            <div>
                                                <p class="font-semibold">${userItem.email}</p>
                                                <p class="text-xs text-gray-600 dark:text-gray-400">
                                                        ${userItem.id}
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 text-sm" style="padding: 0;">
                                            ${userItem.fullname}
                                    </td>
                                    <td class="px-4 py-3 text-xs">
                                        <c:if test="${userItem.active == 1}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                                                Active
                                            </span>
                                        </c:if>
                                        <c:if test="${userItem.active == 0}">
                                            <span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
                                                InActive
                                            </span>
                                        </c:if>
                                    </td>
                                    <td class="px-4 py-3 text-sm" style="padding: 0;">
                                        <c:if test="${userItem.role == 1}">
                                            ADMIN
                                        </c:if>
                                        <c:if test="${userItem.role == 0}">
                                            USER
                                        </c:if>
                                    </td>
                                    <td class="px-4 py-3" style="padding: 0;">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <a href="<c:url value="/admin/nguoi-dung/edit?id=${userItem.id}"/> "
                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                    aria-label="Edit">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                     viewBox="0 0 20 20">
                                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z">
                                                    </path>
                                                </svg>
                                            </a>
                                            <div onclick="showComfirmAlert(${userItem.id})"
                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                    aria-label="Delete">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                     viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd"
                                                          d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                          clip-rule="evenodd"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </div>
</div>

<script>
    function closeConfirmAlert(){
        document.getElementById("comfirm").style.display = 'none';
    }
    function showComfirmAlert(id){
        document.getElementById("btnDongY").href = window.location.href + "/remove?id="+id
        document.getElementById("comfirm").style.display = 'unset';
    }
</script>
</body>
</html>
