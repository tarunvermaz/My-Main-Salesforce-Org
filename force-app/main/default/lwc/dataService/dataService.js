//1  lightning-record-form

/*import { LightningElement, api } from "lwc";

export default class RecordFormExample extends LightningElement {
  @api recordId;
  @api objectApiName;

  fields = ['AccountId','Name','Rating','Phone','AnnualRevenue'];
  mode="readonly"
}*/

//2  lightning-record-view-form (Read Only)

/*import { LightningElement, api } from 'lwc';

export default class AccountViewForm extends LightningElement {

    @api recordId;

}*/

import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountEditForm extends LightningElement {

    @api recordId;

    handleSuccess() {

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Account Updated',
                variant: 'success'
            })
        );
    }

}