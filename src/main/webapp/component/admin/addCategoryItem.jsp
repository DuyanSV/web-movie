<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="addCategoryItem" class="swal2-container swal2-center swal2-backdrop-show"
     style="overflow-y: auto;
     <c:if test="${onAddCategory == null}">
             display: none
     </c:if>
     <c:if test="${onAddCategory != null}">
             display: unset;
     </c:if>
             ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive"
         aria-modal="true" style="display: grid;">
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Thêm thể loại</h2>
        <form method="post" action="<c:url value="/admin/danh-muc-the-loai"/> " style="width: 400px">
            <input type="hidden" id="idAddCategoryItem" name="id" value="${id}">
            <input type="hidden" name="action" value="addCategoryItem">
            <input onkeyup="setUrlAdd()" autocapitalize="off" name="categoryItemName" value="${categoryItemName}" class="swal2-input" placeholder="Tên thể loại" type="text" style="display: flex; width: 100%">
            <input autocapitalize="off" name="urlCategoryItem" value="${urlCategoryItem}" class="swal2-input" placeholder="url" type="text" style="display: flex; width: 100%">
            <div class="swal2-actions">
                <div class="swal2-loader"></div>
                <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                        style="display: inline-block;">Lưu
                </button>
                <div onclick="closeAddCategoryItem()"
                     class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">Hủy bỏ
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function setUrlAdd(){
        var name = document.getElementsByName('categoryItemName')[1].value;
        document.getElementsByName('urlCategoryItem')[1].value = xoadau(name).toLowerCase()
    }

    const onAddCategoryItem = (id) => {
        document.getElementById('idAddCategoryItem').value = id;
        document.getElementById("addCategoryItem").style.display = 'unset';
    }

    function closeAddCategoryItem(){
        document.getElementById("addCategoryItem").style.display = 'none';
    }

</script>