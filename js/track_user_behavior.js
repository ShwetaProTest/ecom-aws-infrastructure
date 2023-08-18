(function() {
    const API_URL = 'https://api-gateway-url-here/';

    // Function to send data to the backend
    function sendEventData(eventType, eventData) {
        const payload = {
            eventType: eventType,
            data: eventData,
            timestamp: new Date().toISOString()
        };

        fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        })
        .then(response => response.json())
        .catch((error) => {
            console.error('Error sending event:', error);
        });
    }

    // Capture product searches
    document.querySelector('#searchButton').addEventListener('click', function() {
        const searchInput = document.querySelector('#searchInput');
        if (searchInput) {
            const searchData = {
                query: searchInput.value
            };
            sendEventData('search', searchData);
        }
    });

    // Capture add-to-cart actions
    document.querySelectorAll('.addToCartButton').forEach(button => {
        button.addEventListener('click', function() {
            const productId = button.getAttribute('data-product-id');
            const productName = button.getAttribute('data-product-name');
            
            const cartData = {
                productId: productId,
                productName: productName
            };
            sendEventData('addToCart', cartData);
        });
    });

})();
