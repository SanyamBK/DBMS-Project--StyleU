// Initialize cart array
let cart = [];

// Add click event listener to shopping cart icons
$('.product-image a.button-cart').click(function() {
  // Get the current product
  let product = $(this).closest('.product-item');
  
  // Add the product to the cart
  addToCart(product);
});

// Add to cart function
function addToCart(product) {
    // Get the product data
    let id = product.data('id');
    let name = product.find('.product-name').text();
    let price = parseFloat(product.find('.product-price').text().replace('$', ''));
    let quantity = parseInt(product.find('.quantity input').val());
  
    // Check if the product is already in the cart
    let existingProductIndex = cart.findIndex(item => item.id === id);
  
    if (existingProductIndex !== -1) {
      // If the product is already in the cart, increase the quantity
      cart[existingProductIndex].quantity += quantity;
    } else {
      // If the product is not in the cart, add it
      cart.push({
        id: id,
        name: name,
        price: price,
        quantity: quantity
      });
    }
  
    // Update the cart count
    updateCartCount();
  
    // Add the product to the cart modal
    addToCartModal(product);
  
    // Play the added to cart sound
    playAddedToCartSound();
  
    // Prevent the default link click behavior
    return false;
  }

  // Add to cart modal function
function addToCartModal(product) {
    // Clone the cart modal item
    let cartModalItem = $('.cart-modal-item').first().clone();
  
    // Set the product data
    cartModalItem.find('.product-name').text(product.find('.product-name').text());
    cartModalItem.find('.product-price').text('$' + product.find('.product-price').text());
    cartModalItem.find('.quantity').text(product.find('.quantity input').val());
  
    // Add the product to the cart modal
    $('.cart-modal-items').append(cartModalItem);
  
    // Fade in the cart modal
    $('.cart-modal').fadeIn();
  }
  
  // Update cart count function
  function updateCartCount() {
    // Get the cart count element
    let cartCountEl = $('.cart-count');
  
    // Set the cart count
    cartCountEl.text(cart.reduce((total, item) => total + item.quantity, 0));
  }
  
  // Added to cart sound
  function playAddedToCartSound() {
    let audio = new Audio('sound.mp3');
    audio.play();
  }