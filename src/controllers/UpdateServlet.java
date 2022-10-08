package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import models.validators.TaskValidator;
import utils.DButil;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String _token = request.getParameter("_token");

        if (_token != null && _token.equals(request.getSession().getId())) {

            EntityManager em = DButil.createEntityManager();

            Task t = em.find(Task.class, (Integer) (request.getSession().getAttribute("task_id")));

            String content = request.getParameter("content");
            t.setContent(content);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            t.setUpdated_at(currentTime);

            List<String> errors = TaskValidator.validate(t);

            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("task", t);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/edit.jsp");
                rd.forward(request, response);

            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                request.getSession().setAttribute("flush", "タスク" + request.getSession().getAttribute("task_id") + "を更新しました");
                em.close();

                request.getSession().removeAttribute("task_id");

                response.sendRedirect(request.getContextPath() + "/index");
            }


        }
    }

}