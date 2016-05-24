package com.behance.sdk.managers;

import android.app.Activity;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.project.NewBehanceProject;
import com.behance.sdk.project.modules.CoverImage;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class BehanceSDKProjectPublishWFManager
{
  private static final BehanceSDKProjectPublishWFManager INSTANCE = new BehanceSDKProjectPublishWFManager();
  private List<CoverImageChangeListener> coverImageChangeListeners = new ArrayList(2);
  private NewBehanceProject currentBehanceProject;
  private boolean hideFacebookSharing;
  private boolean hideTwitterSharing;
  private Class<? extends Activity> notificationHandlerActivityClass;
  private List<ProjectModuleChangeListener> projectModuleChangeListeners = new ArrayList(2);
  private List<ImageModule> selectedImagesForCover;
  private IBehanceSDKUserCredentials userCredentials;
  
  private BehanceSDKProjectPublishWFManager() {}
  
  public static BehanceSDKProjectPublishWFManager getInstance()
  {
    return INSTANCE;
  }
  
  private void notifyListeners()
  {
    Iterator localIterator = projectModuleChangeListeners.iterator();
    while (localIterator.hasNext()) {
      ((ProjectModuleChangeListener)localIterator.next()).projectModulesChanged(currentBehanceProject.getProjectModules());
    }
  }
  
  public void addCoverImageChangeListener(CoverImageChangeListener paramCoverImageChangeListener)
  {
    if (!coverImageChangeListeners.contains(paramCoverImageChangeListener)) {
      coverImageChangeListeners.add(paramCoverImageChangeListener);
    }
  }
  
  public void addImageSelectedForProject(File paramFile)
  {
    if (currentBehanceProject == null) {
      initializeProject();
    }
    paramFile = new ImageModule(paramFile);
    currentBehanceProject.addProjectModule(paramFile);
    notifyListeners();
  }
  
  public void addImagesSelectedForCover(List<ImageModule> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      if (selectedImagesForCover == null) {
        selectedImagesForCover = new ArrayList(paramList.size());
      }
      selectedImagesForCover.addAll(paramList);
    }
  }
  
  public void addImagesSelectedForProject(List<ImageModule> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      if (currentBehanceProject == null) {
        initializeProject();
      }
      currentBehanceProject.addImagesToProject(paramList);
      notifyListeners();
    }
    while (currentBehanceProject == null) {
      return;
    }
    currentBehanceProject.removeAllImageModules();
    notifyListeners();
  }
  
  public void addModuleToCurrentProject(ProjectModule paramProjectModule)
  {
    if (currentBehanceProject == null) {
      initializeProject();
    }
    currentBehanceProject.addProjectModule(paramProjectModule);
    notifyListeners();
  }
  
  public void addProjectModuleChangeListener(ProjectModuleChangeListener paramProjectModuleChangeListener)
  {
    if (!projectModuleChangeListeners.contains(paramProjectModuleChangeListener)) {
      projectModuleChangeListeners.add(paramProjectModuleChangeListener);
    }
  }
  
  public void cancelWorkflow()
  {
    Object localObject = getImagesSelectedForProject();
    if ((localObject != null) && (!((List)localObject).isEmpty()))
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        ImageModule localImageModule = (ImageModule)((Iterator)localObject).next();
        if (ProjectModuleTypes.CREATIVECLOUD_ASSET == localImageModule.getType()) {
          localImageModule.deleteFromFileSystem();
        }
      }
    }
    finishWorkflow();
  }
  
  public void clearImagesSelectedForCover()
  {
    if (selectedImagesForCover != null)
    {
      List localList = currentBehanceProject.getImageModules();
      Iterator localIterator = selectedImagesForCover.iterator();
      while (localIterator.hasNext())
      {
        ProjectModule localProjectModule = (ProjectModule)localIterator.next();
        if ((localProjectModule.getType() == ProjectModuleTypes.CREATIVECLOUD_ASSET) && (!localList.contains(localProjectModule))) {
          localProjectModule.deleteFromFileSystem();
        }
      }
      selectedImagesForCover.clear();
      selectedImagesForCover = null;
    }
  }
  
  public void finishWorkflow()
  {
    clearImagesSelectedForCover();
    removeAllModuleChangeListeners();
    setUserCredentials(null);
    if (currentBehanceProject != null)
    {
      currentBehanceProject.clear();
      currentBehanceProject = null;
    }
  }
  
  public BehanceSDKCopyrightOption getCopyrightOption()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getCopyRight();
    }
    return BehanceSDKCopyrightOption.BY_NC;
  }
  
  public List<ImageModule> getImagesSelectedForCover()
  {
    ArrayList localArrayList = new ArrayList();
    if (currentBehanceProject != null)
    {
      List localList = currentBehanceProject.getImageModules();
      if ((localList != null) && (!localList.isEmpty())) {
        localArrayList.addAll(localList);
      }
    }
    if ((selectedImagesForCover != null) && (!selectedImagesForCover.isEmpty())) {
      localArrayList.addAll(selectedImagesForCover);
    }
    return localArrayList;
  }
  
  public List<ImageModule> getImagesSelectedForProject()
  {
    List localList = null;
    if (currentBehanceProject != null) {
      localList = currentBehanceProject.getImageModules();
    }
    return localList;
  }
  
  public Class<? extends Activity> getNotificationHandlerActivityClass()
  {
    return notificationHandlerActivityClass;
  }
  
  public String getProjectDescription()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getDescription();
    }
    return "";
  }
  
  public List<BehanceSDKCreativeFieldDTO> getProjectFields()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getFields();
    }
    return null;
  }
  
  public List<ProjectModule> getProjectModules()
  {
    if (currentBehanceProject == null) {
      return null;
    }
    return currentBehanceProject.getProjectModules();
  }
  
  public String getProjectTags()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getTags();
    }
    return null;
  }
  
  public String getProjectTitle()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getTitle();
    }
    return "";
  }
  
  public CoverImage getSelectedCoverImage()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getCoverImage();
    }
    return null;
  }
  
  public boolean getShareOnFaceBook()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getShareOnFaceBook();
    }
    return false;
  }
  
  public boolean getShareOnTwitter()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.getShareOnTwitter();
    }
    return false;
  }
  
  public IBehanceSDKUserCredentials getUserCredentials()
  {
    return userCredentials;
  }
  
  public void initializeProject()
  {
    if (currentBehanceProject == null) {
      currentBehanceProject = new NewBehanceProject();
    }
  }
  
  public boolean isEmptyProject()
  {
    return (currentBehanceProject == null) || (currentBehanceProject.isEmpty());
  }
  
  public boolean isHideFacebookSharing()
  {
    return hideFacebookSharing;
  }
  
  public boolean isHideTwitterSharing()
  {
    return hideTwitterSharing;
  }
  
  public boolean isProjectContainsAdultContent()
  {
    if (currentBehanceProject != null) {
      return currentBehanceProject.isProjectContainsAdultContent();
    }
    return false;
  }
  
  public void removeAllModuleChangeListeners()
  {
    if (projectModuleChangeListeners != null) {
      projectModuleChangeListeners.clear();
    }
  }
  
  public void removeCoverImageChangeListener(CoverImageChangeListener paramCoverImageChangeListener)
  {
    coverImageChangeListeners.remove(paramCoverImageChangeListener);
  }
  
  public void removeProjectModule(ProjectModule paramProjectModule)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.removeProjectModules(paramProjectModule);
    }
    if (paramProjectModule.getType() == ProjectModuleTypes.IMAGE) {
      ((ImageModule)paramProjectModule).recycleImageBitmap();
    }
    notifyListeners();
  }
  
  public void removeProjectModuleChangeListener(ProjectModuleChangeListener paramProjectModuleChangeListener)
  {
    projectModuleChangeListeners.remove(paramProjectModuleChangeListener);
  }
  
  public void reorderSelectedModules(int paramInt1, int paramInt2)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.reorderSelectedModules(paramInt1, paramInt2);
    }
    notifyListeners();
  }
  
  public void rotateImage(ImageModule paramImageModule)
  {
    paramImageModule.rotateImage();
    Iterator localIterator = projectModuleChangeListeners.iterator();
    while (localIterator.hasNext()) {
      ((ProjectModuleChangeListener)localIterator.next()).rotateImage(paramImageModule);
    }
  }
  
  public void setContainsAdultContent(boolean paramBoolean)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.markProjectForAdultContent(paramBoolean);
    }
  }
  
  public void setCopyrightOption(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setCopyRight(paramBehanceSDKCopyrightOption);
    }
  }
  
  public void setProjectDescription(String paramString)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setDescription(paramString);
    }
  }
  
  public void setProjectFields(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setFields(paramList);
    }
  }
  
  public void setProjectTags(String paramString)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setTags(paramString);
    }
  }
  
  public void setProjectTitle(String paramString)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setTitle(paramString);
    }
  }
  
  public void setSelectedCoverImage(CoverImage paramCoverImage)
  {
    currentBehanceProject.setCoverImage(paramCoverImage);
    if (coverImageChangeListeners != null)
    {
      Iterator localIterator = coverImageChangeListeners.iterator();
      while (localIterator.hasNext()) {
        ((CoverImageChangeListener)localIterator.next()).coverImageChanges(paramCoverImage);
      }
    }
  }
  
  public void setShareOnFaceBook(boolean paramBoolean)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setShareOnFaceBook(paramBoolean);
    }
  }
  
  public void setShareOnTwitter(boolean paramBoolean)
  {
    if (currentBehanceProject != null) {
      currentBehanceProject.setShareOnTwitter(paramBoolean);
    }
  }
  
  public void setUserCredentials(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    userCredentials = paramIBehanceSDKUserCredentials;
  }
  
  public static abstract interface CoverImageChangeListener
  {
    public abstract void coverImageChanges(CoverImage paramCoverImage);
  }
  
  public static abstract interface ProjectModuleChangeListener
  {
    public abstract void projectModulesChanged(List<ProjectModule> paramList);
    
    public abstract void rotateImage(ImageModule paramImageModule);
  }
}
