// Function to update the visitor counter
function updateCounter() {
    fetch('https://visitor-counter-jbztpnw5kq-uc.a.run.app/api/visitcount', {
        method: 'POST', // or 'GET' depending on your API design
        headers: {
            'Content-Type': 'application/json',
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        document.getElementById('counter').innerText = data.count;
    })
    .catch(error => {
        console.error('Error updating visitor count:', error);
        document.getElementById('counter').innerText = 'Error loading count';
    });
}

// Call the function when the page loads
document.addEventListener('DOMContentLoaded', updateCounter);