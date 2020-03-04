import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import $ from 'jquery';

initAutocomplete();


const datepicker = document.getElementById("datepicker");

if (datepicker) {
  flatpickr(datepicker, {
    mode: "range",
    altInput: true,
    minDate: 'today',
  });
}

$(document).ready(function(){
  $(".interest-choices").click(function(){
    $(this).toggleClass("active");
  });
});

