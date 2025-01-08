package com.assignment.weatherapp.scheduler;

import com.assignment.weatherapp.model.Location;
import com.assignment.weatherapp.model.WeatherData;
import com.assignment.weatherapp.service.WeatherService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.assignment.weatherapp.service.LocationService;

import java.util.List;


@Component
public class WeatherScheduler {

    @Autowired
    private LocationService locationService;

    @Autowired
    private WeatherService weatherService;


    @Value("${weather.api.url}")
    private String apiUrl;

    @Value("${weather.api.key}")
    private String apiKey;

    @Value("${weather.fixedRate}")
    private long fixedRate;


    @Scheduled(fixedRateString = "${weather.fixedRate}")
    public void fetchWeatherData() {
        List<Location> locations = locationService.getAllLocations();
        for (Location location : locations) {

            // Build the URL with lat, lon, and API key
            String url = apiUrl.replace("{lat}", String.valueOf(location.getLatitude()))
                    .replace("{lon}", String.valueOf(location.getLongitude()))
                    .replace("{apiKey}", apiKey);
            System.out.println(url);
            // Fetch the weather data from OpenWeatherMap API
            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(url, String.class);

            if (response != null) {
                JSONObject responseObject = new JSONObject(response);

                String locationName = responseObject.getString("name");
                JSONArray weatherArray = responseObject.getJSONArray("weather");
                String mainWeather = weatherArray.getJSONObject(0).getString("main");
                String description = weatherArray.getJSONObject(0).getString("description");

                JSONObject mainData = responseObject.getJSONObject("main");
                double temperature = mainData.getDouble("temp");
                double feelsLike = mainData.getDouble("feels_like");
                double tempMin = mainData.getDouble("temp_min");
                double tempMax = mainData.getDouble("temp_max");
                int pressure = mainData.getInt("pressure");
                int humidity = mainData.getInt("humidity");
                int seaLevel = mainData.optInt("sea_level", 0);
                int groundLevel = mainData.optInt("grnd_level", 0);
                long timestamp = System.currentTimeMillis();

                // Create the WeatherData object
                WeatherData weatherData = new WeatherData();
                weatherData.setLocationName(locationName);
                weatherData.setMainWeather(mainWeather);
                weatherData.setDescription(description);
                weatherData.setTemperature(temperature);
                weatherData.setFeelsLike(feelsLike);
                weatherData.setTempMin(tempMin);
                weatherData.setTempMax(tempMax);
                weatherData.setPressure(pressure);
                weatherData.setHumidity(humidity);
                weatherData.setSeaLevel(seaLevel);
                weatherData.setGroundLevel(groundLevel);
                weatherData.setTimestamp(timestamp);

                weatherService.saveWeatherData(weatherData);




            }
        }
    }
}
