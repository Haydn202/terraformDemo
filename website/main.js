document.querySelector(".waitlist")?.addEventListener("submit", (e) => {
  e.preventDefault();
  const input = e.target.querySelector('input[type="email"]');
  const email = input?.value?.trim();
  if (email) {
    alert(
      "Thanks — our agents will notify your agents when a coach is available. (Demo: no backend wired.)"
    );
    input.value = "";
  }
});
