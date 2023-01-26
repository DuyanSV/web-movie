
<%@include file="/commont/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="errorSliderAdd" class="swal2-container swal2-center swal2-backdrop-show" style="display: none;overflow-y: auto;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-content"
         class="swal2-popup swal2-modal swal2-icon-error swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: flex;">
        <div class="swal2-header">
            <div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;"><span class="swal2-x-mark">
                            <span class="swal2-x-mark-line-left"></span>
                            <span class="swal2-x-mark-line-right"></span>
                        </span>
            </div>
            <h2 class="swal2-title" id="swal2-title" style="display: flex;">Bộ phim này đã có trên slider rồi!</h2>
        </div>

        <div class="swal2-actions">
            <div class="swal2-loader"></div>
            <button type="button" class="swal2-confirm swal2-styled" onclick="closeAlertSlider()" aria-label=""
                    style="display: inline-block;">OK
            </button>
        </div>
    </div>
</div>

<script>
    function closeAlertSlider() {
        document.getElementById("errorSliderAdd").style.display = 'none';
    }
</script>