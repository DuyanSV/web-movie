<%@include file="/commont/taglib.jsp" %>
>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật thông tin người dùng</title>
</head>
<body>
<br/>
<div class="container">
    <div class="row gutters">
        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                <div class="card-body">
                    <div class="account-settings">
                        <div class="user-profile" style="text-align: center">
                            <div class="user-avatar" style="text-align: center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin"
                                     style="margin-left: 40px">
                            </div>
                            <h5 class="user-name">${user.fullname}</h5>
                            <h6 class="user-email">${user.email}</h6>
                        </div>
                        <div class="about">
                            <h5>About</h5>
                            <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human
                                experiences.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                <div class="card-body">
                    <form method="post">
                        <input type="hidden" value="edit" name="action">
                        <input type="hidden" value="${user.id}" name="id">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Personal Details</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="margin-bottom: 30px">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" name="fullname" class="form-control" value="${user.fullname}" id="fullName" placeholder="Enter full name">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="eMail">Email</label>
                                    <input type="text" name="email" class="form-control" value="${user.email}" id="eMail" placeholder="Enter email ID">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-check">
                                    <input class="form-check-input" value="1"
                                    <c:if test="${user.active == 1}">
                                           checked
                                    </c:if>
                                           type="radio" name="active" id="flexRadioDefault1" >
                                    <label class="form-check-label" for="flexRadioDefault1" >
                                        Active
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" value="0"
                                    <c:if test="${user.active == 0}">
                                           checked
                                    </c:if>
                                           type="radio" name="active" id="flexRadioDefault2">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        In active
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-check">
                                    <input class="form-check-input" value="1"
                                    <c:if test="${user.role == 1}">
                                           checked
                                    </c:if>
                                           type="radio" name="role" id="flexRadioDefault3" >
                                    <label class="form-check-label" for="flexRadioDefault1" >
                                        Admin
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" value="0"
                                    <c:if test="${user.role == 0}">
                                           checked
                                    </c:if>
                                           type="radio" name="role" id="flexRadioDefault4">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        User
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row gutters" style="margin-top: 30px">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <a href="<c:url value="/admin/nguoi-dung"/> " type="button" id="submit1"
                                       name="submit" class="btn btn-secondary">Cancel</a>
                                    <button type="submit" formaction="<c:url value="/admin/nguoi-dung/edit"/>" class="btn btn-primary">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<br/>
<br/>
</body>
</html>
