package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.util.ArrayList;

public abstract class AdobeStorageSortIndexCollation
{
  public AdobeUXAssetBrowserCommonTypes.AdobeUXAssetBrowserSortState currentSortState = AdobeCommonLearnedSettings.lastSortState();
  public ArrayList<ArrayList<AdobeStorageItemSectionData>> sectionDataArray = new ArrayList();
  
  protected AdobeStorageSortIndexCollation() {}
  
  public abstract boolean createSectionDataFromMaster(ArrayList<AdobeAsset> paramArrayList);
  
  public ArrayList<AdobeAsset> flattenedItems()
  {
    ArrayList localArrayList1 = new ArrayList();
    int i = 0;
    while (i < sectionDataArray.size())
    {
      ArrayList localArrayList2 = (ArrayList)sectionDataArray.get(i);
      int j = 0;
      while (j < localArrayList2.size())
      {
        localArrayList1.add(getitem);
        j += 1;
      }
      i += 1;
    }
    return localArrayList1;
  }
  
  public ArrayList<AdobeAsset> getFlattenedAssetsItemsList()
  {
    ArrayList localArrayList1 = new ArrayList();
    int i = 0;
    while (i < sectionDataArray.size())
    {
      ArrayList localArrayList2 = (ArrayList)sectionDataArray.get(i);
      int j = 0;
      while (j < localArrayList2.size())
      {
        localArrayList1.add(getitem);
        j += 1;
      }
      i += 1;
    }
    return localArrayList1;
  }
  
  public int getSectionForPosition(int paramInt)
  {
    int j = 0;
    int i = 0;
    while (i < sectionDataArray.size())
    {
      int k = ((ArrayList)sectionDataArray.get(i)).size();
      if ((paramInt >= j) && (paramInt < j + k)) {
        return i;
      }
      j += k;
      i += 1;
    }
    return -1;
  }
  
  public int numberOfSections()
  {
    return sectionDataArray.size();
  }
  
  public abstract ArrayList<String> sectionTitles();
}
