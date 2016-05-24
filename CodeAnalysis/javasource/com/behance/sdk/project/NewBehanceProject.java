package com.behance.sdk.project;

import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.project.modules.CoverImage;
import com.behance.sdk.project.modules.EmbedModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class NewBehanceProject
  implements Serializable
{
  private static final long serialVersionUID = -1163691639211926852L;
  private int containAdultContent = 0;
  private BehanceSDKCopyrightOption copyRight = BehanceSDKCopyrightOption.getDefaultValue();
  private CoverImage cover;
  private String description;
  private int embedModuleCount = 0;
  private List<BehanceSDKCreativeFieldDTO> fields;
  private String projectID;
  private List<ProjectModule> projectModules = new ArrayList(4);
  private String projectURL;
  private boolean shareOnFaceBook;
  private boolean shareOnTwitter;
  private String tags;
  private String title;
  
  public NewBehanceProject() {}
  
  public void addImagesToProject(List<? extends ImageModule> paramList)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      ImageModule localImageModule = (ImageModule)paramList.next();
      if (!projectModules.contains(localImageModule)) {
        addProjectModule(localImageModule);
      }
    }
  }
  
  public void addProjectModule(ProjectModule paramProjectModule)
  {
    if (!projectModules.contains(paramProjectModule))
    {
      projectModules.add(paramProjectModule);
      if (paramProjectModule.getType() == ProjectModuleTypes.EMBED)
      {
        paramProjectModule = (EmbedModule)paramProjectModule;
        int i = embedModuleCount + 1;
        embedModuleCount = i;
        paramProjectModule.setOrder(i);
      }
    }
  }
  
  public void clear()
  {
    if (cover != null) {
      cover.remove();
    }
    Iterator localIterator = projectModules.iterator();
    while (localIterator.hasNext()) {
      ((ProjectModule)localIterator.next()).clear();
    }
  }
  
  public BehanceSDKCopyrightOption getCopyRight()
  {
    return copyRight;
  }
  
  public CoverImage getCoverImage()
  {
    return cover;
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public List<BehanceSDKCreativeFieldDTO> getFields()
  {
    return fields;
  }
  
  public List<ImageModule> getImageModules()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = projectModules.iterator();
    while (localIterator.hasNext())
    {
      ProjectModule localProjectModule = (ProjectModule)localIterator.next();
      ProjectModuleTypes localProjectModuleTypes = localProjectModule.getType();
      if ((localProjectModuleTypes == ProjectModuleTypes.IMAGE) || (localProjectModuleTypes == ProjectModuleTypes.CREATIVECLOUD_ASSET)) {
        localArrayList.add((ImageModule)localProjectModule);
      }
    }
    return localArrayList;
  }
  
  public int getNumberOfProjectModules()
  {
    return projectModules.size();
  }
  
  public List<ProjectModule> getProjectModules()
  {
    return projectModules;
  }
  
  public boolean getShareOnFaceBook()
  {
    return shareOnFaceBook;
  }
  
  public boolean getShareOnTwitter()
  {
    return shareOnTwitter;
  }
  
  public String getTags()
  {
    return tags;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public boolean isEmpty()
  {
    return getNumberOfProjectModules() == 0;
  }
  
  public boolean isProjectContainsAdultContent()
  {
    return 1 == containAdultContent;
  }
  
  public void markProjectForAdultContent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      containAdultContent = 1;
      return;
    }
    containAdultContent = 0;
  }
  
  public void removeAllImageModules()
  {
    List localList = getImageModules();
    projectModules.removeAll(localList);
  }
  
  public void removeProjectModules(ProjectModule paramProjectModule)
  {
    if (projectModules != null) {
      projectModules.remove(paramProjectModule);
    }
  }
  
  public void reorderSelectedModules(int paramInt1, int paramInt2)
  {
    ProjectModule localProjectModule = (ProjectModule)projectModules.remove(paramInt1);
    projectModules.add(paramInt2, localProjectModule);
  }
  
  public void setCopyRight(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption)
  {
    copyRight = paramBehanceSDKCopyrightOption;
  }
  
  public void setCoverImage(CoverImage paramCoverImage)
  {
    cover = paramCoverImage;
  }
  
  public void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public void setFields(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    fields = paramList;
  }
  
  public void setShareOnFaceBook(boolean paramBoolean)
  {
    shareOnFaceBook = paramBoolean;
  }
  
  public void setShareOnTwitter(boolean paramBoolean)
  {
    shareOnTwitter = paramBoolean;
  }
  
  public void setTags(String paramString)
  {
    tags = paramString;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
}
