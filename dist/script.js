document.addEventListener("DOMContentLoaded", function () {
    setTimeout(() => {
        for (let i = 0; i < 100; i++) {
            createParticle(window.innerWidth / 2, window.innerHeight / 2);
        }
    }, 500);
});

function createParticle(x, y) {
    const particle = document.createElement("div");
    document.body.appendChild(particle);
    particle.classList.add("particle");

    const size = Math.random() * 15 + 5;
    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;

    particle.style.left = `${x}px`;
    particle.style.top = `${y}px`;

    const angle = Math.random() * (2 * Math.PI);
    const strength = Math.random() * 15 + 5;
    const vx = Math.sin(angle) * strength;
    const vy = Math.cos(angle) * strength;

    let ttl = 150;  // time to live in frames
    const intervalId = setInterval(() => {
        x += vx;
        y -= vy;
        ttl -= 1;

        particle.style.left = `${x}px`;
        particle.style.top = `${y}px`;
        particle.style.opacity = ttl / 150;

        if (ttl <= 0) {
            particle.remove();
            clearInterval(intervalId);
        }
    }, 1000 / 60); // run at 60 frames per second for smoother animation
}
