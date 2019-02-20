const tMesrows = document.querySelectorAll('message-row')

Object(tMesrows).forEach((element) => {
  element.addEventListener('click', (event) => {
    console.log(`Pressed row with message id %c${element.dataset.id}`, 'color:green;background-color: LightGreen; padding: 3px 5px;')
    console.log(`/messages/${element.dataset.id}`)
    // window.location.href = `/messages/${element.dataset.id}`
  })
})