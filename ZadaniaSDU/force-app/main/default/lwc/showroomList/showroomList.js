import { LightningElement, api, wire } from 'lwc';
import getShowroom from '@salesforce/apex/ShowroomController.getShowroom';
const columns = [
    {label:'Name', fieldName: 'Showroom_Name__c'}
]
export default class ShowroomList extends LightningElement {
    columns = columns;
    @api accountId;
    @wire(getShowroom, {accountId:'$accountId'}) showrooms;
}