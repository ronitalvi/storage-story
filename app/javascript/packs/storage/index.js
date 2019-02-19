const cards = document.getElementsByClassName('card')

Object.keys(cards).forEach ((element) => {
  cards[element].addEventListener('click', (event) => {
    const cardId = cards[element].dataset.id
    console.log(`Pressed storage #%c${cardId}`, 'color:green;background-color: LightGreen; padding: 3px 5px;')
    window.location.href = `/storages/${cardId}`
  })
})
