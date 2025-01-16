package com.assignment.weatherapp.controller;

import com.assignment.weatherapp.exception.ResourceNotFoundException;
import com.assignment.weatherapp.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.assignment.weatherapp.model.Location;

import java.util.List;

@RestController
@RequestMapping("/api/locations")
public class LocationController {

    @Autowired
    private LocationService service;

    @GetMapping("/{id}")
    public ResponseEntity<Location> getLocation(@PathVariable Long id) {
        Location location = service.getLocations(id)
                .orElseThrow(() -> new ResourceNotFoundException("Location not found with ID: " + id));
        return ResponseEntity.ok(location);
    }

    @GetMapping
    public List<Location> getAllLocations() {
        return service.getAllLocations();
    }

    @PostMapping
    public Location createLocation(@RequestBody Location location) {
        return service.saveLocation(location);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Location> updateLocation(@PathVariable Long id, @RequestBody Location location) {
        service.getLocations(id).orElseThrow(() -> new ResourceNotFoundException("Location not found with ID: " + id));
        Location updatedLocation = service.updateLocation(id, location);

        return ResponseEntity.ok(updatedLocation);
    }
    @DeleteMapping("/{id}")
    public void deleteLocation(@PathVariable Long id) {
        service.getLocations(id).orElseThrow(() -> new ResourceNotFoundException("Location not found with ID: " + id));
        service.deleteLocation(id);
    }


}
