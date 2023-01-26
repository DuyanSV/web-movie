<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới phim</title>
</head>
<body>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen}">
    <div class="flex flex-col flex-1 w-full">
        <div class="container px-6 mx-auto grid">
            <br/>
            <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                Thêm mới phim
            </h4>
            <form method="post" action="<c:url value="/admin/phim/add"/>" enctype="multipart/form-data">
            <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
                <div class="row">
                    <div class="col-lg-7">
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Tên phim</span>
                            <input name="name" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="Tên phim"/>
                        </label>
                        <br/>
                        <span class="text-gray-700 dark:text-gray-400">Trạng thái</span>
                        <div class="mt-2">
                            <label class="inline-flex items-center text-gray-600 dark:text-gray-400">
                                <input type="radio"
                                       class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                       name="active"
                                       value="1" checked/>
                                <span class="ml-2">Active</span>
                            </label>
                            <label class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400">
                                <input type="radio"
                                       class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                       name="active"
                                       value="0"/>
                                <span class="ml-2">Inactive</span>
                            </label>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-6">
                                <span class="text-gray-700 dark:text-gray-400">Loại phim</span>
                                <div class="mt-2">
                                    <label class="inline-flex items-center text-gray-600 dark:text-gray-400" onclick="onVip()">
                                        <input type="radio"
                                               class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                               name="vip"
                                               value="1"
                                                <c:if test="${movie.vip == 1}" >
                                                    checked
                                                </c:if>
                                        />
                                        <span class="ml-2">VIP</span>
                                    </label>
                                    <label class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400" onclick="closeVip()">
                                        <input type="radio"
                                               class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                               name="vip"
                                               value="0"
                                                <c:if test="${movie.vip == 0}" >
                                                    checked
                                                </c:if>
                                        />
                                        <span class="ml-2">Thường</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Giá phim</span>
                                    <input type="number" min="1" name="price" id="priceMovie" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                           value="${movie.price}"
                                           placeholder="Giá phim"/>
                                </label>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Thời lượng / Tập (Phút)</span>
                                    <input type="text" name="duration" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                           placeholder="Thời lượng"/>
                                </label>
                            </div>
                            <div class="col-lg-6">
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Số tập</span>
                                    <input type="text" name="quality" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                           placeholder="Số tập"/>
                                </label>
                            </div>
                        </div>
                        <br/>
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Ngày phát sóng</span>
                            <input name="dateAired1" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   placeholder="Ngày phát sóng" type="date"/>
                        </label>

                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Diễn viên</span>
                            <textarea name="actor"
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                    rows="3"
                                    placeholder="Danh sách diễn viên"
                            ></textarea>
                        </label>

                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Thể loại</span>
                            <textarea id="valueTheLoai" readonly
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                    rows="3"
                                    placeholder="Danh sách thể loại"
                            ></textarea>
                            <input type="hidden" name="theLoaiOut" value="">
                            <br/>
                            <div class="row">
                                <div class="col-lg-7">
                                    <select class="form-select float-right" id="selectTL"
                                            aria-label="Default select example">
                                        <c:forEach var="categoryitem" items="${categoryItem}">
                                            <option name="optionCategory" value="${categoryitem.categoryName}|${categoryitem.url}">${categoryitem.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-5">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="btn btn-primary" onclick="addTheLoai()">Thêm</div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="btn btn-primary" onclick="resetValueTheLoai()">Tạo mới</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </div>
                    <div class="col-lg-5">
                        <span class="text-gray-700 dark:text-gray-400">Banner (Ngang)</span>
                        <input type="file" id="upload1" name="banner" accept=".jpg, .png" style="display: none;">
                        <img id="imgChon1" src="<c:url value="/images/chonfile.png" />" alt=""
                             onclick="document.getElementById('upload1').click()">
                        <br/>
                        <span class="text-gray-700 dark:text-gray-400">Hình ảnh nhỏ (Dọc)</span>
                        <input type="file" id="upload2" name="thumbnail" accept=".jpg, .png" style="display: none;">
                        <img id="imgChon2" src="<c:url value="/images/chonfile.png" />" alt=""
                             onclick="document.getElementById('upload2').click()">
                    </div>
                </div>
                <br/>
                <span class="text-gray-700 dark:text-gray-400">Mô tả ngắn</span>
                <textarea id="motaNgan" name="descreption"
                          class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                          rows="3"
                          placeholder="Mô tả"
                ></textarea>
                <br/>
                <button type="submit" id="submitFormAddPhim" style="display: none" class="flex items-center justify-between px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Lưu phim 1
                    <span class="ml-2" aria-hidden="true">+</span>
                </button>
                <div id="validateAddPhim" style="width: 200px" class="flex items-center justify-between px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Lưu phim
                    <span class="ml-2" aria-hidden="true">+</span>
                </div>
            </div>
            </form>
            <!-- Validation inputs -->
        </div>
    </div>
</div>
<script>
    var file1 = document.getElementById("upload1");
    file1.addEventListener("change", function () {
        let url = URL.createObjectURL(file1.files[0]);
        console.log(url);
        document.getElementById('imgChon1').src = url
    }, false);

    var file2 = document.getElementById("upload2");
    file2.addEventListener("change", function () {
        let url = URL.createObjectURL(file2.files[0]);
        document.getElementById('imgChon2').src = url
    }, false);

    function resetValueTheLoai(){
        document.getElementById('valueTheLoai').value = '';
        document.getElementsByName('theLoaiOut')[0].value = '';
        var optionCate = document.getElementsByName('optionCategory')
        for(var i = 0; i< optionCate.length;i++){
            document.getElementsByName('optionCategory')[i].style.display = 'unset';
        }
    }

    function addTheLoai(){
        var text = document.getElementById('valueTheLoai').value;
        var optionCate = document.getElementsByName('optionCategory');
        var tl = document.getElementsByName('theLoaiOut')[0].value;
        var newTl = document.getElementById('selectTL').value;
        var last = newTl.lastIndexOf('|');
        console.log(tl.lastIndexOf(newTl.substring(last+1, newTl.length)))
        if(tl.lastIndexOf(newTl.substring(last+1, newTl.length)) == -1){
            for(var i = 0; i< optionCate.length;i++){
                if(optionCate[i].value == document.getElementById('selectTL').value){
                    document.getElementsByName('optionCategory')[i].style.display = 'none';
                }
            }
            document.getElementById('valueTheLoai').value = text + newTl.substring(0,last) + '\n';
            document.getElementsByName('theLoaiOut')[0].value = tl + "','" + newTl.substring(last+1, newTl.length);
        }
    }
</script>
<script src="<c:url value="/template/validate/validateAddPhim.js"/> "></script>
</body>
</html>
