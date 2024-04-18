import Chartkick from "chartkick";
import Highcharts from "highcharts";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
 
Rails.start();
Turbolinks.start();
ActiveStorage.start();

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