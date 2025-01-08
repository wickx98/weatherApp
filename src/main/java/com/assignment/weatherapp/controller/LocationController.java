package com.assignment.weatherapp.controller;

import com.assignment.weatherapp.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.assignment.weatherapp.model.Location;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/locations")
public class LocationController {

    @Autowired
    private LocationService service;

    @GetMapping("/{id}")
    public Optional<Location> getLocation(@PathVariable Long id){
        return service.getLocations(id);
    }
    @GetMapping
    public List<Location> getAllLocations() {
        return service.getAllLocations();
    }

    @PostMapping
    public Location createLocation(@RequestBody Location location) {
        return service.saveLocation(location);
    }

    @DeleteMapping("/{id}")
    public void deleteLocation(@PathVariable Long id) {
        service.deleteLocation(id);
    }
}
