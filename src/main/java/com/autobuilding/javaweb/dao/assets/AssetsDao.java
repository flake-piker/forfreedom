package com.autobuilding.javaweb.dao.assets;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * 资产数据访问
 *
 * @author harry
 */
public interface AssetsDao {

    /**
     * 获取资产信息
     *
     * @param id 资产主键 ID
     *
     * @return 资产实体 Map
     */
    public Map<String, Object> get(@Param("id")Long id);

    /**
     * 删除资产
     *
     * @param id 资产主键 ID
     */
    public void delete(@Param("id")Long id);

   
    /**
     * 更新资产
     *
     * @param entity 资产实体 Map
     */
    public void update(@Param("entity")Map<String,Object> entity);

    /**
     * 新增资产
     *
     * @param entity 资产实体 Map
     */
    public void insert(@Param("entity")Map<String,Object> entity);

    /**
     * 统计资产
     *
     * @param filter 查询条件
     *
     * @return 统计资产总数
     */
    public long count(@Param("filter")Map<String,Object> filter);

    /**
     * 查询资产
     *
     * @param filter 查询条件
     *
     * @return 资产实体 Map集合
     */
    public List<Map<String, Object>> find(@Param("filter")Map<String, Object> filter);
}
