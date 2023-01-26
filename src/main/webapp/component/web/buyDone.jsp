<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/7/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="buyDone" class="swal2-container swal2-center swal2-backdrop-show" style="overflow-y: auto;display: none;">
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
            <h2 class="swal2-title" style="display: flex;">Mua thành công, chúc bạn xem phim vui vẻ!</h2>
        </div>
        <div class="swal2-actions">
            <button onclick="closeByDone()" class="swal2-confirm swal2-styled" aria-label=""
                    style="display: inline-block;">OK
            </button>
        </div>
    </div>
</div>
