import "bootstrap";
import $ from 'jquery';
import "../components/home_search";
import { initAutocomplete } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import { tagger } from '../plugins/slidebar';
import { myRater } from "../plugins/rater";
import { myRater2 } from "../plugins/rater";
import { myRater3 } from "../plugins/rater";
import { picker } from "../plugins/datepicker";
import { initSelect2 } from "../plugins/init_select2";
import { raterFunction } from "../plugins/ratingspicker";
import { buttonDisabler } from "../plugins/button_disabler";
import { loader } from "../plugins/loader";

import 'select2/dist/css/select2.css';
import 'flatpickr/dist/flatpickr.min.css';

initAutocomplete();
myRater();
myRater2();
myRater3();
picker();
raterFunction();
tagger();
initSelect2();
buttonDisabler();
loader();

// $(document).ready(function(){
//   $(".interest-choices").click(function(){
//     $(this).toggleClass("active");
//   });
// });
