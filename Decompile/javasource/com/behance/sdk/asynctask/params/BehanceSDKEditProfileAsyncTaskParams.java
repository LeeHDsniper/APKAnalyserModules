package com.behance.sdk.asynctask.params;

import android.graphics.Bitmap;
import com.behance.sdk.project.modules.ImageModule;

public class BehanceSDKEditProfileAsyncTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String city;
  private String company;
  private String country;
  private String firstName;
  private ImageModule image;
  private String lastName;
  private String occupation;
  private Bitmap profileImageBitmap;
  private String state;
  private String website;
  
  public BehanceSDKEditProfileAsyncTaskParams() {}
  
  public String getCity()
  {
    return city;
  }
  
  public String getCompany()
  {
    return company;
  }
  
  public String getCountry()
  {
    return country;
  }
  
  public String getFirstName()
  {
    return firstName;
  }
  
  public ImageModule getImage()
  {
    return image;
  }
  
  public String getLastName()
  {
    return lastName;
  }
  
  public String getOccupation()
  {
    return occupation;
  }
  
  public Bitmap getProfileImageBitmap()
  {
    return profileImageBitmap;
  }
  
  public String getState()
  {
    return state;
  }
  
  public String getWebsite()
  {
    return website;
  }
  
  public void setCity(String paramString)
  {
    city = paramString;
  }
  
  public void setCompany(String paramString)
  {
    company = paramString;
  }
  
  public void setCountry(String paramString)
  {
    country = paramString;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setImage(ImageModule paramImageModule)
  {
    image = paramImageModule;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
  
  public void setOccupation(String paramString)
  {
    occupation = paramString;
  }
  
  public void setProfileImageBitmap(Bitmap paramBitmap)
  {
    profileImageBitmap = paramBitmap;
  }
  
  public void setState(String paramString)
  {
    state = paramString;
  }
  
  public void setWebsite(String paramString)
  {
    String str = paramString;
    if (paramString.length() > 3)
    {
      str = paramString;
      if (!paramString.contains("http://"))
      {
        str = paramString;
        if (!paramString.contains("https://"))
        {
          str = paramString;
          if (!paramString.substring(0, 2).equals("www")) {
            str = "http://www." + paramString;
          }
        }
      }
    }
    website = str;
  }
}
