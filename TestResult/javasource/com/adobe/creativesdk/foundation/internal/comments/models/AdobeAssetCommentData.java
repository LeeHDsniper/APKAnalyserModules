package com.adobe.creativesdk.foundation.internal.comments.models;

public class AdobeAssetCommentData
{
  private String avatarURL;
  private String commentURL;
  private String content;
  private String resourceURL;
  private long timeStamp;
  private String userName;
  
  public AdobeAssetCommentData(String paramString1, String paramString2, long paramLong, String paramString3, String paramString4, String paramString5)
  {
    userName = paramString1;
    content = paramString2;
    avatarURL = paramString3;
    commentURL = paramString4;
    resourceURL = paramString5;
    timeStamp = paramLong;
  }
  
  public String getAvatarURL()
  {
    return avatarURL;
  }
  
  public String getComment()
  {
    return content;
  }
  
  public String getCommentURL()
  {
    return commentURL;
  }
  
  public long getTimeStamp()
  {
    return timeStamp;
  }
  
  public String getUserName()
  {
    return userName;
  }
}
