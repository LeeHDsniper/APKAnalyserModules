package com.localytics.android;

import java.util.Map;

final class JavaScriptClient
{
  private Map<Integer, AmpCallable> mCallbacks;
  
  public JavaScriptClient(Map<Integer, AmpCallable> paramMap)
  {
    mCallbacks = paramMap;
  }
  
  private Object invoke(int paramInt, Object[] paramArrayOfObject)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (mCallbacks != null)
    {
      AmpCallable localAmpCallable = (AmpCallable)mCallbacks.get(Integer.valueOf(paramInt));
      localObject1 = localObject2;
      if (localAmpCallable != null) {
        localObject1 = localAmpCallable.call(paramArrayOfObject);
      }
    }
    return localObject1;
  }
  
  public String getAttributes()
  {
    return (String)invoke(7, null);
  }
  
  public Map<Integer, AmpCallable> getCallbacks()
  {
    return mCallbacks;
  }
  
  public String getCustomDimensions()
  {
    return (String)invoke(6, null);
  }
  
  public String getIdentifiers()
  {
    return (String)invoke(5, null);
  }
  
  public String getJsGlueCode()
  {
    return String.format("javascript:(function() {  var localyticsScript = document.createElement('script');  localyticsScript.type = 'text/javascript';  localyticsScript.text = ' \t localytics.identifers = %s;\t localytics.customDimensions = %s;\t localytics.attributes = %s;    localytics.tagEvent = function(event, attributes, customDimensions, customerValueIncrease) {\t   localytics.nativeTagEvent(event, JSON.stringify(attributes), JSON.stringify(customDimensions), customerValueIncrease);    };    localytics.setCustomDimension = function(number, value) {      if (number != null && value != null)        localytics.nativeSetCustomDimension(number, value);    };    window.open = function(url) {      if (url != null)        localytics.navigate(url);    };    localytics.close = function() {      localytics.nativeClose();    };';  document.getElementsByTagName('body')[0].appendChild(localyticsScript);})()", new Object[] { getIdentifiers(), getCustomDimensions(), getAttributes() });
  }
}
