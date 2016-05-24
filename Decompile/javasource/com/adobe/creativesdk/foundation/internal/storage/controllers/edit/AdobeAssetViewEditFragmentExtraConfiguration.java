package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import java.util.HashMap;

public class AdobeAssetViewEditFragmentExtraConfiguration
{
  private HashMap<String, Object> _configuration = new HashMap();
  
  public AdobeAssetViewEditFragmentExtraConfiguration() {}
  
  public boolean getMoveButton()
  {
    if (_configuration.containsKey("CREATE_MOVE_BUTTON")) {
      return ((Boolean)_configuration.get("CREATE_MOVE_BUTTON")).booleanValue();
    }
    return false;
  }
  
  public void setMoveButton(boolean paramBoolean)
  {
    _configuration.put("CREATE_MOVE_BUTTON", Boolean.valueOf(paramBoolean));
  }
  
  public void setShouldShowOnlyFolders(boolean paramBoolean)
  {
    _configuration.put("SHOULD_SHOW_ONLY_FOLDERS", Boolean.valueOf(paramBoolean));
  }
  
  public boolean shouldShowOnlyFolders()
  {
    if (_configuration.containsKey("SHOULD_SHOW_ONLY_FOLDERS")) {
      return ((Boolean)_configuration.get("SHOULD_SHOW_ONLY_FOLDERS")).booleanValue();
    }
    return false;
  }
}
