<%@ page import="crud.Mahasiswa" %>
<%
    String nim = request.getParameter("nim");
    String nama = request.getParameter("nama");
    int nilai = Integer.parseInt(request.getParameter("nilai")); // konversi String ke int

    Mahasiswa mhs = new Mahasiswa();
    mhs.setNim(nim);
    mhs.setNama(nama);
    mhs.setNilai(nilai); 

    mhs.ubah(); 

    response.sendRedirect("index.jsp");
    
%>
