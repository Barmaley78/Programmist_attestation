package org.example.view;

import org.example.model.Animal;
import org.example.model.AnimalRepository;

import java.util.Scanner;

public class AnimalView {
    AnimalRepository animalRepository;

    public AnimalView() {
        this.animalRepository = new AnimalRepository();
    }

    public void menu() throws Exception {
        boolean flag = true;
        Scanner in = new Scanner(System.in);
        while(flag == true) {
            System.out.println("Меню :\n" +
                    "1 - Добавить животное \n" +
                    "2 - Ноказать всех животных \n" +
                    "3 - Удалить животное \n" +
                    "4 - Выход \n");
            System.out.print("Выберите действие - ");
            String command = in.next();
            switch (command) {
                // new animal
                case "1":
                    System.out.print("Укажите кличку: ");
                    String name = in.next();
                    System.out.print("Укажите дату рождения: ");
                    String birthday = in.next();
                    animalRepository.addAnimal(new Animal(animalRepository.getID(),name,birthday));
                    break;
                case "2":
                    animalRepository.showRepository();
                    break;
                case "3":
                    System.out.print("Укажите ID животного для удаления: ");
                    int deleteID = Integer.parseInt(in.next());
                    animalRepository.deleteAnimalByID(deleteID);
                    break;
                case "4":
                    flag = false;
                    break;
            }
        }
    }
}