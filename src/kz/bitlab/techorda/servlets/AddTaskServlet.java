package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBManager;
import kz.bitlab.techorda.entity.Tasks;

import java.io.IOException;

@WebServlet(value = "/addTask")
public class AddTaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("task_name");
        String description = request.getParameter("task_desc");
        String deadlineDate = request.getParameter("task_dead");
        boolean done = false;

        Tasks task = new Tasks(name,
                description,
                deadlineDate,
                done
        );
        DBManager.addTask(task);

        response.sendRedirect("/home.html");
    }
}
