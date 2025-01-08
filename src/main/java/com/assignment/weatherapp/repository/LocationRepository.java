package com.assignment.weatherapp.repository;

import com.assignment.weatherapp.model.Location;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationRepository extends JpaRepository<Location, Long> {
}
