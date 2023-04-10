package kz.bitlab.techorda.db;

import kz.bitlab.techorda.entity.Tasks;
import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasks = new ArrayList<Tasks>();
    private static Long id = 5L;

    static {
        tasks.add(
                new Tasks(1L,
                        "Создать Веб приложение на Java EE",
                        "JAVA SERVLET SHIT YEAH ",
                        "2021-10-23",
                        true
                        )
        );
        tasks.add(
                new Tasks(2L,
                        "УБраться дома и закупить еду",
                        "магнум, скиф, пылесос",
                        "2021-10-25",
                        true
                )
        );
        tasks.add(
                new Tasks(3L,
                        "Выполнить все домашние задания",
                        "ICT ",
                        "2021-10-28",
                        false
                )
        );
        tasks.add(
                new Tasks(4L,
                        "Записаться на качку",
                        "BE FOCUSED MY BROTHERS",
                        "2021-12-12",
                        false
                )
        );
    }
    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    }

    public static Tasks getTask(Long id){
        return tasks
                .stream()
                .filter(task -> task.getId()==id)
                .findFirst()
                .orElse(null);
    }

    public static void updateTask(Tasks task) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == task.getId()) {
                tasks.set(i, task);
                break;
            }
        }
    }

    public static void deleteTask(int id) {
        for (int i = 0; i < tasks.size(); i++) {
            if(tasks.get(i).getId()==id){
                tasks.remove(i);
                break;
            }
        }
    }



}
