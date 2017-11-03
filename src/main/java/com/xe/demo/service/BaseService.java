package com.xe.demo.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xe.demo.common.pojo.AjaxResult;
import com.xe.demo.common.pojo.PageAjax;
import com.xe.demo.common.pojo.ParamData;
import com.xe.demo.common.utils.AppUtil;
import com.xe.demo.mapper.DaoSupport;

/**
 * 通用接口
 */
@Service
public abstract class BaseService {

    @Autowired
    protected DaoSupport dao;

    /**
     * 通用查询对象
     * @param str
     * @param args
     * @return
     */
    public AjaxResult findForObject(String str, String[] args) {
     	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	Object data = null;
    	if(StringUtils.isEmpty(result)){
    		data = dao.findForObject(str, params);
    	}
    	return AppUtil.returnObj(result, data);
    }

    /**
     * 通用查询列表
     * @param str
     * @param args
     * @return
     */
    public AjaxResult findForList(String str, String[] args) {
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	List<?> list = null;
    	if(StringUtils.isEmpty(result)){
    		list = dao.findForList(str, params);
    	}
    	return AppUtil.returnList(result, list);
    }
    
    /**
     * 通用查询分页
     * @param str
     * @param args
     * @return
     */
    public AjaxResult findForPage(String str, String[] args) {
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	List<?> list = null;
    	if(StringUtils.isEmpty(result)){
    		AppUtil.startPage(params);
    		list = dao.findForList(str, params);
    	}
    	return AppUtil.returnPage(result, list);
    }
    
    @SuppressWarnings("unchecked")
	public <T> PageAjax<T> findPage(String str, String[] args){
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	List<T> list = null;
    	if(StringUtils.isEmpty(result)){
    		AppUtil.startPage(params);
    		list = (List<T>) dao.findForList(str, params);
    	}
    	return new PageAjax<T>(list);
    }
    
    /**
     * 查询指定字段的值
     */
    public Map<?, ?> findForMap(String str, String key) {
    	return dao.findForMap(str, new ParamData(), key);
    }
    
    /**
     * 通用保存
     * @param str
     * @param args
     * @return
     */
    public AjaxResult save(String str, String[] args) {
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	if(StringUtils.isEmpty(result)){
    		int ret = dao.save(str, params);
    		if(ret < 1){
    			result = "添加失败";
    		}
    	}
		return AppUtil.returnObj(result);
    }
    
    /**
     * 通用批量保存
     * @param str
     * @param list
     * @return
     */
    public AjaxResult batchSave(String str, List<?> list) {
    	String result = "添加失败";
    	if(CollectionUtils.isNotEmpty(list)){
        	int ret = dao.batchSave(str, list);
        	if(ret > 0){
        		result = null;
        	}
    	}
    	return AppUtil.returnObj(result);
    }
    
    /**
     * 通用修改
     * @param str
     * @param args
     * @return
     */
    public AjaxResult update(String str, String[] args) {
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	if(StringUtils.isEmpty(result)){
    		int ret = dao.update(str, params);
    		if(ret < 1){
    			result = "修改失败";
    		}
    	}
		return AppUtil.returnObj(result);
    }
    
    /**
     * 通用批量修改
     * @param str
     * @param list
     * @return
     */
    public AjaxResult batchUpdate(String str, List<?> list) {
    	String result = "修改失败";
    	if(CollectionUtils.isNotEmpty(list)){
        	int ret = dao.batchUpdate(str, list);
        	if(ret > 0){
        		result = null;
        	}
    	}
    	return AppUtil.returnObj(result);
    }
    
    /**
     * 通用删除
     * @param str
     * @param args
     * @return
     */
    public AjaxResult delete(String str, String[] args) {
    	ParamData params = new ParamData();
    	//校验参数
    	String result = AppUtil.checkParam(params, args);
    	if(StringUtils.isEmpty(result)){
    		int ret = dao.delete(str, params);
    		if(ret < 1){
    			result = "删除失败";
    		}
    	}
    	return AppUtil.returnObj(result);
    }
    
    /**
     * 通用批量删除
     * @param str
     * @param list
     * @return
     */
    public AjaxResult batchDelete(String str, Integer[] ids) {
    	String result = "删除失败";
    	if(null != ids && ids.length > 0){
    		List<Integer> list = Arrays.asList(ids);
        	int ret = dao.batchDelete(str, list);
        	if(ret > 0){
        		result = null;
        	}
    	}
    	return AppUtil.returnObj(result);
    }
}
