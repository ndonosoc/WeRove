import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('#user_languages').select2(); // (~ document.querySelectorAll)
};

export { initSelect2 };
