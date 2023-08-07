package org.example.model;

import java.util.ArrayList;

public class Animal {
    protected int id;
    protected String name;
    protected ArrayList<String> commands;
    protected String birthday;

    public Animal(int id, String name, String birthday){
        setId(id);
        setName(name);
        setBirthday(birthday);
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public ArrayList<String> getCommands() {
        return commands;
    }

    public String getBirthday() {
        return birthday;
    }

    protected void setId(int id) {
        this.id = id;
    }

    protected void setName(String name) {
        this.name = name;
    }

    protected void setCommands(String command) {
        this.commands.add(command);
    }

    protected void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}
