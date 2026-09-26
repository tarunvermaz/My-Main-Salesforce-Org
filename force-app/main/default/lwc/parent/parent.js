import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    name='';
     message = '';

    handleHello(event) {
     this.message = event.detail.message;
     this.name = event.detail.name;
    }
}