package com.behance.sdk;

import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import java.io.File;

public class BehanceSDKProjectDraftOptions
{
  private File coverImage;
  private String creativeFields;
  private boolean projectContainsAdultContent;
  private BehanceSDKCopyrightOption projectCopyrightSettings;
  private String projectDescription;
  private String projectTags;
  private String projectTitle;
  
  public File getCoverImage()
  {
    return coverImage;
  }
  
  public String getCreativeFields()
  {
    return creativeFields;
  }
  
  public BehanceSDKCopyrightOption getProjectCopyrightSettings()
  {
    return projectCopyrightSettings;
  }
  
  public String getProjectDescription()
  {
    return projectDescription;
  }
  
  public String getProjectTags()
  {
    return projectTags;
  }
  
  public String getProjectTitle()
  {
    return projectTitle;
  }
  
  public boolean isProjectContainsAdultContent()
  {
    return projectContainsAdultContent;
  }
}
