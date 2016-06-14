package com.autobuilding.javaweb.dao.order;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * 订单数据访问
 *
 * @author harry
 */
public interface OrderDao {

    /**
     * 获取订单信息
     *
     * @param id 订单主键 ID
     *
     * @return 订单实体 Map
     */
    public Map<String, Object> get(@Param("id")Long id);

    /**
     * 删除订单
     *
     * @param id 订单主键 ID
     */
    public void delete(@Param("id")Long id);

   
    /**
     * 更新订单
     *
     * @param entity 订单实体 Map
     */
    public void update(@Param("entity")Map<String,Object> entity);

    /**
     * 新增订单
     *
     * @param entity 订单实体 Map
     */
    public void insert(@Param("entity")Map<String,Object> entity);

    /**
     * 统计订单
     *
     * @param filter 查询条件
     *
     * @return 统计订单总数
     */
    public long count(@Param("filter")Map<String,Object> filter);

    /**
     * 查询订单
     *
     * @param filter 查询条件
     *
     * @return 订单实体 Map集合
     */
    public List<Map<String, Object>> find(@Param("filter")Map<String, Object> filter);
}
