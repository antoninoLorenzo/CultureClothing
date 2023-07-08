package com.culture.model.orders.beans;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "status_types")
@Table()
@NamedQueries({
        @NamedQuery(name = "StatusType.findStatusByName", query = "select s from status_types s where s.status_name = :status_name")
})
@Getter
@Setter
@NoArgsConstructor
@ToString
public class StatusType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long status_id;

    @Column(name = "status_name")
    private String status_name;
}
