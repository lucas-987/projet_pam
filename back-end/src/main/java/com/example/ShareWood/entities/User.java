package com.example.ShareWood.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
    @Column(unique = true)
    private String username;
    @Column(unique = true)
    private String email;
    private String password;
    private String location;
    private Role role;

    @OneToMany
    @JoinColumn(name = "creator_id")
    @JsonIgnore()
    private List<Event> created_events;

    @ManyToMany
    @JsonIgnore()
    private List<Event> saved_events = new ArrayList<>();
}
