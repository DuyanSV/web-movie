<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nạp tiền vào tài khoản</title>
</head>
<body>
<section class="blog-details spad">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-8">
                <div class="blog__details__title">
                    <h6>Action, Magic <span>- March 08, 2020</span></h6>
                    <h2>Xin chào: ${USER.fullname}</h2>
                    <div class="blog__details__social" style="text-align: center">
                        <h4 style="color: white;">Nạp tiền vào tài khoản</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <form action="<c:url value="/nap-tien"/>" id="frmCreateOrder" method="post">
                        <input name="ordertype" id="ordertype" value="billpayment" type="hidden">

                    <div class="form-group">
                        <label for="amount" style="color: white">Số tiền</label>
                        <input class="form-control" data-val="true"
                               data-val-number="The field Amount must be a number."
                               data-val-required="The Amount field is required." id="amount" max="100000000" min="1"
                               name="amount" type="number" value=""/>
                    </div>

                    <div class="form-group">
                        <label style="color: white">Nội dung thanh toán</label>
                        <textarea class="form-control" cols="20" id="vnp_OrderInfo" name="vnp_OrderInfo" rows="2" readonly>${USER.email} nap tien!</textarea>
                    </div>
                    <div class="form-group" style="margin-left: 17px">
                        <div class="row">
                            <label style="margin-right: 30px; color: white">Ngân hàng</label>
                            <select name="bankcode" id="bankcode" style="padding-left: 100px" class="form-control">
                                <option value="NCB" selected> Ngan hang NCB</option>
                                <option value="SACOMBANK">Ngan hang SacomBank</option>
                                <option value="EXIMBANK"> Ngan hang EximBank</option>
                                <option value="MSBANK"> Ngan hang MSBANK</option>
                                <option value="NAMABANK"> Ngan hang NamABank</option>
                                <option value="VISA"> Thanh toan qua VISA/MASTER</option>
                                <option value="VNMART"> Vi dien tu VnMart</option>
                                <option value="VIETINBANK">Ngan hang Vietinbank</option>
                                <option value="VIETCOMBANK"> Ngan hang VCB</option>
                                <option value="HDBANK">Ngan hang HDBank</option>
                                <option value="DONGABANK"> Ngan hang Dong A</option>
                                <option value="TPBANK"> Ngân hàng TPBank</option>
                                <option value="OJB"> Ngân hàng OceanBank</option>
                                <option value="BIDV"> Ngân hàng BIDV</option>
                                <option value="TECHCOMBANK"> Ngân hàng Techcombank</option>
                                <option value="VPBANK"> Ngan hang VPBank</option>
                                <option value="AGRIBANK"> Ngan hang Agribank</option>
                                <option value="MBBANK"> Ngan hang MBBank</option>
                                <option value="ACB"> Ngan hang ACB</option>
                                <option value="OCB"> Ngan hang OCB</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 5px">
                        <label for="language" style="margin-right: 30px; color: white">Ngôn ngữ</label>
                        <select name="language" id="language" class="form-control">
                            <option value="vn">Tiếng Việt</option>
                            <option value="en">English</option>
                        </select>
                    </div>
                    <button type="submit" style="margin-top: 50px" class="btn btn-primary">Thanh toán</button>
                </form>
            </div>
        </div>
    </div>
</section>
<script src="<c:url value='/template/web/js/jquery-3.3.1.min.js' />"></script>
<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet"/>
<script src="<c:url value="/template/web/js/vnpay.js" />"></script>
<script type="text/javascript">
    $("#frmCreateOrder").submit(function () {
        var postData = $("#frmCreateOrder").serialize();
        var submitUrl = $("#frmCreateOrder").attr("action");
        $.ajax({
            type: "POST",
            url: submitUrl,
            data: postData,
            dataType: 'JSON',
            success: function (x) {
                if (x.code === '00') {
                    if (window.vnpay) {
                        vnpay.open({width: 768, height: 600, url: x.data});
                        console.log("ok1")
                    } else {
                        window.location.href = x.data;
                        console.log("ok2")
                    }
                    return false;
                } else {
                    alert(x.Message);
                }
            }
        });
        return false;
    });
</script>
</body>
</html>
