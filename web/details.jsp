<%@ page import="kz.bitlab.techorda.entity.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp"%>
    </div>
    <div class="container mt-5">
        <%
            Tasks task = (Tasks) request.getAttribute("task");
            if(task!=null){
        %>
            <div class="row">
                <div class="col-12">
                    <label>NAME : </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text"  readonly class="form-control" name="task_name" value="<%=task.getName()%>">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label>DESCRIPTION : </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <textarea name="task_desk" readonly class="form-control" rows="5"><%=task.getDescription()%></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label>DeadLine : </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="date" readonly class="form-control" name="task_dead" value="<%=task.getDeadlineDate()%>">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label>Is done : </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <select class="form-control"  name="task_done">
                        <%
                            if(task.isDone()){
                        %>
                        <option selected="selected">Да</option>
                        <%
                            }else{
                        %>
                        <option selected="selected">Нет</option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editTask">
                            Edit
                        </button>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteTask">
                            Delete
                        </button>
                    </div>
                </div>
            </div>
        <%--MODAL --%>
        <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/deleteTask" method="post">
                        <input type="hidden" name="id" value="<%=task.getId()%>">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5">Confirm Delete</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5 class="text-center">Are you sure?</h5>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button class="btn btn-danger">YES</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/saveTask" method="post">
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="row">
                                <div class="col-12">
                                    <label>NAME : </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <input type="text" class="form-control" name="task_name" value="<%=task.getName()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>DESCRIPTION : </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <textarea name="task_desc" class="form-control" rows="10"><%=task.getDescription()%></textarea>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>DeadLine : </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <input type="date" class="form-control" name="task_dead" value="<%=task.getDeadlineDate()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>Is done : </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <select class="form-control"  name="task_done">
                                        <%
                                            if(task.isDone()){
                                        %>
                                        <option selected="selected">Да</option>
                                        <option>Нет</option>
                                        <%
                                        }else{
                                        %>
                                        <option>Да</option>
                                        <option selected="selected">Нет</option>

                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button class="btn btn-primary">SAVE TASK</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%
        }else{
        %>
        <h3 class="text-center">
            TASK NOT FOUND
        </h3>
        <%
            }
        %>
    </div>
</body>
</html>
