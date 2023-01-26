<%@include file="/commont/taglib.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="buyFalse" class="swal2-container swal2-center swal2-backdrop-show"
     style="display: none; overflow-y: auto; text-align: center;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
         class="swal2-popup swal2-modal swal2-icon-warning swal2-show" tabindex="-1" role="dialog"
         aria-live="assertive" aria-modal="true" style="display: grid;">
        <div class="swal2-icon swal2-warning swal2-icon-show" style="display: flex;">
            <div class="swal2-icon-content">!</div>
        </div>
        <h2 class="swal2-title" style="display: block;">Không thành công</h2>
        <div class="swal2-html-container" style="display: block;">Số dư trong tài khoản của bạn không đủ, bạn có muốn
            nạp tiền vào tài khoản!
        </div>
        <div class="swal2-actions">
            <a href="<c:url value="/nap-tien"/> " id="napNgayBuy" class="swal2-confirm swal2-styled swal2-default-outline btn-primary" aria-label=""
                    style="display: inline-block; background-color: rgb(48, 133, 214);">Nạp ngay
            </a>
            <div type="button" class="swal2-cancel swal2-styled swal2-default-outline" aria-label=""
                 style="display: inline-block; background-color: rgb(221, 51, 51);" onclick="cluseByFalse();">
                Hủy bỏ
            </div>
        </div>
    </div>
</div>

