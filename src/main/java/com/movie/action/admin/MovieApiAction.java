package com.movie.action.admin;

import com.movie.entity.CategoryItem;
import com.movie.entity.CategoryItemMovie;
import com.movie.entity.MovieDetail;
import com.movie.entity.Movies;
import com.movie.model.CategoryItemApiModel;
import com.movie.model.MovieApiModel;
import com.movie.model.MovieDetailApiModel;
import com.movie.service.ICategoryItemMovieService;
import com.movie.service.ICategoryItemService;
import com.movie.service.IMovieDetailService;
import com.movie.service.impl.MovieService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class MovieApiAction {
    @Inject
    private MovieService movieService;

    @Inject
    private ICategoryItemService categoryItemService;

    @Inject
    private ICategoryItemMovieService categoryItemMovieService;

    @Inject
    private IMovieDetailService movieDetailService;

    public void addMovie(MovieApiModel movieApiModel) {
        Movies movies = new Movies(movieApiModel.getName(), movieApiModel.getThumbnail(), movieApiModel.getBanner(), movieApiModel.getViews(), movieApiModel.getDescreption(), movieApiModel.getDuration(), movieApiModel.getActive(), movieApiModel.getDateAired(), movieApiModel.getQuality(), movieApiModel.getCreateBy(), movieApiModel.getCreateDate(), movieApiModel.getActor());
        movieService.insert(movies);
        Movies moviesNew = movieService.findMovieByProperties(movies.getName(), movies.getThumbnail(), movies.getBanner(), movies.getActor());

        List<MovieDetailApiModel> movieDetailApiModels = movieApiModel.getMovieDetail();
        if(movieDetailApiModels != null){
            for(MovieDetailApiModel detail : movieDetailApiModels ){
                movieDetailService.insert(new MovieDetail(moviesNew, detail.getEpisode(), detail.getUrl()));
            }
        }

        StringBuilder urlCategory = new StringBuilder();
        movieApiModel.getCategoryItem().forEach((categoryItem) -> {
            urlCategory.append("'" + categoryItem.getUrl() + "',");
        });
        String urlAdd = urlCategory.substring(0, urlCategory.toString().length() - 1);
        List<CategoryItem> categoryItemList = categoryItemService.findCategoryItemByUrlList(urlAdd);
        for(CategoryItem categoryItem : categoryItemList){
            CategoryItemMovie categoryItemMovie = new CategoryItemMovie(categoryItem, moviesNew);
            categoryItemMovieService.insert(categoryItemMovie);
        }
    }
}
