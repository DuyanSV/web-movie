<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="addEpisode" class="swal2-container swal2-center swal2-backdrop-show"
     style="overflow-y: auto;
     <c:if test="${onAddEpisode == null}">
             display: none
     </c:if>
     <c:if test="${onAddEpisode != null}">
             display: unset;
     </c:if>
             ">
  <div aria-labelledby="swal2-title" aria-describedby="swal2-html-container"
       class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive"
       aria-modal="true" style="display: grid;">
    <h2 class="swal2-title" id="swal2-title" style="display: block;">Thêm tập phim</h2>
    <form method="post" action="<c:url value="/admin/phim/add_episode"/> " style="width: 400px">
      <input type="hidden" id="movieId" name="movieId">
      <input autocapitalize="off" required name="episode" value="${categoryItemName}" class="swal2-input" placeholder="Số tập" type="number" min="1" style="display: flex; width: 100%">
      <input autocapitalize="off" required name="url" value="${urlCategoryItem}" class="swal2-input" placeholder="url" type="text" style="display: flex; width: 100%">
      <div class="swal2-actions">
        <div class="swal2-loader"></div>
        <button type="submit" class="swal2-confirm swal2-styled" aria-label=""
                style="display: inline-block;">Thêm
        </button>
        <div onclick="closeAddEpisode()"
             class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;">Hủy bỏ
        </div>
      </div>
    </form>
  </div>
</div>

<script>

  const onAddEpisode = (id) => {
    document.getElementById('movieId').value = id;
      console.log(id)
    document.getElementById("addEpisode").style.display = 'unset';
  }

  function closeAddEpisode(){
    document.getElementById("addEpisode").style.display = 'none';
  }

</script>