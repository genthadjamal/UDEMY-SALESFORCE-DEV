trigger LeadTrigger on Lead(before insert, before update) {
    for(Lead leadRecord : Trigger.new){
        if(String.isBlank(leadRecord.LeadSource)){
            leadRecord.LeadSource = 'Other';
        }

        if (String.isBlank(leadRecord.Industry) && Trigger.isInsert) {
            leadRecord.addError('Lead Industry cannot be blank');
        }
    }
    System.debug('Lead trigger 1 is executing');
}