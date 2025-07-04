<%@ page import="crud.Mahasiswa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nim = request.getParameter("nim");

    if (nim != null && !nim.isEmpty()) {
        Mahasiswa mhs = new Mahasiswa();
        if (mhs.baca(nim)) {
            mhs.hapus();
        }
    }

    response.sendRedirect("index.jsp");
%>
