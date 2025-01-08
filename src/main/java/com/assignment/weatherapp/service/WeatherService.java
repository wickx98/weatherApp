package com.assignment.weatherapp.service;

import com.assignment.weatherapp.model.WeatherData;
import com.assignment.weatherapp.repository.WeatherDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeatherService {

    @Autowired
    private WeatherDataRepository weatherDataRepository;

    public WeatherData saveWeatherData(WeatherData weatherData) {
        return weatherDataRepository.save(weatherData);
    }


}
