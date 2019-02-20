const cropLongSubj = () => {
  //  get row width
  const messageRowWidth = document.getElementsByClassName('message-row')[0].clientWidth;
  // get message width
  const message = document.getElementsByClassName('message-details-first')

  Object.keys(message).forEach((element) => {
    // get message legth
    const messageWidth = message[element].clientWidth
    // text string
    const txt = message[element].innerText
    // row / message ratio
    const ratio = messageRowWidth / messageWidth
    // max length that will fit
    const maxLength = Math.floor(txt.length * ratio) - 5
    // trancate, if needed
    if (maxLength < txt.length) {
      const str = `${txt.substr(0, maxLength)}...`
      message[element].innerText = str
    }
  })
}

const messages = document.getElementsByClassName('message-row')

Object.keys(messages).forEach((element) => {
  messages[element].addEventListener("click", (event) => {
    window.location.href = `messages/${messages[element].dataset.id}`
  })
})

window.addEventListener("reratio", (event) => cropLongSubj())