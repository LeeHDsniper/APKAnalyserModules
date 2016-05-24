package com.behance.sdk;

import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;

public class BehanceSDKUserProfile
{
  private BehanceSDKCityDTO city;
  private String company;
  private BehanceSDKCountryDTO country;
  private String firstName;
  private String lastName;
  private String occupation;
  private String profileImageUrl;
  private BehanceSDKStateDTO state;
  private String website;
  
  public BehanceSDKUserProfile() {}
  
  public BehanceSDKCityDTO getCity()
  {
    return city;
  }
  
  public String getCompany()
  {
    return company;
  }
  
  public BehanceSDKCountryDTO getCountry()
  {
    return country;
  }
  
  public String getFirstName()
  {
    return firstName;
  }
  
  public String getLastName()
  {
    return lastName;
  }
  
  public String getOccupation()
  {
    return occupation;
  }
  
  public String getProfileImageUrl()
  {
    return profileImageUrl;
  }
  
  public BehanceSDKStateDTO getState()
  {
    return state;
  }
  
  public String getWebsite()
  {
    return website;
  }
  
  public void setCity(BehanceSDKCityDTO paramBehanceSDKCityDTO)
  {
    city = paramBehanceSDKCityDTO;
  }
  
  public void setCompany(String paramString)
  {
    company = paramString;
  }
  
  public void setCountry(BehanceSDKCountryDTO paramBehanceSDKCountryDTO)
  {
    country = paramBehanceSDKCountryDTO;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
  
  public void setOccupation(String paramString)
  {
    occupation = paramString;
  }
  
  public void setProfileImageUrl(String paramString)
  {
    profileImageUrl = paramString;
  }
  
  public void setState(BehanceSDKStateDTO paramBehanceSDKStateDTO)
  {
    state = paramBehanceSDKStateDTO;
  }
  
  public void setWebsite(String paramString)
  {
    website = paramString;
  }
}
