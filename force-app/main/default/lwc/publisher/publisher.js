import { LightningElement, wire } from 'lwc';
import {publish,MessageContext} from 'lightning/messageService';
import Component_Communication_Channel from '@salesforce/messageChannel/ComponentCommunicationChannel__c'

export default class Publisher extends LightningElement {

    name = '';
    @wire(MessageContext)
    messageContext;

    handleChange(event) {
        this.name = event.target.value;
    }

    sendMessage() {
        const payload = {
            productName: this.name
        };
        publish(
            this.messageContext,
            Component_Communication_Channel,
            payload
        );
    }
}