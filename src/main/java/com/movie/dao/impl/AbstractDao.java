package com.movie.dao.impl;

import com.movie.constant.MethodConstant;
import com.movie.dao.GenegicDao;
import com.movie.entity.Movies;
import com.movie.model.PageModel;
import com.movie.utils.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class AbstractDao<T> implements GenegicDao<T> {
    public static EntityManager em = JpaUtil.getJpaUtil().getEntityManager();

//    @Override
//    protected void finalize() throws Throwable {
//        em.close();
//        super.finalize();
//    }

    @Override
    public int excuteUpdate(T entity, String method) {
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            if (method.equals(MethodConstant.INSERT)) {
                em.persist(entity);
            } else if (method.equals(MethodConstant.UPDATE)) {
                em.merge(entity);
            } else if (method.equals(MethodConstant.DELETE)) {
                em.remove(entity);
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            return 0;
        } finally {
            return 1;
        }
    }

    @Override
    public List<T> excuteQuery(String nameQuery, Class<T> aClass, Object... parameters) {
        TypedQuery<T> query = em.createNamedQuery(nameQuery, aClass);
        if(parameters != null){
            setParameter(query, parameters);
        }
        List<T> list = query.getResultList();
        return list;
    }

    @Override
    public List<T> excuteQuery2(String jpql, Class<T> aClass, Object... parameters) {
        TypedQuery<T> query = em.createQuery(jpql, aClass);
        if(parameters != null){
            setParameter(query, parameters);
        }
        List<T> list = query.getResultList();
        return list;
    }

    public void setParameter(TypedQuery<T> query, Object... parameters){
        try {
            for(int i = 0; i< parameters.length;i++){
                Object parameter = parameters[i];
                if(parameter.getClass() == new PageModel().getClass()){
                    query.setMaxResults(PageModel.getPageModel().getMaxPage());
                    query.setFirstResult((PageModel.getPageModel().getPageIndex() - 1) * PageModel.getPageModel().getMaxPage());
                } else {
                    int index = i + 1;
                    query.setParameter(index, parameter);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

