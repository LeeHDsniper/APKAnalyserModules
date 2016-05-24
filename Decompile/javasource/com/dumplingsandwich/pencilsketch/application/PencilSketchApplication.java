package com.dumplingsandwich.pencilsketch.application;

import android.support.multidex.MultiDexApplication;
import com.adobe.creativesdk.aviary.IAviaryClientCredentials;
import com.adobe.creativesdk.foundation.AdobeCSDKFoundation;

public class PencilSketchApplication
  extends MultiDexApplication
  implements IAviaryClientCredentials
{
  public PencilSketchApplication() {}
  
  public String getBillingKey()
  {
    return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjbRE8+eswhWJC5fD8qDpSuqTakOJBkeBUYd7P9kAkiTkEiJ4xB2G+2E8FgtmyizTOa2m5jb5U5IOtc4BZCBZQpwTq/EqDm1xHQ2BDuOzW8NJkqXI8o2nH3f0HVilMJtZVHyuLN46kNZONjpZE6iedb6lyg1Y/bFbHLlRqxTFsCrvC6/F93toyov+y2BQnC/zzyhwtoqc831/ZUk/gltI++AJOc1t9THo37Ul4VI9c0Fe+tuFDIQhYqzMuOZaiKBrCD+yJkDdfVkN9Thasdu+UCOUXJham3tYrEJEbxpFlPfh97dHDrjpumWUZrYn5YQ74YuRVcp+ZZNOWe3nlz73fwIDAQAB";
  }
  
  public String getClientID()
  {
    return "5bdd636e3694470fa58e0ea0f195e0d3";
  }
  
  public String getClientSecret()
  {
    return "89baf2ee-6c90-4c15-ad1c-f7c2b6719753";
  }
  
  public void onCreate()
  {
    super.onCreate();
    AdobeCSDKFoundation.initializeCSDKFoundation(getApplicationContext());
  }
}
