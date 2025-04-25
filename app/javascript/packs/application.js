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
  // Campo de seleção
  const entitySelect = document.getElementById("entity-select");

  entitySelect.addEventListener("change", function() {
    const permissions = ['can_extras', 'can_read_restricted', 'can_export_to_academic_system']

    permissions.forEach((permission) => {
      const input = document.querySelector(`input[name="permission[${permission}]"][type="checkbox"]`);
      if (this.value != "Incident"){
        input.disabled = true;
        input.checked = false;
      } else {
        input.disabled = false;
        input.checked = false;
      }
    })
  });
  
  // Alertas
  let alertMessage = document.getElementById('alert');
  
  alertMessage.classList.add('alert-message--visible');
  
  setTimeout((() => {
    alertMessage.classList.remove('alert-message--visible');
  }), 10000);
  
  alertMessage.addEventListener('click', () => {
    alertMessage.classList.remove('alert-message--visible');
  });
});