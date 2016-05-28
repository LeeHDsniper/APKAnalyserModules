package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.IAdobeAssetViewCommandHandler;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

public class AdobeAssetBrowserCommandMgr
{
  private static AdobeAssetBrowserCommandMgr _sInstance;
  Map<AdobeAssetViewBrowserCommandName, ObservableWrapper> _observables = null;
  
  AdobeAssetBrowserCommandMgr() {}
  
  public static AdobeAssetBrowserCommandMgr getInstance()
  {
    try
    {
      if (_sInstance == null) {
        _sInstance = new AdobeAssetBrowserCommandMgr();
      }
      AdobeAssetBrowserCommandMgr localAdobeAssetBrowserCommandMgr = _sInstance;
      return localAdobeAssetBrowserCommandMgr;
    }
    finally {}
  }
  
  public void addHandler(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, IAdobeAssetViewCommandHandler paramIAdobeAssetViewCommandHandler)
  {
    try
    {
      ObservableWrapper localObservableWrapper2 = (ObservableWrapper)_observables.get(paramAdobeAssetViewBrowserCommandName);
      ObservableWrapper localObservableWrapper1 = localObservableWrapper2;
      if (localObservableWrapper2 == null)
      {
        localObservableWrapper1 = new ObservableWrapper();
        _observables.put(paramAdobeAssetViewBrowserCommandName, localObservableWrapper1);
      }
      localObservableWrapper1.add(paramIAdobeAssetViewCommandHandler);
      return;
    }
    finally {}
  }
  
  public void postCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName)
  {
    postCommand(paramAdobeAssetViewBrowserCommandName, null);
  }
  
  public void postCommand(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
  {
    try
    {
      ObservableWrapper localObservableWrapper = (ObservableWrapper)_observables.get(paramAdobeAssetViewBrowserCommandName);
      if (localObservableWrapper != null) {
        localObservableWrapper.notify(paramAdobeAssetViewBrowserCommandName, paramObject);
      }
      return;
    }
    finally {}
  }
  
  public void removeHandler(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, IAdobeAssetViewCommandHandler paramIAdobeAssetViewCommandHandler)
  {
    try
    {
      paramAdobeAssetViewBrowserCommandName = (ObservableWrapper)_observables.get(paramAdobeAssetViewBrowserCommandName);
      if (paramAdobeAssetViewBrowserCommandName != null) {
        paramAdobeAssetViewBrowserCommandName.remove(paramIAdobeAssetViewCommandHandler);
      }
      return;
    }
    finally {}
  }
  
  private class ObservableWrapper
  {
    private ArrayList<IAdobeAssetViewCommandHandler> _handlers = new ArrayList();
    
    public ObservableWrapper() {}
    
    public void add(IAdobeAssetViewCommandHandler paramIAdobeAssetViewCommandHandler)
    {
      _handlers.add(paramIAdobeAssetViewCommandHandler);
    }
    
    public void notify(AdobeAssetViewBrowserCommandName paramAdobeAssetViewBrowserCommandName, Object paramObject)
    {
      Iterator localIterator = _handlers.iterator();
      while (localIterator.hasNext()) {
        ((IAdobeAssetViewCommandHandler)localIterator.next()).handle(paramAdobeAssetViewBrowserCommandName, paramObject);
      }
    }
    
    public void remove(IAdobeAssetViewCommandHandler paramIAdobeAssetViewCommandHandler)
    {
      _handlers.remove(paramIAdobeAssetViewCommandHandler);
    }
  }
}
