package com.corhuila.base_datos.Entity;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "role_user")
public class RoleUser extends ABaseGeneric {

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "role", nullable = false)
    private Role roleId;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "user", nullable = false)
    private User userId;
}
