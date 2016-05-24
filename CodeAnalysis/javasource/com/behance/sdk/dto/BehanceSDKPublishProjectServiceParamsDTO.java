package com.behance.sdk.dto;

import android.app.Activity;
import com.behance.sdk.project.modules.ProjectModule;
import java.io.Serializable;
import java.util.List;

public class BehanceSDKPublishProjectServiceParamsDTO
  implements Serializable
{
  private static final long serialVersionUID = -2119047587175999029L;
  private String appClientId;
  private Class<? extends Activity> notificationHandlerActivity;
  private boolean projectContainsAdultContent;
  private String projectCopyright;
  private byte[] projectCoverImageByteArray;
  private String projectCoverImageFileName;
  private String projectCreativeFields;
  private String projectDescription;
  private List<ProjectModule> projectModules;
  private String projectTags;
  private String projectTitle;
  private boolean shareOnFacebook;
  private boolean shareOnTwitter;
  private String twitterConsumerKey;
  private String twitterConsumerSecret;
  private String twitterUserAccessToken;
  private String twitterUserAccessTokenSecret;
  
  public BehanceSDKPublishProjectServiceParamsDTO() {}
  
  public String getAppClientId()
  {
    return appClientId;
  }
  
  public Class<? extends Activity> getNotificationHandlerActivity()
  {
    return notificationHandlerActivity;
  }
  
  public String getProjectCopyright()
  {
    return projectCopyright;
  }
  
  public byte[] getProjectCoverImageByteArray()
  {
    return projectCoverImageByteArray;
  }
  
  public String getProjectCoverImageFileName()
  {
    return projectCoverImageFileName;
  }
  
  public String getProjectCreativeFields()
  {
    return projectCreativeFields;
  }
  
  public String getProjectDescription()
  {
    return projectDescription;
  }
  
  public List<ProjectModule> getProjectModules()
  {
    return projectModules;
  }
  
  public String getProjectTags()
  {
    return projectTags;
  }
  
  public String getProjectTitle()
  {
    return projectTitle;
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
  
  public boolean isProjectContainsAdultContent()
  {
    return projectContainsAdultContent;
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
  
  public void setNotificationHandlerActivity(Class<? extends Activity> paramClass)
  {
    notificationHandlerActivity = paramClass;
  }
  
  public void setProjectContainsAdultContent(boolean paramBoolean)
  {
    projectContainsAdultContent = paramBoolean;
  }
  
  public void setProjectCopyright(String paramString)
  {
    projectCopyright = paramString;
  }
  
  public void setProjectCoverImageByteArray(byte[] paramArrayOfByte)
  {
    projectCoverImageByteArray = paramArrayOfByte;
  }
  
  public void setProjectCoverImageFileName(String paramString)
  {
    projectCoverImageFileName = paramString;
  }
  
  public void setProjectCreativeFields(String paramString)
  {
    projectCreativeFields = paramString;
  }
  
  public void setProjectDescription(String paramString)
  {
    projectDescription = paramString;
  }
  
  public void setProjectModules(List<ProjectModule> paramList)
  {
    projectModules = paramList;
  }
  
  public void setProjectTags(String paramString)
  {
    projectTags = paramString;
  }
  
  public void setProjectTitle(String paramString)
  {
    projectTitle = paramString;
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
}
