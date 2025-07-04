<%@ page import="crud.Mahasiswa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nim = request.getParameter("nim");
    String nama = request.getParameter("nama");
    int nilai = Integer.parseInt(request.getParameter("nilai"));

    Mahasiswa mhs = new Mahasiswa(nim, nama, nilai);
    mhs.simpan();
    response.sendRedirect("index.jsp?page=beranda");
%>
