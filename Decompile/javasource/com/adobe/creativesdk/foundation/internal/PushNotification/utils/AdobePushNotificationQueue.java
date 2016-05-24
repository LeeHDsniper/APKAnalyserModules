package com.adobe.creativesdk.foundation.internal.PushNotification.utils;

import com.adobe.creativesdk.foundation.internal.PushNotification.model.AdobePushNotification;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobePushNotificationQueue
{
  public static AdobePushNotificationQueue _pushNotificationQueue;
  private HashMap<String, AdobePushNotification> _notificationMap = new HashMap();
  
  private AdobePushNotificationQueue() {}
  
  public static AdobePushNotificationQueue getPushNotificationQueue()
  {
    if (_pushNotificationQueue == null) {
      _pushNotificationQueue = new AdobePushNotificationQueue();
    }
    return _pushNotificationQueue;
  }
  
  public ArrayList<AdobePushNotification> getReadNotificationsList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = _notificationMap.values().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((AdobePushNotification)localIterator.next());
    }
    return localArrayList;
  }
  
  public void handleNotificationResponse(JSONObject paramJSONObject)
  {
    try
    {
      paramJSONObject = paramJSONObject.getJSONObject("notifications").getJSONArray("notification");
      int i = 0;
      while (i < paramJSONObject.length())
      {
        String str = paramJSONObject.getJSONObject(i).getString("notification-id");
        _notificationMap.remove(str);
        i += 1;
      }
      return;
    }
    catch (JSONException paramJSONObject)
    {
      paramJSONObject.printStackTrace();
    }
  }
  
  public void putNotificationInQueue(ArrayList<AdobePushNotification> paramArrayList)
  {
    int i = 0;
    while (i < paramArrayList.size())
    {
      _notificationMap.put(((AdobePushNotification)paramArrayList.get(i)).getNotificationID(), paramArrayList.get(i));
      i += 1;
    }
  }
}
