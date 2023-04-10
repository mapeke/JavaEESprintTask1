<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.entity.Tasks" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp"%>
    </div>
    <main class="container mt-5">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
            ADD TASK
        </button>

        <!-- Modal -->
        <form action="/addTask" method="post">
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%@include file="addform.jsp"%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">ADD TASK</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <table class="table mt-3 table-striped table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col" style="width: 40%">Наименование</th>
                <th scope="col">Крайний срок</th>
                <th scope="col">Выполнено</th>
                <th scope="col" style="width: 10%">Детали</th>
            </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
                    if(tasks!=null){
                    for(Tasks task : tasks){
                %>
                    <tr>
                        <td><%=task.getId()%></td>
                        <td><%=task.getName()%></td>
                        <td><%=task.getDeadlineDate()%></td>
                        <td><%
                            if(task.isDone()){
                            %>
                            Да
                            <%
                            }else{
                            %>
                            Нет
                            <%}%>
                        </td>
                        <td>
                            <a class="btn btn-success btn-sm" href="/details?task_id=<%=task.getId()%>">DETAILS</a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </main>
</body>
</html>
