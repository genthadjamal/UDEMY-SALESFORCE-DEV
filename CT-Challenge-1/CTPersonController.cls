//write below function in CTPersonController class
//getRecentHelathChanges()
// - query Person record [all fields]. limit the result to 100 records
// - sort by "status update date" in descending order
// - return list of person records back to caller

// searchPeople(String searchTerm)
// - query person record [all fields] where either "name" or "mobile" or "token" matches the searchTerm
// - sort by "status update date" in descending order
// - return list of person record back to caller

// getPersonById(String personId)
// - query a person record [all field] where id mathces the 'personId' parameter value
// - return the person record back to caller

public with sharing class CTPersonController {
    public static String getToken(String mobileNo) {
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);

        // get string value of hash blob
        return EncodingUtil.base64Encode(hash);
    }

    public static List<Person__c> getRecentHealthChanges(){
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }

    public static List<Person__c> searchPeople(String searchTerm){
        // appending the wild card
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
            FROM Person__c
            WHERE Name LIKE :searchTerm
                OR Mobile__c LIKE :searchTerm
                OR Token__c LIKE :searchTerm
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c
                FROM Person__c
                WHERE Id =:personId];
        if(people != null && people.size() > 0){
            return people[0];
        }
        return null;
    }

}



