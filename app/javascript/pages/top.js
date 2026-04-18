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

  const speak = (text, { rate = 1.0, pitch = 1.0 } = {}) => {
    if (!window.speechSynthesis) return null;
    window.speechSynthesis.cancel();
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'en-US';
    utterance.rate = rate;
    utterance.pitch = pitch;
    utterance.volume = 1.0;
    const applyVoice = () => {
      const voices = window.speechSynthesis.getVoices();
      const maleVoice =
        voices.find(v => v.lang.startsWith('en') && /alex|david|daniel|fred|tom|male/i.test(v.name)) ||
        voices.find(v => v.lang.startsWith('en'));
      if (maleVoice) utterance.voice = maleVoice;
      window.speechSynthesis.speak(utterance);
    };
    if (window.speechSynthesis.getVoices().length > 0) {
      applyVoice();
    } else {
      window.speechSynthesis.addEventListener('voiceschanged', applyVoice, { once: true });
    }
    return utterance;
  };

  document.querySelectorAll('#choice_form input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', () => {
      const isCorrect = radio.dataset.correct === 'true';
      const message = isCorrect ? 'Nice Choice!!' : 'Good!!';

      const overlay = document.getElementById('answer-overlay');
      if (overlay) {
        overlay.querySelector('.answer-overlay__message').textContent = message;
        overlay.classList.add('is-active');
        speak(message, { rate: 1.1, pitch: 0.8 });
        setTimeout(() => {
          document.getElementById('choice_form').requestSubmit();
        }, 1500);
      } else {
        document.getElementById('choice_form').requestSubmit();
      }
    });
  });

  document.querySelectorAll('.choice-speaker').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const text = btn.dataset.text;
      const utterance = speak(text, { rate: 0.9, pitch: 0.8 });
      if (utterance) {
        btn.classList.add('is-speaking');
        utterance.addEventListener('end', () => btn.classList.remove('is-speaking'));
      }
    });
  });

  const overlay = document.querySelector('.overlay');

  const openModal = (situation) => {
    situation.querySelector('.modal').classList.add('is-open');
    situation.classList.add('is-modal-open');
    overlay.classList.add('is-active');
    document.body.style.overflow = 'hidden';
  };

  const closeAll = () => {
    document.querySelectorAll('.modal.is-open').forEach(m => m.classList.remove('is-open'));
    document.querySelectorAll('.situation.is-modal-open').forEach(s => s.classList.remove('is-modal-open'));
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
