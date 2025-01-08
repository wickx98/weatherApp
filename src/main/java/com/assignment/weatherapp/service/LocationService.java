package com.assignment.weatherapp.service;

import com.assignment.weatherapp.model.Location;
import com.assignment.weatherapp.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LocationService {

    @Autowired
    private LocationRepository repository;

    public List<Location> getAllLocations() {
        return repository.findAll();
    }

    public Location saveLocation(Location location) {
        return repository.save(location);
    }

    public Optional<Location> getLocations(Long id){
        return repository.findById(id);
    }
    public void deleteLocation(Long id) {
        repository.deleteById(id);
    }

    public Location updateLocation(Long id, Location location) {
        Optional<Location> existingLocationOpt = repository.findById(id);

        if (existingLocationOpt.isPresent()) {
            Location existingLocation = existingLocationOpt.get();

            existingLocation.setName(location.getName());
            existingLocation.setLatitude(location.getLatitude());
            existingLocation.setLongitude(location.getLongitude());

            return repository.save(existingLocation);
        }

        return null;
    }
}
