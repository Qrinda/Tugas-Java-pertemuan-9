<%@ page import="java.util.List" %>
<%@ page import="crud.Mahasiswa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String keyword = request.getParameter("keyword");
    List<Mahasiswa> daftar = (List<Mahasiswa>) request.getAttribute("hasilBacaSemua");
    if (daftar == null) daftar = Mahasiswa.bacaSemua();

    if (keyword != null && !keyword.isEmpty()) {
        List<Mahasiswa> hasilFilter = new java.util.ArrayList<>();
        for (Mahasiswa m : daftar) {
            if (m.getNim().toLowerCase().contains(keyword.toLowerCase()) ||
                m.getNama().toLowerCase().contains(keyword.toLowerCase())) {
                hasilFilter.add(m);
            }
        }
        daftar = hasilFilter;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Mahasiswa</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="wrapper">
    <!-- SIDEBAR -->
    <div class="sidebar" id="sidebar">
        <h2><i class="fas fa-graduation-cap"></i> Menu</h2>
        <ul>
            <li><a href="index.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
            <li>
                <a href="#" onclick="bukaModal('modalTambah')">
                    <i class="fas fa-user-plus"></i> Tambah Mahasiswa
                </a>
            </li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main" id="main">
        <div class="navbar">
            <button onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
            <h1><i class="fas fa-user-graduate"></i> Manajemen Mahasiswa</h1>
            <div class="search">
                <form method="get" action="index.jsp" class="search-form">
                    <input type="text" name="keyword" placeholder="Cari NIM atau Nama" value="<%= keyword != null ? keyword : "" %>">
                    <button type="submit" title="Cari"><i class="fas fa-search"></i></button>
                    <% if (keyword != null && !keyword.isEmpty()) { %>
                        <a href="index.jsp" class="btn-reset" title="Reset Pencarian"><i class="fas fa-times-circle"></i></a>
                    <% } %>
                </form>
                <button onclick="toggleDarkMode()" class="dark-toggle" title="Ganti Mode"><i class="fas fa-moon"></i></button>
            </div>
        </div>

        <div class="content">
            <h2><i class="fas fa-table"></i> Data Mahasiswa</h2>
            <% if (keyword != null && !keyword.isEmpty()) { %>
                <p style="margin-bottom: 10px; color: #ec4899;">
                    <i class="fas fa-search"></i> Hasil untuk: "<%= keyword %>" — <%= daftar.size() %> ditemukan
                </p>
            <% } %>

            <table>
                <thead>
                    <tr>
                        <th><i class="fas fa-id-card"></i> NIM</th>
                        <th><i class="fas fa-user"></i> Nama</th>
                        <th><i class="fas fa-star"></i> Nilai</th>
                        <th><i class="fas fa-cogs"></i> Aksi</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (daftar != null && !daftar.isEmpty()) {
                        for (Mahasiswa m : daftar) {
                %>
                    <tr>
                        <td><%= m.getNim() %></td>
                        <td><%= m.getNama() %></td>
                        <td><%= m.getNilai() %></td>
                        <td>
                            <a href="#" onclick="isiFormEdit('<%= m.getNim() %>', '<%= m.getNama() %>', '<%= m.getNilai() %>')" class="btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="hapusMahasiswa.jsp?nim=<%= m.getNim() %>" class="btn-delete"
                               onclick="return confirm('Yakin ingin hapus data ini?')">
                                <i class="fas fa-trash-alt"></i> Hapus
                            </a>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4"><i class="fas fa-info-circle"></i> Tidak ada data ditemukan.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <!-- MODAL TAMBAH -->
        <div id="modalTambah" class="modal">
            <div class="modal-content">
                <span class="close" onclick="tutupModal('modalTambah')">&times;</span>
                <h3>Tambah Mahasiswa</h3>
                <form action="prosesTambah.jsp" method="post">
                    <input type="text" name="nim" placeholder="NIM" required>
                    <input type="text" name="nama" placeholder="Nama" required>
                    <input type="number" name="nilai" placeholder="Nilai" required>
                    <button type="submit" class="btn-submit pink"><i class="fas fa-save"></i> Simpan</button>
                </form>
            </div>
        </div>

        <!-- MODAL EDIT -->
        <div id="modalEdit" class="modal">
            <div class="modal-content">
                <span class="close" onclick="tutupModal('modalEdit')">&times;</span>
                <h3>Edit Mahasiswa</h3>
                <form id="formEdit" action="prosesEdit.jsp" method="post">
                    <input type="hidden" name="nim" id="editNim">
                    <input type="text" name="nama" id="editNama" placeholder="Nama" required>
                    <input type="number" name="nilai" id="editNilai" placeholder="Nilai" required>
                    <button type="submit" class="btn-submit pink"><i class="fas fa-edit"></i> Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="js/script.js"></script>
</body>
</html>
