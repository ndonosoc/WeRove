import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';

initAutocomplete();


const datepicker = document.getElementById("datepicker");

flatpickr(datepicker, {
    mode: "range",
    altInput: true,
    minDate: 'today',
    });
