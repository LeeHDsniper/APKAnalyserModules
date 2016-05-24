package com.adobe.creativesdk.foundation.internal.storage.controllers.commands;

import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import java.util.EnumSet;
import java.util.Iterator;

public class AdobeAssetViewCommandsHandler
{
  IAdobeAssetViewCommandHandler _commonHandler;
  
  public AdobeAssetViewCommandsHandler() {}
  
  private void RegisterUnRegisterCommands(boolean paramBoolean)
  {
    Iterator localIterator = getCommandsListToRegister().iterator();
    while (localIterator.hasNext())
    {
      AdobeAssetViewBrowserCommandName localAdobeAssetViewBrowserCommandName = (AdobeAssetViewBrowserCommandName)localIterator.next();
      if (paramBoolean) {
        AdobeAssetBrowserCommandMgr.getInstance().addHandler(localAdobeAssetViewBrowserCommandName, _commonHandler);
      } else {
        AdobeAssetBrowserCommandMgr.getInstance().removeHandler(localAdobeAssetViewBrowserCommandName, _commonHandler);
      }
    }
  }
  
  protected void HandleCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject) {}
  
  protected void RegisterCommandHandlers()
  {
    if (_commonHandler == null) {
      _commonHandler = new IAdobeAssetViewCommandHandler()
      {
        public void handle(AdobeAssetViewBrowserCommandName paramAnonymousAdobeAssetViewBrowserCommandName, Object paramAnonymousObject)
        {
          HandleCommand(paramAnonymousAdobeAssetViewBrowserCommandName, paramAnonymousObject);
        }
      };
    }
    RegisterUnRegisterCommands(true);
  }
  
  protected void UnRegisterCommandHandlers()
  {
    RegisterUnRegisterCommands(false);
  }
  
  protected EnumSet<AdobeAssetViewBrowserCommandName> getCommandsListToRegister()
  {
    return null;
  }
  
  public void onStart()
  {
    RegisterCommandHandlers();
  }
  
  public void onStop()
  {
    UnRegisterCommandHandlers();
  }
}
