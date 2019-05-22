// calculates the total deposit 10%

const calDepositCost = () => {
  const string_total = document.querySelector("#tour_cost")
  const string_deposit = document.querySelector("#deposit_cost")
  const num_deposit = parseInt(string_deposit.innerText)


  if (string_total) {
    string_total.addEventListener('change', (event) => {
    const num_total = parseInt(string_total, 10)
    string_deposit.innerText = num_total * 2
    console.log(num_total);
    })
  }
}

export {calDepositCost}
