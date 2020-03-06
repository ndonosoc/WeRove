import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';

import '../plugins/toggle_interest';
import '../plugins/slidebar';

import "rater-js";
import { myRater } from "../plugins/rater";
import { myRater2 } from "../plugins/rater";
import { myRater3 } from "../plugins/rater";
import { picker } from "../plugins/datepicker";
import "../components/home_search";
import $ from 'jquery';

import 'flatpickr/dist/flatpickr.min.css';
import { raterFunction } from "../plugins/ratingspicker";

initAutocomplete();
myRater();
myRater2();
myRater3();
picker();
raterFunction();


// $(document).ready(function(){
//   $(".interest-choices").click(function(){
//     $(this).toggleClass("active");
//   });
// });


