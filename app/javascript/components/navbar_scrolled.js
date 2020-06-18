
const navbarScrolled = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  if (navbar) {
    console.log("hello")
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
