const trows = document.querySelectorAll('tr.table-row')

Object(trows).forEach((element) => {
  element.addEventListener('click', (event) => {
    console.log(`Pressed row with message id %c${element.dataset.id}`, 'color:green;background-color: LightGreen; padding: 3px 5px;')
    window.location.href = `/messages/${element.dataset.id}`
  })
})