document.addEventListener('turbo:load', function() {
  var cartCountElement = document.getElementById('cart-count');

  fetch('/cart/count')
    .then(response => response.json())
    .then(data => {
      cartCountElement.innerText = data.count;
    })
    .catch(error => {
      console.error('Error fetching cart count:', error);
    });
});
