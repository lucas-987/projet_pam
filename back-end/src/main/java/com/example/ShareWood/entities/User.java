package com.example.ShareWood.entities;

import lombok.*;
import net.bytebuddy.dynamic.loading.InjectionClassLoader;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private Long id;
    private String username;
    private String email;
    private String password;
    private String location;
    private Role role;

    @OneToMany
    @JoinColumn(name = "creator_id")
    private List<Event> created_events;

    @ManyToMany
    private List<Event> saved_events = new ArrayList<>();
}
