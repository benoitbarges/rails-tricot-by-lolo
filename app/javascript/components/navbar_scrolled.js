const navbarScrolled = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  const body = document.querySelector("body")
  const location = window.location.pathname;
  if (location === '/') {
    body.style.paddingTop = "0px";
  };
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 100) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });
  }
}

export { navbarScrolled };
