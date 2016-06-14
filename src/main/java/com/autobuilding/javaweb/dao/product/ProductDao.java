package com.autobuilding.javaweb.dao.product;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * 商品数据访问
 *
 * @author harry
 */
public interface ProductDao {

    /**
     * 获取商品信息
     *
     * @param id 商品主键 ID
     *
     * @return 商品实体 Map
     */
    public Map<String, Object> get(@Param("id")Long id);

    /**
     * 删除商品
     *
     * @param id 商品主键 ID
     */
    public void delete(@Param("id")Long id);

   
    /**
     * 更新商品
     *
     * @param entity 商品实体 Map
     */
    public void update(@Param("entity")Map<String,Object> entity);

    /**
     * 新增商品
     *
     * @param entity 商品实体 Map
     */
    public void insert(@Param("entity")Map<String,Object> entity);

    /**
     * 统计商品
     *
     * @param filter 查询条件
     *
     * @return 统计商品总数
     */
    public long count(@Param("filter")Map<String,Object> filter);

    /**
     * 查询商品
     *
     * @param filter 查询条件
     *
     * @return 商品实体 Map集合
     */
    public List<Map<String, Object>> find(@Param("filter")Map<String, Object> filter);
}
