<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="editSlider" class="swal2-container swal2-center swal2-backdrop-show"
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
        <h2 class="swal2-title" id="swal2-title" style="display: block;">Sửa số thứ tự slider</h2>
        <form method="post" action="<c:url value="/admin/slider/update"/> ">
            <input type="hidden" name="id" value="" id="idSlider">
            <input type="hidden" name="indexOld" value="" id="sliderOld">
            <input autocapitalize="off" id="indexSlider" name="index"class="swal2-input" placeholder="" type="text" style="display: flex;">
            <div class="swal2-actions">
                <div class="swal2-loader"></div>
                <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                        style="display: inline-block;">Lưu
                </button>
                <div onclick="closeEditSlider()"
                     class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">hủy bỏ
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function onEditSlider(id, index){
        document.getElementById('idSlider').value = id;
        document.getElementById('indexSlider').value = index;
        document.getElementById('sliderOld').value = index;
        document.getElementById("editSlider").style.display = 'unset';
    }

    function closeEditSlider(){
        document.getElementById("editSlider").style.display = 'none';
    }
</script>