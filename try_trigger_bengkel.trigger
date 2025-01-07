trigger Trigger_Case_MobileApps on Case (after update) {
    
    // isi trigger ini harus selalu di tag comment select all (not active) di sandbox agar jika testing tidak kirim data keluar, klo mau deploy ke live jangan lupa di tag un-comment (active) dulu, by : Victor
    
    for(Case myCase:trigger.new){        
        //Kondisi Reschedule Service Booking
        if(myCase.Send_Case_To_MobileApps__c =='Reschedule Service Booking'){                      
            String caseID = myCase.ID;
            String cancelReason = '';
            String StatusMobileApps = myCase.Status_By_MobileApps__c;
            String StatusCase = myCase.Status; // penambahan status case
            String DealerCode = myCase.Dealer_Code__c;
            DateTime caseBookingDate = myCase.Confirm_Service_Booking_Request_Date__c;
            String BookingDate = caseBookingDate.format('yyyy-MM-dd HH:mm:ss');
            
            if(Test.isRunningTest() == false){
                mobileapps.sendData('service_booking', 'reschedule', caseID, BookingDate, DealerCode, StatusMobileApps, StatusCase, cancelReason);          
            }
        }
        
        //Kondisi Reschedule Test Drive
        if(myCase.Send_Case_To_MobileApps__c =='Reschedule Test Drive'){      
            String caseID = myCase.ID;
            String cancelReason = '';
            String StatusMobileApps = myCase.Status_By_MobileApps__c;
            String StatusCase = myCase.Status; // penambahan status case
            String DealerCode = myCase.Dealer_Code__c;  
            DateTime caseBookingDate = myCase.Confirm_Test_Drive_Request_Date__c;           
            String BookingDate = caseBookingDate.format('yyyy-MM-dd HH:mm:ss');
            
            if(Test.isRunningTest() == false){
                mobileapps.sendData('test_drive', 'reschedule', caseID, BookingDate, dealerCode, StatusMobileApps, StatusCase, cancelReason);
            }
        }   
        
        //Kondisi Update Status Service Booking
        if(myCase.Send_Case_To_MobileApps__c =='Update Status Service Booking'){           
            String caseID = myCase.ID;           
            String cancelReason = myCase.Dealer_Respons__c;
            if(myCase.Dealer_Respons__c == null){
              cancelReason = '';
            }
            String StatusMobileApps = myCase.Status_By_MobileApps__c;
            String StatusCase = myCase.Status; // penambahan status case
            String DealerCode = '';
            String BookingDate = '';
        
      		if(Test.isRunningTest() == false){
                mobileapps.sendData('service_booking', 'update_status', caseID, BookingDate, dealerCode, StatusMobileApps, StatusCase, cancelReason);
            }
        }
        
        //Kondisi Update Status Test Drive
        if(myCase.Send_Case_To_MobileApps__c =='Update Status Test Drive'){            
            String caseID = myCase.ID;            
            String cancelReason = myCase.Dealer_Respons__c;
            if(myCase.Dealer_Respons__c == null){
              cancelReason = '';
            }
            String StatusMobileApps = myCase.Status_By_MobileApps__c;
            String StatusCase = myCase.Status; // penambahan status case
            String DealerCode = '';
            String BookingDate = '';
        
      		if(Test.isRunningTest() == false){
                mobileapps.sendData('test_drive', 'update_status', caseID, BookingDate, dealerCode, StatusMobileApps, StatusCase, cancelReason);            
            }
        }
        
        //Kondisi Update Status Emergency
        if(myCase.Send_Case_To_MobileApps__c =='Update Status Emergency'){    
            String caseID = myCase.ID;            
            String cancelReason = myCase.Dealer_Respons__c;
            if(myCase.Dealer_Respons__c == null){
              cancelReason = '';
            }
            String StatusMobileApps = myCase.Status_By_MobileApps__c;
            String StatusCase = myCase.Status; // penambahan status case            
            String DealerCode = '';
            String BookingDate = '';
        
      		if(Test.isRunningTest() == false){
                mobileapps.sendData('emergency', 'update_status', caseID, BookingDate, dealerCode, StatusMobileApps, StatusCase, cancelReason);            
            }
        }
    }
    
}