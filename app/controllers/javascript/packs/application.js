require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick").use(require("highcharts"))

document.addEventListener('DOMContentLoaded', () => {
  let alertMessage = document.getElementById('alert');
  
  alertMessage.classList.add('alert-message--visible');
  
  setTimeout((() => {
    alertMessage.classList.remove('alert-message--visible');
  }), 10000);
  
  alertMessage.addEventListener('click', () => {
    alertMessage.classList.remove('alert-message--visible');
  });
});