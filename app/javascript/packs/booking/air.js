const cropLongSubj = () => {
  //  get row width
  const bookingRowWidth = document.getElementsByClassName('bookings-list-row')[0].clientWidth;
  // get booking width
  const booking = document.getElementsByClassName('bookings-list-row')

  Object.keys(booking).forEach((element) => {
    // get booking legth
    const bookingWidth = booking[element].clientWidth
    // text string
    const txt = booking[element].innerText
    // row / booking ratio
    const ratio = bookingRowWidth / bookingWidth
    // max length that will fit
    const maxLength = Math.floor(txt.length * ratio) - 5
    // trancate, if needed
    if (maxLength < txt.length) {
      const str = `${txt.substr(0, maxLength)}...`
      booking[element].innerText = str
    }
  })
}

const bookings = document.getElementsByClassName('bookings-list-row')

Object.keys(bookings).forEach((element) => {
  bookings[element].addEventListener("click", (event) => {
    window.location.href = `bookings/${bookings[element].dataset.id}`
  })
})

window.addEventListener("reratio", (event) => cropLongSubj())