const picker = () => {


const datepicker = document.getElementById("datepicker");

if (datepicker) {
  flatpickr(datepicker, {
    mode: "range",
    altInput: true,
    minDate: 'today',
  });
}

}

export { picker };
