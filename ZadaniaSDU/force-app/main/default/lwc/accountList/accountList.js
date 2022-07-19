import { LightningElement, wire } from 'lwc';

import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class AccountList extends LightningElement {
    
    @wire(getAccounts) accounts;
    accountIdFromParent;
    handleClick(event){
        event.preventDefault();
        this.accountIdFromParent = event.target.dataset.accountid;
    }
    
}