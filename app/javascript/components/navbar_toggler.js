const buttons = document.querySelectorAll('.navbarToggler');
const menu = document.getElementById('sidebarNav');

const navbarToggler = () => {
  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
    menu.classList.toggle('hiddenNav');
    })
  })
}

export { navbarToggler };
