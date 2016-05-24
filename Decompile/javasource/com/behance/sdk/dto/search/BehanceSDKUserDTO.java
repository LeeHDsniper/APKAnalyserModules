package com.behance.sdk.dto.search;

import android.util.SparseArray;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKUserDTO
{
  private int appreciationsCount;
  private String city;
  private int commentsCount;
  private String company;
  private String country;
  private long createdOn;
  private List<BehanceSDKUserDetailsSectionDTO> detailsSections;
  private String displayName;
  private List<BehanceSDKFeaturedDTO> featuredDetails;
  private List<String> fields;
  private String firstName;
  private int followersCount;
  private int followingCount;
  private int id;
  private boolean isCurrentUserFollowing;
  private boolean isEnterprise = false;
  private String lastName;
  private String occupation;
  private SparseArray<BehanceSDKImageDTO> profileImagesArray;
  private String profileUrl;
  private String state;
  private String twitterHandle;
  private String userName;
  private int viewsCount;
  private List<BehanceSDKWebLinkDTO> webLinks;
  
  public BehanceSDKUserDTO() {}
  
  public void addDetailsSection(BehanceSDKUserDetailsSectionDTO paramBehanceSDKUserDetailsSectionDTO)
  {
    if (detailsSections == null) {
      detailsSections = new ArrayList();
    }
    detailsSections.add(paramBehanceSDKUserDetailsSectionDTO);
  }
  
  public void addFeaturedDetail(BehanceSDKFeaturedDTO paramBehanceSDKFeaturedDTO)
  {
    if (featuredDetails == null) {
      featuredDetails = new ArrayList();
    }
    featuredDetails.add(paramBehanceSDKFeaturedDTO);
  }
  
  public void addField(String paramString)
  {
    if (fields == null) {
      fields = new ArrayList(3);
    }
    fields.add(paramString);
  }
  
  public void addImage(int paramInt, String paramString)
  {
    if (profileImagesArray == null) {
      profileImagesArray = new SparseArray(3);
    }
    profileImagesArray.put(paramInt, BehanceSDKImageDTO.getNewInstance(paramString));
  }
  
  public void addWebLink(BehanceSDKWebLinkDTO paramBehanceSDKWebLinkDTO)
  {
    if (webLinks == null) {
      webLinks = new ArrayList();
    }
    webLinks.add(paramBehanceSDKWebLinkDTO);
  }
  
  public void setAppreciationsCount(int paramInt)
  {
    appreciationsCount = paramInt;
  }
  
  public void setCity(String paramString)
  {
    city = paramString;
  }
  
  public void setCommentsCount(int paramInt)
  {
    commentsCount = paramInt;
  }
  
  public void setCompany(String paramString)
  {
    company = paramString;
  }
  
  public void setCountry(String paramString)
  {
    country = paramString;
  }
  
  public void setCreatedOn(long paramLong)
  {
    createdOn = paramLong;
  }
  
  public void setCurrentUserFollowing(boolean paramBoolean)
  {
    isCurrentUserFollowing = paramBoolean;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setFirstName(String paramString)
  {
    firstName = paramString;
  }
  
  public void setFollowersCount(int paramInt)
  {
    followersCount = paramInt;
  }
  
  public void setFollowingCount(int paramInt)
  {
    followingCount = paramInt;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setLastName(String paramString)
  {
    lastName = paramString;
  }
  
  public void setOccupation(String paramString)
  {
    occupation = paramString;
  }
  
  public void setProfileUrl(String paramString)
  {
    profileUrl = paramString;
  }
  
  public void setState(String paramString)
  {
    state = paramString;
  }
  
  public void setTwitterHandle(String paramString)
  {
    twitterHandle = paramString;
  }
  
  public void setUserName(String paramString)
  {
    userName = paramString;
  }
  
  public void setViewsCount(int paramInt)
  {
    viewsCount = paramInt;
  }
}
