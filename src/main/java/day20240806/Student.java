package day20240806;

import lombok.Setter;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/8/6 11:06
 */


public class Student {

    //state
    String newName;
    int age;

    //constructor
    public Student() {
    }

    public Student(String name) {
        this.newName = name;
    }

    public Student(int age) {
        this.age = age;
    }

    public Student(String name, int age) {
        this.newName = name;
        this.age = age;
    }

    //behavior
    public String getNewName() {
        return newName;
    }

    public void setNewName(String name) {
        this.newName = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
