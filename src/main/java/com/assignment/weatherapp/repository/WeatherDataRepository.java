package com.assignment.weatherapp.repository;

import com.assignment.weatherapp.model.WeatherData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WeatherDataRepository extends JpaRepository<WeatherData, Long> {
}
