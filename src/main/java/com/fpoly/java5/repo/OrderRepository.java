package com.fpoly.java5.repo;

import com.fpoly.java5.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}