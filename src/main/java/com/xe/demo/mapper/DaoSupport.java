package com.xe.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("daoSupport")
public class DaoSupport implements DAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public  int save(String str, Object obj) {
		return sqlSessionTemplate.insert(str, obj);
	}

	/**
	 * 批量添加
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public  int batchSave(String str, List<?> objs) {
		return sqlSessionTemplate.insert(str, objs);
	}

	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public int update(String str, Object obj) {
		return sqlSessionTemplate.update(str, obj);
	}

	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public int batchUpdate(String str, List<?> objs) {
		SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
		// 批量执行器
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		int succ = 0;
		try {
			if (objs != null) {
				int ret = 0;
				for (int i = 0, size = objs.size(); i < size; i++) {
					ret = sqlSession.update(str, objs.get(i));
					if(ret > 0){
						succ ++;
					}
				}
				sqlSession.flushStatements();
				sqlSession.commit();
				sqlSession.clearCache();
			}
		} finally {
			sqlSession.close();
		}
		return succ;
	}

	/**
	 * 批量删除
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public  int batchDelete(String str, List<?> objs) {
		return sqlSessionTemplate.delete(str, objs);
	}

	/**
	 * 批量删除
	 * @param str
	 * @param ids
	 * @return
	 */
	public int batchDelete(String str, Integer[] ids) {
		return sqlSessionTemplate.delete(str, ids);
	}

	/**
	 * 删除对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public  int delete(String str, Object obj) {
		return sqlSessionTemplate.delete(str, obj);
	}

	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public <T> T findForObject(String str, Object obj) {
		return sqlSessionTemplate.selectOne(str, obj);
	}

	/**
	 * 查找对象集合
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<?> findForList(String str, Object obj) {
		return sqlSessionTemplate.selectList(str, obj);
	}

	@Override
	public Map<?, ?> findForMap(String str, Object obj, String key) {
		return sqlSessionTemplate.selectMap(str, obj, key);
	}

}
