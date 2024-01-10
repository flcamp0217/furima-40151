window.addEventListener('DOMContentLoaded', function(){
  let priceInput = document.getElementById('item-price');
  let addTaxPrice = document.getElementById('add-tax-price');
  let profit = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    // 入力された価格を取得
    let price = parseInt(this.value);

    // 販売手数料の計算（価格の10%）
    let commission = Math.floor(price * 0.1);

    // 販売利益の計算（価格 - 販売手数料）
    let profitValue = price - commission;

    // 販売手数料と販売利益の表示更新
    addTaxPrice.textContent = commission;
    profit.textContent = profitValue;
  });
});