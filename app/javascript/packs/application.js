import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';

initAutocomplete();


const datepicker = document.getElementById("datepicker");

flatpickr("datepicker", {
    inline: true,
    altInput: true,
    enableTime: true,
    minDate: 'today',
    minuteIncrement: 30,
    minTime: "8:00",
    maxTime: "20:00",
    disable: [weekends]
    });
