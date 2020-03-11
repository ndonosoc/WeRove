import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('location');
  if (addressInput) {
    places({
      appId: "plB7OCT0SN2O",
      apiKey: "135f9a8025d3c18159ad5fa4df41bd0e",
      container: addressInput });
  }
};

export { initAutocomplete };
