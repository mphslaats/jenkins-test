/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jenkins.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author MPHSlaats <mark.slaats4@gmail.com>
 */
public class PersonTest {

    public PersonTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void personTest() {
        Integer id = 1;
        Integer id2 = 2;
        String name = "name";
        String name2 = "name2";

        // Create person
        Person person = new Person(id, name);

        // Test getters
        Assert.assertEquals(id, person.getId());
        Assert.assertEquals(name, person.getName());

        // Test setters
        person.setId(id2);
        person.setName(name2);
        Assert.assertEquals(id2, person.getId());
        Assert.assertEquals(name2, person.getName());
    }
}
