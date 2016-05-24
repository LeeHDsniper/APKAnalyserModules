package it.sephiroth.android.library.exif2;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

class IfdData
{
  private static final int[] sIfds = { 0, 1, 2, 3, 4 };
  private final Map<Short, ExifTag> mExifTags = new HashMap();
  private final int mIfdId;
  private int mOffsetToNextIfd = 0;
  
  IfdData(int paramInt)
  {
    mIfdId = paramInt;
  }
  
  protected static int[] getIfds()
  {
    return sIfds;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if (paramObject == null) {
      return false;
    }
    if ((paramObject instanceof IfdData))
    {
      paramObject = (IfdData)paramObject;
      if ((paramObject.getId() == mIfdId) && (paramObject.getTagCount() == getTagCount()))
      {
        paramObject = paramObject.getAllTags();
        int j = paramObject.length;
        int i = 0;
        label57:
        Object localObject;
        if (i < j)
        {
          localObject = paramObject[i];
          if (!ExifInterface.isOffsetTag(localObject.getTagId())) {
            break label85;
          }
        }
        label85:
        while (localObject.equals((ExifTag)mExifTags.get(Short.valueOf(localObject.getTagId()))))
        {
          i += 1;
          break label57;
          break;
        }
        return false;
      }
    }
    return false;
  }
  
  protected ExifTag[] getAllTags()
  {
    return (ExifTag[])mExifTags.values().toArray(new ExifTag[mExifTags.size()]);
  }
  
  protected int getId()
  {
    return mIfdId;
  }
  
  protected int getOffsetToNextIfd()
  {
    return mOffsetToNextIfd;
  }
  
  protected ExifTag getTag(short paramShort)
  {
    return (ExifTag)mExifTags.get(Short.valueOf(paramShort));
  }
  
  protected int getTagCount()
  {
    return mExifTags.size();
  }
  
  protected void removeTag(short paramShort)
  {
    mExifTags.remove(Short.valueOf(paramShort));
  }
  
  protected void setOffsetToNextIfd(int paramInt)
  {
    mOffsetToNextIfd = paramInt;
  }
  
  protected ExifTag setTag(ExifTag paramExifTag)
  {
    paramExifTag.setIfd(mIfdId);
    return (ExifTag)mExifTags.put(Short.valueOf(paramExifTag.getTagId()), paramExifTag);
  }
}
