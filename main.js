/* GWT Hardwood Floors — minimal interactions (no dependencies) */
(function () {
  // Mobile nav is a native <details> element — works with zero JS.
  // This just closes it automatically after a link is tapped.
  var nav = document.querySelector('.nav-mobile');
  if (nav) {
    nav.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') nav.removeAttribute('open');
    });
  }

  // Scroll-reveal (progressive enhancement — content is visible by default;
  // see .js .reveal in style.css). Respects reduced-motion via CSS fallback.
  var reveals = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window && reveals.length) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('in');
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add('in'); });
  }
})();
