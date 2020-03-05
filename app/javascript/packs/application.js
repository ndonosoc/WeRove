import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import '../plugins/toggle_interest';
import '../plugins/slidebar';
import 'flatpickr/dist/flatpickr.min.css';

initAutocomplete();


const datepicker = document.getElementById("datepicker");

if (datepicker) {
  flatpickr(datepicker, {
    mode: "range",
    altInput: true,
    minDate: 'today',
  });
}

