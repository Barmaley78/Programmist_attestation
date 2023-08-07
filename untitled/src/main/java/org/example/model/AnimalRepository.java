package org.example.model;

import java.util.ArrayList;

public class AnimalRepository {
    public ArrayList<Animal> animalRepository;
    protected Counter animalCounter;

    public AnimalRepository(){
        try(Counter animalCounter = new Counter()){
            this.animalCounter = animalCounter;
        } catch (Exception e){
            System.out.println("Ошибка");
        }
        this.animalRepository = new ArrayList<Animal>();
    }

    public ArrayList<Animal> getAnimalRepository() {
        return animalRepository;
    }

    public void addAnimal(Animal animal){
        animalRepository.add(animal);
    }

    public int getID(){
        return animalCounter.getCounter();
    }

    public void deleteAnimalByID(int id){
        for (Animal animal: animalRepository){
            if (animal.getId() == id){
                animalRepository.remove(animal);
            }
        }
    }

    public void showRepository(){
        for (Animal animal: animalRepository){
            System.out.println("ID = " + animal.getId());
            System.out.println("Кличка = " + animal.getName());
            System.out.println("Дата рождения = " + animal.getBirthday());
            System.out.println("Команды = " + animal.getCommands());
        }
    }
}
