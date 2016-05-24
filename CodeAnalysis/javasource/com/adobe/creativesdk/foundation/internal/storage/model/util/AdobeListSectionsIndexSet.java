package com.adobe.creativesdk.foundation.internal.storage.model.util;

import java.util.HashSet;

public class AdobeListSectionsIndexSet
{
  private HashSet<Integer> _sectionIndexSet = new HashSet();
  
  public AdobeListSectionsIndexSet() {}
  
  public void add(int paramInt)
  {
    _sectionIndexSet.add(Integer.valueOf(paramInt));
  }
}
