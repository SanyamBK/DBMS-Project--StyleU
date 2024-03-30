const puppeteer = require('puppeteer');

(async () => {
  // Launch a new browser instance
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Add your code that manipulates the `document` object here
  const cartIcons = await page.$$('.fa-cart-shopping');
  if (cartIcons.length > 0) {
    cartIcons[0].click();
  }

  // Close the browser instance
  await browser.close();
})();

// Array of product objects
const products = [
  {
    id: 1,
    name: "French Crown",
    price: 9999,
    image: "Images/product1.jpg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 2,
    name: "Peter England",
    price: 9999,
    image: "Images/product2.jpeg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 3,
    name: "Louis Philippe",
    price: 9999,
    image: "Images/product3.jpeg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 4,
    name: "French Crown",
    price: 9999,
    image: "Images/product4.jpeg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 5,
    name: "YSMLOIU",
    price: 9999,
    image: "Images/product5.jpg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 6,
    name: "YouthUp",
    price: 9999,
    image: "Images/product6.jpeg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 7,
    name: "unbranded",
    price: 9999,
    image: "Images/product7.jpg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 8,
    name: "TOPGH",
    price: 9999,
    image: "Images/product8.jpg",
    quantity: 10,
    category: "suits",
  },
  {
    id: 9,
    name: "Lhuilier",
    price: 80999,
    image: "Images/gown1.jpg",
    quantity: 10,
    category: "gowns",
  },
  {
    id: 10,
    name: "Ricco India",
    price: 100000,
    image: "Images/gown2.jpg",
    quantity: 10,
    category: "gowns",
  },
  {
    id: 11,
    name: "LimeRoad",
    price: 9999,
    image: "Images/gown4.jpg",
    quantity: 10,
    category: "gowns",
  },
  {
    id: 12,
    name: "Gown Style",
    price: 9999,
    image: "Images/gown5.jpg",
    quantity: 10,
    category: "gowns",
  },
  {
    id: 13,
    name: "Pastel Green Net",
    price: 9999,
    image: "Images/gown6.jpg",
    quantity: 10,
    category: "gowns",
  },
  {
    id: 14,
    name: "Nike Crown",
    price: 999,
    image: "Images/f2.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 15,
    name: "Adidas",
    price: 499,
    image: "Images/f1.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 16,
    name: "Van Heusen",
    price: 799,
    image: "Images/f3.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 17,
    name: "Forever 21",
    price: 999,
    image: "Images/f4.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 18,
    name: "Jian Jing",
    price: 1599,
    image: "Images/f6.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 19,
    name: "H&M",
    price: 1999,
    image: "Images/n5.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 20,
    name: "GAP",
    price: 999,
    image: "Images/n2.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 21,
    name: "Khadi",
    price: 999,

    image: "Images/n8.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 22,
    name: "Zara",
    price: 2599,
    image: "Images/zara.jpg",
    quantity: 10,
    category: "shirts",
  },
  {
    id: 23,
    name: "H&M",
    price: 1999,
    image: "Images/dress1.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 24,
    name: "H&M",
    price: 999,
    image: "Images/dress2.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 25,
    name: "Van Heusen",
    price: 1799,
    image: "Images/dress3.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 26,
    name: "Forever 21",
    price: 4999,
    image: "Images/dress4.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 27,
    name: "Louis Vuitton",
    price: 2599,
    image: "Images/dress5.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 28,
    name: "Manyavar",
    price: 6999,

    image: "Images/dress6.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 29,
    name: "GAP",
    price: 1599,
    image: "Images/dress7.jpg",
    quantity: 10,
    category: "dresses",
  },
  {
    id: 30,
    name: "Zara",
    price: 4999,
    image: "Images/dress8.jpg",
    quantity: 10,
    category: "dresses",
  },
];

// Select the cart icon elements
const cartIcons = document.querySelectorAll(".fa-cart-shopping");

// Add event listener to each cart icon
cartIcons.forEach((cartIcon) => {
  cartIcon.addEventListener("click", addToCart);
});

// Function to add a product to the cart
function addToCart(event) {
  const productId = parseInt(event.target.dataset.productId);
  const product = products.find((p) => p.id === productId);
  if (product && product.quantity > 0) {
    addItemToCart(product);
  } else {
    alert("This product is not available.");
  }
}

// Function to add an item to the cart
function addItemToCart(product) {
  decrementQuantity(product);
  displayCartItem(product);
}

// Function to decrement product quantity after adding to cart
function decrementQuantity(product) {
  const productIndex = products.findIndex((p) => p.id === product.id);
  products[productIndex].quantity--;
}

// Function to display an item in the cart
function displayCartItem(product) {
  // Replace the following code with the appropriate code to display the item in the cart
  console.log("Product added to the cart:", product);
  alert(`1 item added to cart: ${product.name}`);
}