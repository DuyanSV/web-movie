<%@include file="/commont/taglib.jsp" %>
>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách tập phim</title>
</head>
<body>
<%@include file="/component/admin/addEpisode.jsp"%>
<div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen}">
    <div class="flex flex-col flex-1 w-full">
        <div class="container grid px-6 mx-auto">
            <br/>
            <div class="row">
                <div class="col-lg-10">
                    <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                        Danh sách tập phim
                    </h4>
                </div>
                <div class="col-lg-2 float-right">
                    <div onclick="onAddEpisode(document.getElementById('movieIdAddEpisode').value);" class="btn btn-primary">Thêm tập</div>
                </div>
            </div>
            <input type="hidden" id="movieIdAddEpisode" value="${movieId}">
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto table-responsive" style="padding: 15px;">
                    <table class="w-full whitespace-no-wrap" id="dataTable" width="100vw" cellspacing="0">
                        <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                            <th class="px-4 py-3">Số tập</th>
                            <th class="px-4 py-3">Url</th>
                            <th class="px-4 py-3">Hành động</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                        <c:forEach var="movieDetail" items="${movieDetails}">
                            <tr class="text-gray-700 dark:text-gray-400" style="height: 100px;">
                                <td class="px-4 py-3 text-sm" style="padding: 0; width: 50px">
                                        ${movieDetail.episode}
                                </td>
                                <td style="padding: 0; width: 200px">
                                    <p>${movieDetail.url}</p>
                                </td>
                                <td class="px-4 py-3" style="padding: 0;">
                                    <div class="flex items-center space-x-4 text-sm">
                                        <a href="<c:url value="/admin/nguoi-dung/edit?id=${userItem.id}"/> "
                                           data-toggle="tooltip" title="Chỉnh sửa phim"
                                           class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                           aria-label="Edit">
                                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                 viewBox="0 0 20 20">
                                                <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z">
                                                </path>
                                            </svg>
                                        </a>
                                        <div onclick="showComfirmAlert(${userItem.id})"
                                             class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                             aria-label="Delete">
                                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                 viewBox="0 0 20 20">
                                                <path fill-rule="evenodd"
                                                      d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                      clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
