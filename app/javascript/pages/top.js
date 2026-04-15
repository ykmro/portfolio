document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('#choice_form input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', () => {
      document.getElementById('choice_form').submit();
    });
  });
});
