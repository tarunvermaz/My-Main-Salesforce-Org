import { LightningElement } from 'lwc';

export default class LifecycleDemo extends LightningElement {

    count = 0;

    // 1️⃣ Component is created
    constructor() {
        super();

        console.log('1 constructor()');
    }

    // 2️⃣ Component is inserted into the DOM
    connectedCallback() {
        console.log('2 connectedCallback()');
    }

    // 3️⃣ Component has finished rendering
    renderedCallback() {
        console.log('3 renderedCallback()');
    }

    // Button click
    increaseCount() {
        this.count++;

        console.log('Button clicked');
        console.log('Count:', this.count);
    }

    // 4️⃣ Component is removed from the DOM
    disconnectedCallback() {
        console.log('4 disconnectedCallback()');
    }

    // 5️⃣ Handles errors from child components
    errorCallback(error, stack) {
        console.log('5 errorCallback()');
        console.log('Error:', error);
        console.log('Stack:', stack);
    }
}

