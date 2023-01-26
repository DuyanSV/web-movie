<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="editCategoryItem" class="swal2-container swal2-center swal2-backdrop-show"
     style="overflow-y: auto;
     <c:if test="${onEditCategoryItem == null}">
             display: none
     </c:if>
     <c:if test="${onEditCategoryItem != null}">
             display: unset;
     </c:if>
             ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive"
         aria-modal="true" style="display: grid;">
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Chỉnh sửa thể loại</h2>
        <form method="post" action="<c:url value="/admin/danh-muc-the-loai?id=${index}"/> " style="width: 400px">
            <input type="hidden" value="updateCategoryItem" name="action">
            <input type="hidden" value="${categoryItem.id}" name="idCategoryItem">
            <input onkeyup="setUrl()" autocapitalize="off" name="categoryItemName" value="${categoryItem.categoryName}" class="swal2-input" placeholder="Tên thể loại" type="text" style="display: flex; width: 100%">
            <input autocapitalize="off" name="urlCategoryItem" value="${categoryItem.url}" class="swal2-input" placeholder="url" type="text" style="display: flex; width: 100%">
            <div class="swal2-actions">
                <div class="swal2-loader"></div>
                <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                        style="display: inline-block;">Lưu
                </button>
                <div onclick="closeEditCategoryItem()"
                     class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">Hủy bỏ
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function setUrl(){
        var name = document.getElementsByName('categoryItemName')[0].value;
        document.getElementsByName('urlCategoryItem')[0].value = xoadau(name).toLowerCase()
    }

    const onEditCategoryItem = () => {
        document.getElementById("editCategoryItem").style.display = 'unset';
    }

    function closeEditCategoryItem(){
        document.getElementById("editCategoryItem").style.display = 'none';
    }

    const xoadau = (str) => {
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "a");
        str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "e");
        str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "i");
        str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "o");
        str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "u");
        str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "y");
        str = str.replace(/Đ/g, "d");
        str = str.replace(/ /g, "-");
        return str;
    }
</script>