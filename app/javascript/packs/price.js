window.addEventListener('load', function(){
  

  document.getElementById('item-price').addEventListener('input',function(){
    

    if (document.getElementById("add-tax-price").textContent != ""){
      

      document.getElementById("add-tax-price").textContent = null
      document.getElementById("price").textContent = null
    }

    let itemPrice = document.getElementById('item-price').value;
    let serviceCharge = document.getElementById('add-tax-price')
    let profit = document.getElementById('profit')

    itemPrice = Number(itemPrice);
    let charge = Math.floor(itemPrice * 0.1).toLocaleString();
    let userProfit = Math.floor(itemPrice * 0.9).toLocaleString();
    console.log(serviceCharge.append(charge));
    console.log(profit.append(userProfit));
  })
})













