package com.example.logistics_system.service;

import com.example.logistics_system.bean.DelivererOrder;
import com.example.logistics_system.dao.DelivererOrderDAO;
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
    private DelivererOrderDAO delivererOrderDAO;

    public boolean requestOrderService(int delivererId, int orderFormId)
    {
        if (delivererOrderDAO.findByDelivererIdAndOrderFormId(delivererId, orderFormId) != null)
            return false;
        DelivererOrder delivererOrder = new DelivererOrder();
        delivererOrder.setDelivererId(delivererId);
        delivererOrder.setOrderFormId(orderFormId);
        delivererOrder.setState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST);
        delivererOrderDAO.save(delivererOrder);
        return true;
    }

    public boolean refuseOrderService(int delivererId, int orderFormId)
    {
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererIdAndOrderFormId(delivererId, orderFormId);
        if (delivererOrder == null)
            return false;
        delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        delivererOrderDAO.save(delivererOrder);
        delivererOrderDAO.findAllByOrderFormIdAndState(orderFormId, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, null);
        return true;
    }

    public void acceptOrderService(int delivererId, int orderFormId)
    {
        Set<DelivererOrder> delivererOrders = delivererOrderDAO.findAllByOrderFormId(orderFormId);
        for (DelivererOrder delivererOrder : delivererOrders)
            delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        delivererOrderDAO.saveAll(delivererOrders);
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererIdAndOrderFormId(delivererId, orderFormId);
        delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_ACCEPT);
        delivererOrderDAO.save(delivererOrder);
    }

    public Page<DelivererOrder> getDelivererService(int delivererId, int state, int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        switch (state)
        {
            case DelivererOrderUtil.ORDER_ALL:
                return delivererOrderDAO.findAllByDelivererId(delivererId, pageable);
            default:
                return delivererOrderDAO.findAllByDelivererIdAndState(delivererId, state, pageable);
        }
    }

    public Page<DelivererOrder> getDelivererRequestService(int delivererId, int orderFormId, int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        if (delivererId != 0 && orderFormId != 0)
            return delivererOrderDAO.findAllByDelivererIdAndOrderFormIdAndState(delivererId, orderFormId, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        else if (delivererId != 0)
            return delivererOrderDAO.findAllByDelivererIdAndState(delivererId, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        else if (orderFormId != 0)
            return delivererOrderDAO.findAllByOrderFormIdAndState(orderFormId, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        return delivererOrderDAO.findAllByState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
    }
}
