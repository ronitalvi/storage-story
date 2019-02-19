const messageId = document.getElementsByTagName('body')[0].dataset.id
const mesButCancel = document.getElementById('mes-cancel')

if (mesButCancel !== null) {
  mesButCancel.addEventListener('click', (event) => {
  window.history.go(-1)
})}

document.addEventListener('keyup', (event) => {
  if (event.key === 'Escape') {
    window.history.go(-1)
  };
})