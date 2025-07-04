function toggleSidebar() {
    const sidebar = document.getElementById("sidebar");
    const main = document.getElementById("main");

    sidebar.classList.toggle("collapsed");
    main.classList.toggle("full");
}

function toggleDarkMode() {
    document.body.classList.toggle("dark-mode");
}
    // Sparkle klik dark mode toggle
    const darkToggle = document.querySelector(".dark-toggle");
    darkToggle.addEventListener("click", () => {
        const icon = darkToggle.querySelector("i");
        icon.classList.add("fa-spin");
        setTimeout(() => icon.classList.remove("fa-spin"), 600);
    });
 
 function bukaModal(id) {
  document.getElementById(id).style.display = 'block';
}

function tutupModal(id) {
  document.getElementById(id).style.display = 'none';
}

function isiFormEdit(nim, nama, nilai) {
  document.getElementById('editNim').value = nim;
  document.getElementById('editNama').value = nama;
  document.getElementById('editNilai').value = nilai;
  bukaModal('modalEdit');
}

// Tutup modal jika klik di luar
window.onclick = function(event) {
  if (event.target.classList.contains('modal')) {
    event.target.style.display = "none";
  }
}