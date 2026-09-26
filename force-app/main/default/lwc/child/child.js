import { api, LightningElement } from 'lwc';

export default class Child extends LightningElement {
    //Explain Getter and Setter in LWC

   /* uppercaseItemName="default value";

    @api
    get itemName(){
        return this.uppercaseItemName;
    }
    set itemName(value){
        this.uppercaseItemName = value.toUpperCase();
    }*/

    @api
    firstName = "Sanjay";
    @api showButton;

    handleClick() {
       const myEvent = new CustomEvent('hello', {
        detail: {
        name: this.firstName,
        message: 'Button was clicked'
        }
        });

        this.dispatchEvent(myEvent)
    }
}