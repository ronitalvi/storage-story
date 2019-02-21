const tBookRows = document.querySelectorAll('tr.table-row.booking-row')

Object(tBookRows).forEach((element) => {
  element.addEventListener('click', (event) => {
    console.log(`Pressed row with message id %c${element.dataset.id}`, 'color:green;background-color: LightGreen; padding: 3px 5px;')
    window.location.href = `/bookings/${element.dataset.id}`
  })
})