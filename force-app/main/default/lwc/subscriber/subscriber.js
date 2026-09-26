import { LightningElement, wire } from 'lwc';
import {MessageContext,subscribe} from 'lightning/messageService';
import Component_Communication_Channel from '@salesforce/messageChannel/ComponentCommunicationChannel__c';

export default class Subscriber extends LightningElement {

    productName='';
    subscription=null;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeChannel();
    }
    subscribeChannel() {
        if(this.subscription){
            return;
        }
        this.subscription = subscribe(
            this.messageContext,
            Component_Communication_Channel,
            (message) => {
                this.handleMessage(message);
            }
        );
    }
    handleMessage(message) {
        this.productName =
        message.productName;
    }
}