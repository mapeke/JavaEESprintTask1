package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBManager;
import kz.bitlab.techorda.entity.Tasks;

import java.io.IOException;

@WebServlet(value = "/saveTask")
public class SaveTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("task_id"));
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_desc");
        String deadlineDate = request.getParameter("task_dead");
        String strdone = request.getParameter("task_done");
        boolean done = false;
        if(strdone.equals("Да")){
            done = true;
        }else{
            done = false;
        }


        Tasks task = DBManager.getTask(id);
        if(task != null){
            task.setName(name);
            task.setDescription(description);
            task.setDone(done);
            task.setDeadlineDate(deadlineDate);
            DBManager.updateTask(task);
            response.sendRedirect("/home.html");
        }else{
            response.sendRedirect("/");
        }
    }
}
