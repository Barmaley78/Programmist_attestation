package org.example.model;

public class Counter implements AutoCloseable{
    protected int id;

    public Counter(){
        this.id = 0;
    }

    protected void increaseCounter(){
        this.id++;
    }

    public int getCounter(){
        increaseCounter();
        return this.id;
    }

    @Override
    public void close() throws Exception {
        System.out.println("Счетчик остановлен");
    }
}
