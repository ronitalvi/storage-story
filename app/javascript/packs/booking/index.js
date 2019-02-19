const tBookRows = document.querySelectorAll('tr.table-row.booking-row')

Object(tBookRows).forEach((element) => {
  element.addEventListener('click', (event) => {
    console.log(`Pressed row with message id %c${element.dataset.id}`, 'color:green;background-color: LightGreen; padding: 3px 5px;')
    window.location.href = `/bookings/${element.dataset.id}`
  })
})

const bookButCancel = document.getElementById('book-cancel')

if (bookButCancel !== null) {
  bookButCancel.addEventListener('click', (event) => {
    window.history.go(-1)
  })
}

document.addEventListener('keyup', (event) => {
  if (event.key === 'Escape') {
    window.history.go(-1)
  };
})