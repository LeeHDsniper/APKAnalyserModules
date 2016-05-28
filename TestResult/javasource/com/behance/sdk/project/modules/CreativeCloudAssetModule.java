package com.behance.sdk.project.modules;

import com.behance.sdk.util.BehanceSDKUtils;
import java.io.File;

public class CreativeCloudAssetModule
  extends ImageModule
{
  private static final long serialVersionUID = 7358646255323338637L;
  
  public CreativeCloudAssetModule(File paramFile)
  {
    super(paramFile);
  }
  
  public void deleteFromFileSystem()
  {
    BehanceSDKUtils.deleteRecursive(getFile());
  }
  
  public ProjectModuleTypes getType()
  {
    return ProjectModuleTypes.CREATIVECLOUD_ASSET;
  }
}
