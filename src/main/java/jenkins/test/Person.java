/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jenkins.test;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author MPHSlaats <mark.slaats4@gmail.com>
 */
@Getter
@Setter
public class Person {

    private Integer id;
    private String name;

    public Person(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
