function post (){
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  
  priceInput.addEventListener('input', () => {
  const price = parseInt(priceInput.value);
  const commission = Math.floor(price * 0.1);
  const profitValue = price - commission;
  
  
  addTaxPrice.textContent = commission;
  profit.textContent = profitValue;
  
  
  });
  };
  window.addEventListener('turbo:load', post);