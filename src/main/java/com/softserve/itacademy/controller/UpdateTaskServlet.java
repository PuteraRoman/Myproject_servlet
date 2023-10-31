package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit-task")
public class UpdateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    private Task task;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int taskId = Integer.parseInt(idParam);
            task = taskRepository.read(taskId);
            if (task != null) {
                request.setAttribute("task", task);
                request.getRequestDispatcher("/WEB-INF/pages/edit-task.jsp").forward(request, response);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                String errorMessage = "Object with id " + taskId + " is not found";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            String errorMessage = "Task with ID "+ request.getParameter("id") + " not found in To-Do List!";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        task.setTitle(request.getParameter("title"));
        task.setPriority(Priority.valueOf(request.getParameter("priority")));
        boolean updateResult = taskRepository.update(task);
        if(updateResult) {
            response.sendRedirect("/tasks-list");
        }else {
            String errorMessage = "Failed to update the task";
            request.setAttribute("noThisTask",errorMessage);
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request,response);
        }
    }
}
