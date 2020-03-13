import "bootstrap";
import $ from 'jquery';
import "../components/home_search";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initAutocomplete2 } from "../plugins/init_autocomplete";
import flatpickr from 'flatpickr';
import { tagger, reverseTagger } from '../plugins/slidebar';
import { myRater } from "../plugins/rater";
import { myRater2 } from "../plugins/rater";
import { myRater3 } from "../plugins/rater";
import { picker } from "../plugins/datepicker";
import { initSelect2 } from "../plugins/init_select2";
import { raterFunction } from "../plugins/ratingspicker";
import { buttonDisabler } from "../plugins/button_disabler";
import { senderDisabler } from "../plugins/sender_disabler";
import { chatFocus } from "../plugins/chat_focus";
import { loader } from "../plugins/loader";
import { matchmeDisplayer } from "../plugins/matchme_displayer";
import { matchMeSlider } from "../plugins/matchmeSlider";

import 'select2/dist/css/select2.css';
import 'flatpickr/dist/flatpickr.min.css';

initAutocomplete();
initAutocomplete2();
myRater();
myRater2();
myRater3();
picker();
raterFunction();
tagger();
reverseTagger();
initSelect2();
buttonDisabler();
loader();
matchmeDisplayer();
senderDisabler();
chatFocus();
matchMeSlider();

// $(document).ready(function(){
//   $(".interest-choices").click(function(){
//     $(this).toggleClass("active");
//   });
// });
