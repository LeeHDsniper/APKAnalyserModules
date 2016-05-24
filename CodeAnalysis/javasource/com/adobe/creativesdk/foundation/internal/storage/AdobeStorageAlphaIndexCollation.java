package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.util.ArrayList;

public class AdobeStorageAlphaIndexCollation
  extends AdobeStorageSortIndexCollation
{
  ArrayList<String> indexTitles;
  
  public AdobeStorageAlphaIndexCollation() {}
  
  public boolean createSectionDataFromMaster(ArrayList<AdobeAsset> paramArrayList)
  {
    sectionDataArray = new ArrayList();
    indexTitles = new ArrayList();
    if (paramArrayList == null) {
      return false;
    }
    int i = 0;
    if (i < paramArrayList.size())
    {
      Object localObject = (AdobeAsset)paramArrayList.get(i);
      AdobeStorageItemSectionData localAdobeStorageItemSectionData = new AdobeStorageItemSectionData();
      item = ((AdobeAsset)localObject);
      name = ((AdobeAsset)localObject).getName();
      originalIndex = i;
      localObject = "" + Character.toUpperCase(((AdobeAsset)localObject).getName().charAt(0));
      ArrayList localArrayList = new ArrayList();
      if (!indexTitles.contains(localObject))
      {
        sectionNumber = sectionDataArray.size();
        localArrayList.add(localAdobeStorageItemSectionData);
        sectionDataArray.add(localArrayList);
        indexTitles.add(localObject);
      }
      for (;;)
      {
        i += 1;
        break;
        int j = indexTitles.indexOf(localObject);
        localObject = (ArrayList)sectionDataArray.get(j);
        sectionNumber = ((ArrayList)localObject).size();
        ((ArrayList)localObject).add(localAdobeStorageItemSectionData);
        sectionDataArray.set(j, localObject);
      }
    }
    return true;
  }
  
  public ArrayList<String> sectionTitles()
  {
    return indexTitles;
  }
}
