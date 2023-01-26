<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="inputAlert" class="swal2-container swal2-center swal2-backdrop-show"
     style="overflow-y: auto;
     <c:if test="${onInput == null}">
             display: none
     </c:if>
     <c:if test="${onInput != null}">
             display: unset;
     </c:if>
             ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive"
         aria-modal="true" style="display: grid;">
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Nhập tên danh mục mới</h2>
        <form method="post" action="<c:url value="/admin/danh-muc-the-loai"/> ">
            <input type="hidden" name="action" value="addCategory">
            <input autocapitalize="off" name="danhMucName" value="${danhMucName}" class="swal2-input" placeholder="" type="text" style="display: flex;">
            <div class="swal2-actions">
                <div class="swal2-loader"></div>
                <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                        style="display: inline-block;">Thêm
                </button>
                <div onclick="closeInputAlert()"
                     class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">hủy bỏ
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function onInputAlert(){
        document.getElementById("inputAlert").style.display = 'unset';
    }

    function closeInputAlert(){
        document.getElementById("inputAlert").style.display = 'none';
    }
</script>