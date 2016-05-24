package com.facebook.model;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public abstract interface OpenGraphObject
  extends GraphObject
{
  public abstract GraphObject getApplication();
  
  public abstract GraphObjectList<GraphObject> getAudio();
  
  @PropertyName("fbsdk:create_object")
  public abstract boolean getCreateObject();
  
  public abstract Date getCreatedTime();
  
  public abstract GraphObject getData();
  
  public abstract String getDescription();
  
  public abstract String getDeterminer();
  
  public abstract String getId();
  
  public abstract GraphObjectList<GraphObject> getImage();
  
  public abstract boolean getIsScraped();
  
  public abstract String getPostActionId();
  
  public abstract List<String> getSeeAlso();
  
  public abstract String getSiteName();
  
  public abstract String getTitle();
  
  public abstract String getType();
  
  public abstract Date getUpdatedTime();
  
  public abstract String getUrl();
  
  public abstract GraphObjectList<GraphObject> getVideo();
  
  public abstract void setApplication(GraphObject paramGraphObject);
  
  public abstract void setAudio(GraphObjectList<GraphObject> paramGraphObjectList);
  
  @PropertyName("fbsdk:create_object")
  public abstract void setCreateObject(boolean paramBoolean);
  
  public abstract void setCreatedTime(Date paramDate);
  
  public abstract void setData(GraphObject paramGraphObject);
  
  public abstract void setDescription(String paramString);
  
  public abstract void setDeterminer(String paramString);
  
  public abstract void setId(String paramString);
  
  public abstract void setImage(GraphObjectList<GraphObject> paramGraphObjectList);
  
  @CreateGraphObject("url")
  @PropertyName("image")
  public abstract void setImageUrls(List<String> paramList);
  
  public abstract void setIsScraped(boolean paramBoolean);
  
  public abstract void setPostActionId(String paramString);
  
  public abstract void setSeeAlso(List<String> paramList);
  
  public abstract void setSiteName(String paramString);
  
  public abstract void setTitle(String paramString);
  
  public abstract void setType(String paramString);
  
  public abstract void setUpdatedTime(Date paramDate);
  
  public abstract void setUrl(String paramString);
  
  public abstract void setVideo(GraphObjectList<GraphObject> paramGraphObjectList);
  
  public static final class Factory
  {
    public Factory() {}
    
    public static <T extends OpenGraphObject> T createForPost(Class<T> paramClass, String paramString)
    {
      return createForPost(paramClass, paramString, null, null, null, null);
    }
    
    public static <T extends OpenGraphObject> T createForPost(Class<T> paramClass, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
    {
      paramClass = (OpenGraphObject)GraphObject.Factory.create(paramClass);
      if (paramString1 != null) {
        paramClass.setType(paramString1);
      }
      if (paramString2 != null) {
        paramClass.setTitle(paramString2);
      }
      if (paramString3 != null) {
        paramClass.setImageUrls(Arrays.asList(new String[] { paramString3 }));
      }
      if (paramString4 != null) {
        paramClass.setUrl(paramString4);
      }
      if (paramString5 != null) {
        paramClass.setDescription(paramString5);
      }
      paramClass.setCreateObject(true);
      paramClass.setData(GraphObject.Factory.create());
      return paramClass;
    }
    
    public static OpenGraphObject createForPost(String paramString)
    {
      return createForPost(OpenGraphObject.class, paramString);
    }
  }
}
