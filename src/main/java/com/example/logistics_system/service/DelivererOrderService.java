package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererOrder;
import com.example.logistics_system.dao.DelivererOrderDAO;
import com.example.logistics_system.dao.OrderFormDAO;
import com.example.logistics_system.utils.DelivererOrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class DelivererOrderService
{
    @Autowired
    private OrderFormDAO orderFormDAO;

    @Autowired
    private DelivererOrderDAO delivererOrderDAO;

    public boolean requestOrderService(Deliverer deliverer, int id)
    {
        if (delivererOrderDAO.findByDelivererIdAndOrderFormId(deliverer.getId(), id) != null)
            return false;
        DelivererOrder delivererOrder = new DelivererOrder();
        delivererOrder.setDelivererId(deliverer.getId());
        delivererOrder.setOrderFormId(id);
        delivererOrder.setState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST);
        delivererOrderDAO.save(delivererOrder);
        return true;
    }

    public boolean refuseOrderService(Deliverer deliverer, int id)
    {
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererIdAndOrderFormId(deliverer.getId(), id);
        if (delivererOrder == null)
            return false;
        delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        delivererOrderDAO.save(delivererOrder);
        return true;
    }

    public void acceptOrderService(Deliverer deliverer, int id)
    {
        Set<DelivererOrder> delivererOrders = delivererOrderDAO.findAllByOrderFormId(id);
        for (DelivererOrder delivererOrder : delivererOrders)
            delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        delivererOrderDAO.saveAll(delivererOrders);
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererIdAndOrderFormId(deliverer.getId(), id);
        delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_ACCEPT);
        delivererOrderDAO.save(delivererOrder);
    }

    public Page<DelivererOrder> getDelivererService(Deliverer deliverer, int state, int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        switch (state)
        {
            case DelivererOrderUtil.ORDER_ALL:
                return delivererOrderDAO.findAllByDelivererId(deliverer.getId(), pageable);
            default:
                return delivererOrderDAO.findAllByDelivererIdAndState(deliverer.getId(), state, pageable);
        }
    }

    public Page<DelivererOrder> getDelivererRequest(int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        return delivererOrderDAO.findAllByState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
    }
}
