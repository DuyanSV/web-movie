package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.IMovieDao;
import com.movie.entity.CategoryItem;
import com.movie.entity.Movies;
import com.movie.model.PageModel;

import javax.persistence.StoredProcedureQuery;
import java.util.List;

public class MovieDao extends AbstractDao<Movies> implements IMovieDao {
    @Override
    public void update(Movies movies) {
        excuteUpdate(movies, MethodConstant.UPDATE);
    }

    @Override
    public void insert(Movies movies) {
        excuteUpdate(movies, MethodConstant.INSERT);
    }

    @Override
    public void delete(Movies movies) {
        excuteUpdate(movies, MethodConstant.DELETE);
    }

    @Override
    public List<Movies> findByCategoryAndPage(String url, PageModel pageModel) {
        List<Movies> list = excuteQuery("findMovieByCategory",Movies.class,url , pageModel);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findByCategory(String url) {
        List<Movies> list = excuteQuery("findMovieByCategory",Movies.class,url);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findByKeyword(String keyword) {
        List<Movies> list = excuteQuery("findMovieByKeyword",Movies.class,keyword);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findByKeywordAndPage(String keyword, PageModel pageModel) {
        List<Movies> list = excuteQuery("findMovieByKeyword",Movies.class,keyword , pageModel);
        return list.isEmpty() ? null : list;
    }

    @Override
    public Movies findById(int id) {
        List<Movies> list = excuteQuery("findMovieById",Movies.class,id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Movies findMovieVipByUser(int userId, int movieId) {
        List<Movies> list = excuteQuery("findMovieVipByUser",Movies.class,userId, movieId);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Movies findMovieByProperties(String name, String thumbnail, String banner, String actor) {
        List<Movies> list = excuteQuery("findMovieByProperties",Movies.class,name, thumbnail, banner, actor);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Movies> findBySlider() {
        List<Movies> list = excuteQuery("findMovieBySlider",Movies.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findMovieTopLike() {
        PageModel.getPageModel().setMaxPage(6);
        PageModel.getPageModel().setPageIndex(1);
        List<Movies> list = excuteQuery("findMovieTopLike",Movies.class, PageModel.getPageModel());
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findAll() {
        List<Movies> list = excuteQuery("findAllMovie",Movies.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findTopView() {
        PageModel.getPageModel().setMaxPage(5);
        PageModel.getPageModel().setPageIndex(1);
        List<Movies> list = excuteQuery("findMovieTopView",Movies.class , PageModel.getPageModel());
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findMovieNew() {
        PageModel.getPageModel().setMaxPage(6);
        PageModel.getPageModel().setPageIndex(1);
        List<Movies> list = excuteQuery("findMovieNew",Movies.class, PageModel.getPageModel());
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findMovieRelated(String url, int id) {
        PageModel.getPageModel().setMaxPage(4);
        PageModel.getPageModel().setPageIndex(1);
        List<Movies> list = excuteQuery("findMovieRelated",Movies.class,url, id , PageModel.getPageModel());
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findMovieHis(String his) {
        String jqpl = "select o from Movies o where o.id in ("+his+")";
        List<Movies> list = excuteQuery2(jqpl, Movies.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> findMovieByUserLike(int id, PageModel pageModel) {
        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("findMovieByUserLike");
        query.setParameter("userId", Integer.valueOf(id));
        List<Movies> list = query.getResultList();
        for(Movies movies : list){
            System.out.println(movies.toString());
        }
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Movies> countMovieByUserLike(int id) {
        List<Movies> list = excuteQuery("findMovieByUserLike",Movies.class,id);
        return list.isEmpty() ? null : list;
    }
}
