package com.behance.sdk.dto;

import android.app.Activity;
import com.behance.sdk.project.modules.ProjectModule;
import java.io.Serializable;

public class BehanceSDKPublishWIPServiceParamsDTO
  implements Serializable
{
  private static final long serialVersionUID = 6973446263430164813L;
  private String appClientId;
  private boolean containsAdultContent;
  private Class<? extends Activity> notificationHandlerActivity;
  private boolean shareOnFacebook;
  private boolean shareOnTwitter;
  private String twitterConsumerKey;
  private String twitterConsumerSecret;
  private String twitterUserAccessToken;
  private String twitterUserAccessTokenSecret;
  private String wipDescription;
  private int wipId;
  private ProjectModule wipImageFile;
  private String wipTags;
  private String wipTitle;
  
  public BehanceSDKPublishWIPServiceParamsDTO() {}
  
  public String getAppClientId()
  {
    return appClientId;
  }
  
  public Class<? extends Activity> getNotificationHandlerActivity()
  {
    return notificationHandlerActivity;
  }
  
  public String getTwitterConsumerKey()
  {
    return twitterConsumerKey;
  }
  
  public String getTwitterConsumerSecret()
  {
    return twitterConsumerSecret;
  }
  
  public String getTwitterUserAccessToken()
  {
    return twitterUserAccessToken;
  }
  
  public String getTwitterUserAccessTokenSecret()
  {
    return twitterUserAccessTokenSecret;
  }
  
  public String getWipDescription()
  {
    return wipDescription;
  }
  
  public int getWipId()
  {
    return wipId;
  }
  
  public ProjectModule getWipImageFile()
  {
    return wipImageFile;
  }
  
  public String getWipTags()
  {
    return wipTags;
  }
  
  public String getWipTitle()
  {
    return wipTitle;
  }
  
  public boolean isContainsAdultContent()
  {
    return containsAdultContent;
  }
  
  public boolean isShareOnFacebook()
  {
    return shareOnFacebook;
  }
  
  public boolean isShareOnTwitter()
  {
    return shareOnTwitter;
  }
  
  public void setAppClientId(String paramString)
  {
    appClientId = paramString;
  }
  
  public void setContainsAdultContent(boolean paramBoolean)
  {
    containsAdultContent = paramBoolean;
  }
  
  public void setNotificationHandlerActivity(Class<? extends Activity> paramClass)
  {
    notificationHandlerActivity = paramClass;
  }
  
  public void setShareOnFacebook(boolean paramBoolean)
  {
    shareOnFacebook = paramBoolean;
  }
  
  public void setShareOnTwitter(boolean paramBoolean)
  {
    shareOnTwitter = paramBoolean;
  }
  
  public void setTwitterConsumerKey(String paramString)
  {
    twitterConsumerKey = paramString;
  }
  
  public void setTwitterConsumerSecret(String paramString)
  {
    twitterConsumerSecret = paramString;
  }
  
  public void setTwitterUserAccessToken(String paramString)
  {
    twitterUserAccessToken = paramString;
  }
  
  public void setTwitterUserAccessTokenSecret(String paramString)
  {
    twitterUserAccessTokenSecret = paramString;
  }
  
  public void setWipDescription(String paramString)
  {
    wipDescription = paramString;
  }
  
  public void setWipId(int paramInt)
  {
    wipId = paramInt;
  }
  
  public void setWipImageFile(ProjectModule paramProjectModule)
  {
    wipImageFile = paramProjectModule;
  }
  
  public void setWipTags(String paramString)
  {
    wipTags = paramString;
  }
  
  public void setWipTitle(String paramString)
  {
    wipTitle = paramString;
  }
}
