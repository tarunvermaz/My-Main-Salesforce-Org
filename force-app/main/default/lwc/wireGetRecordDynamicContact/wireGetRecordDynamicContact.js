import { api, LightningElement, wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';

const FIELDS=['Contact.Name','Contact.Title','Contact.Phone','Contact.Email'];

export default class WireGetRecordDynamicContact extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId:'$recordId', fields:FIELDS})
    Contact;

    get name(){
        return this.Contact?.data?.fields?.Name?.value;
    }
    get title(){
        return this.Contact?.data?.fields?.Title?.value;
    }
    get phone(){
        return this.Contact?.data?.fields?.Phone?.value;
    }
    get email(){
        return this.Contact?.data?.fields?.Email?.value;
    }
}