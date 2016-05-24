package com.behance.sdk.dto.search;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKProjectDTO
  implements Serializable
{
  private static final long serialVersionUID = 8154753509352297004L;
  private boolean appreciatedByUser;
  private long appreciatedByUserOn;
  private BehanceSDKProjectCopyrightDTO copyright;
  private BehanceSDKProjectCoversDTO covers;
  private long createdDate;
  private String custom_css;
  private String description;
  private List<BehanceSDKProjectFeaturedDTO> features;
  private List<String> fields;
  private String html;
  private String id;
  private boolean isVisible = true;
  private String layoutHTMLPath;
  private String matureAccess;
  private boolean matureContent;
  private long modifiedDate;
  private List<BehanceSDKAbstractProjectModuleDTO> modules;
  private String name;
  private List<BehanceSDKUserDTO> owners;
  private String privacy;
  private String projectUrl;
  private boolean publicProject;
  private long publishedDate;
  private String shortUrl;
  private BehanceSDKProjectStatsDTO stats;
  private List<String> tags;
  
  public BehanceSDKProjectDTO() {}
  
  public void addFeature(BehanceSDKProjectFeaturedDTO paramBehanceSDKProjectFeaturedDTO)
  {
    if (features == null) {
      features = new ArrayList();
    }
    features.add(paramBehanceSDKProjectFeaturedDTO);
  }
  
  public void addModule(BehanceSDKAbstractProjectModuleDTO paramBehanceSDKAbstractProjectModuleDTO)
  {
    if (modules == null) {
      modules = new ArrayList();
    }
    modules.add(paramBehanceSDKAbstractProjectModuleDTO);
  }
  
  public void addOwner(BehanceSDKUserDTO paramBehanceSDKUserDTO)
  {
    if (owners == null) {
      owners = new ArrayList();
    }
    owners.add(paramBehanceSDKUserDTO);
  }
  
  public void addTag(String paramString)
  {
    if (tags == null) {
      tags = new ArrayList();
    }
    tags.add(paramString);
  }
  
  public void setCopyright(BehanceSDKProjectCopyrightDTO paramBehanceSDKProjectCopyrightDTO)
  {
    copyright = paramBehanceSDKProjectCopyrightDTO;
  }
  
  public void setCovers(BehanceSDKProjectCoversDTO paramBehanceSDKProjectCoversDTO)
  {
    covers = paramBehanceSDKProjectCoversDTO;
  }
  
  public void setCreatedDate(long paramLong)
  {
    createdDate = paramLong;
  }
  
  public void setCustomCSS(String paramString)
  {
    custom_css = paramString;
  }
  
  public void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public void setFields(List<String> paramList)
  {
    fields = paramList;
  }
  
  public void setHTML(String paramString)
  {
    html = paramString;
  }
  
  public void setId(String paramString)
  {
    id = paramString;
  }
  
  public void setMatureAccess(String paramString)
  {
    matureAccess = paramString;
  }
  
  public void setMatureContent(boolean paramBoolean)
  {
    matureContent = paramBoolean;
  }
  
  public void setModifiedDate(long paramLong)
  {
    modifiedDate = paramLong;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setPrivacy(String paramString)
  {
    privacy = paramString;
    setPublicProject("public".equalsIgnoreCase(paramString));
  }
  
  public void setPublicProject(boolean paramBoolean)
  {
    publicProject = paramBoolean;
  }
  
  public void setPublishedDate(long paramLong)
  {
    publishedDate = paramLong;
  }
  
  public void setShortUrl(String paramString)
  {
    shortUrl = paramString;
  }
  
  public void setStats(BehanceSDKProjectStatsDTO paramBehanceSDKProjectStatsDTO)
  {
    stats = paramBehanceSDKProjectStatsDTO;
  }
  
  public void setUrl(String paramString)
  {
    projectUrl = paramString;
  }
}
