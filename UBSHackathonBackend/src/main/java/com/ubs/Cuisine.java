package com.ubs;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.Objects;

@RequiredArgsConstructor
@Data
public class Cuisine {
    private final String id;
    private final String name;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cuisine cuisine = (Cuisine) o;
        return name.equals(cuisine.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
