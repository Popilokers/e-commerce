// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("change", (event) => {
  if (event.target.classList.contains("cart-qty")) {
    const index = event.target.dataset.index;
    const quantity = event.target.value;

    // Enforce minimum
    if (quantity < 1) {
      quantity = 1;
      event.target.value = 1; // Update input visually
    }

    fetch("/cart/update_quantity", {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ index: index, quantity: quantity })
    });
  }
});
