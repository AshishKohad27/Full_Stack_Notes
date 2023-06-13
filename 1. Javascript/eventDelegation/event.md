let ad_sight_multi_input_js = document.querySelector('.ad-sight-multi-input');
let ad_sight_multi_add_js = document.querySelector('.ad-sight-multi-add-js');
let ad_sight_input_del_js = document.querySelectorAll('.ad-sight-input-del-js > svg');

// Event listener for the "Add" button
ad_sight_multi_add_js.addEventListener('click', () => {
// Add the HTML content to the multi-input container
ad_sight_multi_input_js.innerHTML += ad_sight_mul_type_body;
console.log(ad_sight_multi_input_js);
console.log(ad_sight_input_del_js);
});

// Event listener for the multi-input container
ad_sight_multi_input_js.addEventListener('click', (event) => {
// Check if the clicked element is an SVG within the delete button container
if (event.target.closest('.ad-sight-input-del-js > svg')) {
// Find the delete button container and its parent input box
const deleteButton = event.target.closest('.ad-sight-input-del-js');
const inputBox = deleteButton.closest('.ad-input-box-js');

        // Remove the parent input box from the multi-input container
        inputBox.remove();
    }

});
in this why we used this // Event listener for the multi-input container
ad_sight_multi_input_js.addEventListener('click', (event) => {
// Check if the clicked element is an SVG within the delete button container
if (event.target.closest('.ad-sight-input-del-js > svg')) {
// Find the delete button container and its parent input box
const deleteButton = event.target.closest('.ad-sight-input-del-js');
const inputBox = deleteButton.closest('.ad-input-box-js');

        // Remove the parent input box from the multi-input container
        inputBox.remove();
    }

}); why we not used direct delete button by loopoing on particlur class

answer

ChatGPT
The reason why we attach the event listener to the ad_sight_multi_input_js container instead of directly looping through the delete buttons is to use event delegation.

Event delegation is a technique where we attach an event listener to a parent element and listen for events that occur on its child elements. In this case, by attaching the event listener to the ad_sight_multi_input_js container, we can handle click events on any dynamically added delete buttons without the need to loop through each delete button individually.

When the click event occurs within the container, we check if the clicked element is an SVG within the delete button container by using event.target.closest('.ad-sight-input-del-js > svg'). If it matches, we can find the corresponding delete button container and its parent input box using closest() method. This way, we can determine which delete button was clicked and access its parent input box for removal.

Using event delegation provides several benefits:

It reduces the number of event listeners attached to individual elements, which can improve performance when dealing with a large number of dynamically added elements.
It allows us to handle events on dynamically added elements without the need to reattach event listeners.
It simplifies the code by handling events in a single place rather than duplicating event handling logic for each delete button.
Overall, event delegation is a useful technique for handling events on dynamically generated content and provides a more efficient and streamlined approach.
