package com.movie.model;

public class PageModel {
    public static PageModel pageModel = null;

    public static PageModel getPageModel(){
        if(pageModel == null){
            return pageModel = new PageModel();
        } else {
            return pageModel;
        }
    }

    public int maxPage;
    public int pageIndex;

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    @Override
    public String toString() {
        return "PageModel{" +
                "maxPage=" + maxPage +
                ", pageIndex=" + pageIndex +
                '}';
    }
}
