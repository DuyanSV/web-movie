<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commont/taglib.jsp"%>
<div id="addSliderDone" class="swal2-container swal2-center swal2-backdrop-show" style="overflow-y: auto;
display: none;
        ">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-content"
         class="swal2-popup swal2-modal swal2-icon-success swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: flex;">
        <div class="swal2-header">
            <div class="swal2-icon swal2-success swal2-icon-show" style="display: flex;">
                <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);">
                </div>
                <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>
                <div class="swal2-success-ring"></div>
                <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
                <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
            </div>
            <h2 class="swal2-title" id="swal2-title" style="display: flex;">Thêm thành công vào slider</h2>
        </div>
        <div class="swal2-actions">
            <button onclick="closeDoneSlider()" class="swal2-confirm swal2-styled" aria-label=""
                    style="display: inline-block;">OK
            </button>
        </div>
    </div>
</div>

<script>
    function closeDoneSlider() {
        document.getElementById("addSliderDone").style.display = 'none';
    }
</script>