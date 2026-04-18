document.addEventListener('turbo:load', () => {
  const nextButton = document.querySelector('.situation.show .button[href]');
  if (nextButton) {
    nextButton.addEventListener('click', (e) => {
      e.preventDefault();
      const href = nextButton.getAttribute('href');
      document.body.classList.add('is-darkened');
      setTimeout(() => {
        Turbo.visit(href);
      }, 500);
    });
  }

  document.querySelectorAll('#choice_form input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', () => {
      document.getElementById('choice_form').requestSubmit();
    });
  });

  const overlay = document.querySelector('.overlay');

  const openModal = (situation) => {
    situation.querySelector('.modal').classList.add('is-open');
    overlay.classList.add('is-active');
    document.body.style.overflow = 'hidden';
  };

  const closeAll = () => {
    document.querySelectorAll('.modal.is-open').forEach(m => m.classList.remove('is-open'));
    overlay.classList.remove('is-active');
    document.body.style.overflow = '';
  };

  document.querySelectorAll('.situation').forEach(situation => {
    situation.querySelector('.thum.js-modal-open')?.addEventListener('click', () => {
      openModal(situation);
    });
    situation.querySelector('.js-modal-close')?.addEventListener('click', closeAll);
  });

  overlay?.addEventListener('click', closeAll);
});
