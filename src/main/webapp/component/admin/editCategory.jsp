<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="editCategory" class="swal2-container swal2-center swal2-backdrop-show"
     style="overflow-y: auto;
     <c:if test="${onEditCategory == null}">
             display: none
     </c:if>
     <c:if test="${onEditCategory != null}">
             display: unset;
     </c:if>
             ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive"
         aria-modal="true" style="display: grid;">
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Sửa tên danh mục</h2>
        <form method="post" action="<c:url value="/admin/danh-muc-the-loai"/> ">
            <input type="hidden" name="action" value="editCategory">
            <input type="hidden" name="id" value="${idCategory}">
            <input autocapitalize="off" name="danhMucName" value="${category.categoryName}" class="swal2-input" placeholder="" type="text" style="display: flex;">
            <div class="swal2-actions">
                <div class="swal2-loader"></div>
                <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                        style="display: inline-block;">Lưu
                </button>
                <div onclick="closeEditCategory()"
                     class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">hủy bỏ
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function onEditCategory(){
        var id = document.getElementById('valueDanhMuc').value;
        window.location.href = '?id=' + id + "&action=editCategory"
    }

    function closeEditCategory(){
        document.getElementById("editCategory").style.display = 'none';
    }
</script>