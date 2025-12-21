//= require jquery3
//= require popper
//= require bootstrap

// Reinitialize Bootstrap components after Turbo page loads
document.addEventListener('turbo:load', function() {
  // Dispose and reinitialize navbar collapse to prevent duplicate listeners
  var navbarCollapse = document.getElementById('navbarNav');
  if (navbarCollapse) {
    var existingCollapse = bootstrap.Collapse.getInstance(navbarCollapse);
    if (existingCollapse) {
      existingCollapse.dispose();
    }
    new bootstrap.Collapse(navbarCollapse, { toggle: false });
  }
});