<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lí danh mục - thể loại</title>
</head>
<body>
<%@include file="/component/admin/addCategory.jsp"%>
<%@include file="/component/admin/editCategory.jsp"%>
<%@include file="/component/admin/editCategoryItem.jsp"%>
<%@include file="/component/admin/addCategoryItem.jsp"%>
<br/>
<div id="deleteCategoryItem" class="swal2-container swal2-center swal2-backdrop-show"
     style="display: none; overflow-y: auto; text-align: center;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-icon-warning swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: grid;">
        <div class="swal2-icon swal2-warning swal2-icon-show" style="display: flex;">
            <div class="swal2-icon-content">!</div>
        </div>
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Bạn có chắc?</h2>
        <div class="swal2-html-container" id="swal2-html-container" style="display: block;">Bạn có chắc muốn xóa thể loại này!
        </div>
        <div class="swal2-actions">
            <form method="post" action="<c:url value="/admin/danh-muc-the-loai?action=delete_categoryItem"/> ">
                <input type="hidden" value="" name="idCategoryItem" id="categoryItemIdDelete">
                <input type="hidden" value="" name="id" id="idOutP">
                <button type="submit"
                        class="swal2-confirm swal2-styled swal2-default-outline btn-primary" aria-label=""
                        style="display: inline-block; background-color: rgb(48, 133, 214);">Đồng ý</button>
                <div type="button" class="swal2-cancel swal2-styled swal2-default-outline" aria-label=""
                     style="display: inline-block; background-color: rgb(221, 51, 51);" onclick="closeComfirmDeleteCategoryItem();">
                    Hủy bỏ
                </div>
            </form>
        </div>
    </div>
</div>
<div id="deleteCategory" class="swal2-container swal2-center swal2-backdrop-show"
     style="display: none; overflow-y: auto; text-align: center;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-icon-warning swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: grid;">
        <div class="swal2-icon swal2-warning swal2-icon-show" style="display: flex;">
            <div class="swal2-icon-content">!</div>
        </div>
        <h2 class="swal2-title" style="display: block;">Bạn có chắc?</h2>
        <div class="swal2-html-container" style="display: block;">Bạn có chắc muốn xóa danh mục này!
        </div>
        <div class="swal2-actions">
            <form method="post" action="<c:url value="/admin/danh-muc-the-loai?action=delete_category"/> ">
                <input type="hidden" value="" name="id" id="idIndex">
                <button type="submit"
                        class="swal2-confirm swal2-styled swal2-default-outline btn-primary" aria-label=""
                        style="display: inline-block; background-color: rgb(48, 133, 214);">Đồng ý</button>
                <div type="button" class="swal2-cancel swal2-styled swal2-default-outline" aria-label=""
                     style="display: inline-block; background-color: rgb(221, 51, 51);" onclick="closeComfirmDeleteCategory();">
                    Hủy bỏ
                </div>
            </form>
        </div>
    </div>
</div>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen}">
    <div class="flex flex-col flex-1 w-full">
            <div class="container grid px-6 mx-auto" style="margin-bottom: 100px">
                <div class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
                     href="https://github.com/estevanmaito/windmill-dashboard">
                    <div class="flex items-center">
                        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                            <path
                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z">
                            </path>
                        </svg>
                        <span>Quản lí danh mục - thể loại</span>
                    </div>
                </div>
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                    Danh mục
                </h4>
                <section class="border p-3 mb-3">
                    <div class="row">
                        <div class="col-lg-9">
                            <select id="valueDanhMuc" onchange="onChangeDanhMuc()" class="form-select float-right"
                                    aria-label="Default select example">
                                <c:forEach var="category" items="${categoryList}">
                                    <option value="${category.id}"
                                            <c:if test="${category.id == index}">
                                                selected
                                            </c:if>
                                    >${category.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <div class="flex items-center space-x-4 text-sm">
                                <div onclick="onInputAlert()" class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                     aria-label="Edit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-plus-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                    </svg>
                                </div>
                                <div onclick="onEditCategory()" class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                     aria-label="Edit">
                                    <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                         viewBox="0 0 20 20">
                                        <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z">
                                        </path>
                                    </svg>
                                </div>
                                <div onclick="onCofirmDeleteCategory()" class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                     aria-label="Delete">
                                    <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                         viewBox="0 0 20 20">
                                        <path fill-rule="evenodd"
                                              d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="row">
                    <div class="col-lg-10">
                        <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                            Thể loại
                        </h4>
                    </div>
                    <input type="hidden" value="${index}" id="idCategory">
                    <div class="col-lg-2 float-right">
                        <button onclick="onAddCategoryItem(document.getElementById('idCategory').value)" class="btn btn-primary">Thêm thể loại</button>
                    </div>
                </div>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto table-responsive" style="padding: 15px;">
                        <table class="w-full whitespace-no-wrap" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Thể loại</th>
                                <th class="px-4 py-3">url</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <c:forEach var="categoryItem" items="${categoryItemList}">
                                <tr class="text-gray-700 dark:text-gray-400" style="height: 100px;">
                                    <td class="px-4 py-3 text-sm" style="padding: 0;">
                                            ${categoryItem.categoryName}
                                    </td>
                                    <td class="px-4 py-3 text-sm" style="padding: 0;">
                                            ${categoryItem.url}
                                    </td>
                                    <td class="px-4 py-3" style="padding: 0;">
                                        <div class="flex items-center space-x-4 text-sm">
                                            <a href="<c:url value="${url}&category-item=${categoryItem.url}"/> "
                                               class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                               aria-label="Edit">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                     viewBox="0 0 20 20">
                                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z">
                                                    </path>
                                                </svg>
                                            </a>
                                            <div onclick="onCofirmDeleteCategoryItem(${categoryItem.id})"
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
    const onChangeDanhMuc = () => {
        console.log(document.getElementById('valueDanhMuc').value);
        window.location.href = "?id=" + document.getElementById('valueDanhMuc').value;
    }

    function onCofirmDeleteCategoryItem(id){
        console.log(id)
        document.getElementById('categoryItemIdDelete').value = id;
        document.getElementById('idOutP').value = document.getElementById('idCategory').value;
        document.getElementById('deleteCategoryItem').style.display = 'unset';
    }

    function onCofirmDeleteCategory(){
        document.getElementById('idIndex').value = document.getElementById('idCategory').value;
        document.getElementById('deleteCategory').style.display = 'unset';
    }

    function closeComfirmDeleteCategoryItem(){
        document.getElementById('deleteCategoryItem').style.display = 'none';
    }

    function closeComfirmDeleteCategory(){
        document.getElementById('deleteCategory').style.display = 'none';
    }
</script>
</body>
</html>
