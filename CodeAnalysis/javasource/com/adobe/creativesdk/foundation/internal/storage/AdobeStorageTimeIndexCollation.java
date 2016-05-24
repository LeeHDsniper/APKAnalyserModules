package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

public class AdobeStorageTimeIndexCollation
  extends AdobeStorageSortIndexCollation
{
  private ArrayList<String> sectionIndexTitlesArray;
  private ArrayList<String> sectionTitlesArray;
  
  public AdobeStorageTimeIndexCollation() {}
  
  private String ConvertDateToFormat(String paramString, Date paramDate)
  {
    return new SimpleDateFormat(paramString).format(paramDate);
  }
  
  private long calcDifferenceInDaysFromToday(Date paramDate, Calendar paramCalendar)
  {
    paramCalendar = paramCalendar.getTime();
    long l = paramDate.getTime();
    return (paramCalendar.getTime() - l) / 86400000L;
  }
  
  private void createSectionTitlesAndAssignSectionsToData(ArrayList<AdobeStorageItemSectionData> paramArrayList)
  {
    Calendar localCalendar1 = Calendar.getInstance();
    Locale.getDefault();
    localCalendar1.getTimeZone();
    int i2 = -1;
    int m = -1;
    int n = -1;
    int i11 = localCalendar1.get(1);
    int i12 = localCalendar1.get(2) + 1;
    int i13 = localCalendar1.get(5);
    int i = 0;
    int k = 0;
    int j = 0;
    Calendar localCalendar2 = Calendar.getInstance();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      AdobeStorageItemSectionData localAdobeStorageItemSectionData = (AdobeStorageItemSectionData)localIterator.next();
      Date localDate = modificationDate;
      if (localDate == null)
      {
        paramArrayList = AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UNKNOWN_DATE);
        sectionTitlesArray.add(paramArrayList);
        sectionIndexTitlesArray.add("U");
        sectionNumber = (sectionIndexTitlesArray.size() - 1);
      }
      else
      {
        localCalendar2.setTime(localDate);
        int i10 = localCalendar2.get(1);
        int i9 = localCalendar2.get(2) + 1;
        int i8 = localCalendar2.get(5);
        paramArrayList = null;
        String str = null;
        int i7;
        int i6;
        int i1;
        int i5;
        int i4;
        int i3;
        long l;
        if ((i10 == i2) && (i9 == m))
        {
          i7 = k;
          i6 = j;
          i1 = i;
          i5 = n;
          i4 = m;
          i3 = i2;
          if (i8 == n) {}
        }
        else
        {
          l = calcDifferenceInDaysFromToday(localDate, localCalendar1);
          if ((i10 != i11) || (i9 != i12) || (i8 != i13)) {
            break label365;
          }
          str = "TD";
          paramArrayList = AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_TODAY);
          i1 = i;
          n = j;
          m = k;
        }
        for (;;)
        {
          if (paramArrayList != null) {
            sectionTitlesArray.add(paramArrayList);
          }
          if (str != null) {
            sectionIndexTitlesArray.add(str);
          }
          i3 = i10;
          i4 = i9;
          i5 = i8;
          i6 = n;
          i7 = m;
          sectionNumber = (sectionTitlesArray.size() - 1);
          k = i7;
          j = i6;
          i = i1;
          n = i5;
          m = i4;
          i2 = i3;
          break;
          label365:
          if (l <= 6L)
          {
            m = k;
            n = j;
            i1 = i;
            if (i == 0)
            {
              i1 = 1;
              str = "TW";
              paramArrayList = AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_THIS_WEEK);
              m = k;
              n = j;
            }
          }
          else if (l <= 13L)
          {
            m = k;
            n = j;
            i1 = i;
            if (k == 0)
            {
              m = 1;
              str = "LW";
              paramArrayList = AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_LAST_WEEK);
              n = j;
              i1 = i;
            }
          }
          else if ((i10 == i11) && (i9 == i12))
          {
            m = k;
            n = j;
            i1 = i;
            if (j == 0)
            {
              n = 1;
              str = "TM";
              paramArrayList = AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_THIS_MONTH);
              m = k;
              i1 = i;
            }
          }
          else if ((i10 == i11) && (i9 != m))
          {
            str = ConvertDateToFormat("MM/yy", localDate);
            paramArrayList = String.format(AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_DATE), new Object[] { ConvertDateToFormat("MMMM yyyy", localDate).toUpperCase() });
            m = k;
            n = j;
            i1 = i;
          }
          else
          {
            m = k;
            n = j;
            i1 = i;
            if (i10 != i2)
            {
              str = ConvertDateToFormat("yy", localDate);
              paramArrayList = String.format(AdobeLocalizedMgr.getLocalizedString(R.string.IDS_CAPTION_COLLATION_UPDATED_DATE), new Object[] { ConvertDateToFormat("yyyy", localDate).toUpperCase() });
              m = k;
              n = j;
              i1 = i;
            }
          }
        }
      }
    }
  }
  
  public boolean createSectionDataFromMaster(ArrayList<AdobeAsset> paramArrayList)
  {
    sectionIndexTitlesArray = new ArrayList();
    sectionTitlesArray = new ArrayList();
    sectionDataArray = new ArrayList();
    Object localObject1 = new ArrayList();
    if (paramArrayList == null) {
      return false;
    }
    int i = 0;
    Object localObject2;
    while (i < paramArrayList.size())
    {
      localObject2 = (AdobeAsset)paramArrayList.get(i);
      AdobeStorageItemSectionData localAdobeStorageItemSectionData = new AdobeStorageItemSectionData();
      originalIndex = i;
      item = ((AdobeAsset)localObject2);
      name = ((AdobeAsset)localObject2).getName();
      modificationDate = ((AdobeAsset)localObject2).getModificationDate();
      if (((AdobeAsset)localObject2).getModificationDate() == null) {
        modificationDate = ((AdobeAsset)localObject2).getCreationDate();
      }
      ((ArrayList)localObject1).add(localAdobeStorageItemSectionData);
      i += 1;
    }
    createSectionTitlesAndAssignSectionsToData((ArrayList)localObject1);
    int j = sectionTitles().size();
    paramArrayList = new ArrayList();
    i = 0;
    while (i < j)
    {
      paramArrayList.add(new ArrayList());
      i += 1;
    }
    localObject1 = ((ArrayList)localObject1).iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (AdobeStorageItemSectionData)((Iterator)localObject1).next();
      ((ArrayList)paramArrayList.get(sectionNumber)).add(localObject2);
    }
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      localObject1 = (ArrayList)paramArrayList.next();
      sectionDataArray.add(localObject1);
    }
    return true;
  }
  
  public ArrayList<String> sectionTitles()
  {
    return sectionTitlesArray;
  }
}
