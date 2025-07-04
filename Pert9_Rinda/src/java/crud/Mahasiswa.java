package crud;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Mahasiswa {
    private String nim;
    private String nama;
    private int nilai;

    // Constructor kosong
    public Mahasiswa() {}

    // Constructor lengkap
    public Mahasiswa(String nim, String nama, int nilai) {
        this.nim = nim;
        this.nama = nama;
        this.nilai = nilai;
    }

    // Getter dan Setter
    public String getNim() { return nim; }
    public void setNim(String nim) { this.nim = nim; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public int getNilai() { return nilai; }
    public void setNilai(int nilai) { this.nilai = nilai; }

    // Ambil semua data mahasiswa
    public static List<Mahasiswa> bacaSemua() {
        List<Mahasiswa> daftar = new ArrayList<>();
        try {
            Connection conn = KoneksiDB.getKoneksi();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM mahasiswa");

            while (rs.next()) {
                Mahasiswa mhs = new Mahasiswa(
                    rs.getString("nim"),
                    rs.getString("nama"),
                    rs.getInt("nilai")
                );
                daftar.add(mhs);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return daftar;
    }

    // Baca berdasarkan NIM
    public boolean baca(String nim) {
        boolean ditemukan = false;
        try {
            Connection conn = KoneksiDB.getKoneksi();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM mahasiswa WHERE nim = ?");
            ps.setString(1, nim);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                setNim(rs.getString("nim"));
                setNama(rs.getString("nama"));
                setNilai(rs.getInt("nilai"));
                ditemukan = true;
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ditemukan;
    }

    // Simpan (INSERT)
    public void simpan() {
        try {
            Connection conn = KoneksiDB.getKoneksi();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO mahasiswa (nim, nama, nilai) VALUES (?, ?, ?)");
            ps.setString(1, nim);
            ps.setString(2, nama);
            ps.setInt(3, nilai);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update (alias ubah)
    public void ubah() {
        try {
            Connection conn = KoneksiDB.getKoneksi();
            PreparedStatement ps = conn.prepareStatement("UPDATE mahasiswa SET nama = ?, nilai = ? WHERE nim = ?");
            ps.setString(1, nama);
            ps.setInt(2, nilai);
            ps.setString(3, nim);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Hapus
    public void hapus() {
        try {
            Connection conn = KoneksiDB.getKoneksi();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM mahasiswa WHERE nim = ?");
            ps.setString(1, nim);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
