package com.adobe.creativesdk.foundation.internal.notification;

import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeLocalNotificationCenter
{
  private static AdobeLocalNotificationCenter staticNotificationCenter = null;
  Map<IAdobeNotificationID, ObservableWrapper> _observables = null;
  
  public AdobeLocalNotificationCenter() {}
  
  public static AdobeLocalNotificationCenter getDefaultNotificationCenter()
  {
    try
    {
      if (staticNotificationCenter == null) {
        staticNotificationCenter = new AdobeLocalNotificationCenter();
      }
      AdobeLocalNotificationCenter localAdobeLocalNotificationCenter = staticNotificationCenter;
      return localAdobeLocalNotificationCenter;
    }
    finally {}
  }
  
  public void addObserver(IAdobeNotificationID paramIAdobeNotificationID, Observer paramObserver)
  {
    try
    {
      ObservableWrapper localObservableWrapper2 = (ObservableWrapper)_observables.get(paramIAdobeNotificationID);
      ObservableWrapper localObservableWrapper1 = localObservableWrapper2;
      if (localObservableWrapper2 == null)
      {
        localObservableWrapper1 = new ObservableWrapper(null);
        _observables.put(paramIAdobeNotificationID, localObservableWrapper1);
      }
      localObservableWrapper1.addObserver(paramObserver);
      return;
    }
    finally {}
  }
  
  public void postNotification(AdobeNotification paramAdobeNotification)
  {
    try
    {
      ObservableWrapper localObservableWrapper = (ObservableWrapper)_observables.get(paramAdobeNotification.getId());
      if (localObservableWrapper != null)
      {
        localObservableWrapper.markChanged();
        localObservableWrapper.notifyObservers(paramAdobeNotification);
      }
      return;
    }
    finally {}
  }
  
  public void removeObserver(IAdobeNotificationID paramIAdobeNotificationID, Observer paramObserver)
  {
    try
    {
      paramIAdobeNotificationID = (ObservableWrapper)_observables.get(paramIAdobeNotificationID);
      if (paramIAdobeNotificationID != null) {
        paramIAdobeNotificationID.deleteObserver(paramObserver);
      }
      return;
    }
    finally {}
  }
  
  private static class ObservableWrapper
    extends Observable
  {
    private ObservableWrapper() {}
    
    public void markChanged()
    {
      setChanged();
    }
  }
}
