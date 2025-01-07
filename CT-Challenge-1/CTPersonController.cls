public with sharing class CTPersonController {
    public static String getToken(String mobileNo) {
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);

        // get string value of hash blob
        return EncodingUtil.base64Encode(hash);
    }
}

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

