package it.sephiroth.android.library.exif2;

import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class ExifData
{
  private static final byte[] USER_COMMENT_ASCII = { 65, 83, 67, 73, 73, 0, 0, 0 };
  private static final byte[] USER_COMMENT_JIS = { 74, 73, 83, 0, 0, 0, 0, 0 };
  private static final byte[] USER_COMMENT_UNICODE = { 85, 78, 73, 67, 79, 68, 69, 0 };
  private int imageLength = -1;
  private int imageWidth = -1;
  private short jpegProcess = 0;
  private final ByteOrder mByteOrder;
  private final IfdData[] mIfdDatas = new IfdData[5];
  private List<ExifParser.Section> mSections;
  private ArrayList<byte[]> mStripBytes = new ArrayList();
  private byte[] mThumbnail;
  public int mUncompressedDataPosition = 0;
  private int qualityGuess = 0;
  
  ExifData(ByteOrder paramByteOrder)
  {
    mByteOrder = paramByteOrder;
  }
  
  protected void addIfdData(IfdData paramIfdData)
  {
    mIfdDatas[paramIfdData.getId()] = paramIfdData;
  }
  
  protected ExifTag addTag(ExifTag paramExifTag)
  {
    if (paramExifTag != null) {
      return addTag(paramExifTag, paramExifTag.getIfd());
    }
    return null;
  }
  
  protected ExifTag addTag(ExifTag paramExifTag, int paramInt)
  {
    if ((paramExifTag != null) && (ExifTag.isValidIfd(paramInt))) {
      return getOrCreateIfdData(paramInt).setTag(paramExifTag);
    }
    return null;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if (paramObject == null) {
      return false;
    }
    if ((paramObject instanceof ExifData))
    {
      paramObject = (ExifData)paramObject;
      if ((mByteOrder != mByteOrder) || (mStripBytes.size() != mStripBytes.size()) || (!Arrays.equals(mThumbnail, mThumbnail))) {
        return false;
      }
      int i = 0;
      while (i < mStripBytes.size())
      {
        if (!Arrays.equals((byte[])mStripBytes.get(i), (byte[])mStripBytes.get(i))) {
          return false;
        }
        i += 1;
      }
      i = 0;
      while (i < 5)
      {
        IfdData localIfdData1 = paramObject.getIfdData(i);
        IfdData localIfdData2 = getIfdData(i);
        if ((localIfdData1 != localIfdData2) && (localIfdData1 != null) && (!localIfdData1.equals(localIfdData2))) {
          return false;
        }
        i += 1;
      }
      return true;
    }
    return false;
  }
  
  protected List<ExifTag> getAllTags()
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = mIfdDatas;
    int k = localObject.length;
    int i = 0;
    while (i < k)
    {
      ExifTag[] arrayOfExifTag = localObject[i];
      if (arrayOfExifTag != null)
      {
        arrayOfExifTag = arrayOfExifTag.getAllTags();
        if (arrayOfExifTag != null)
        {
          int m = arrayOfExifTag.length;
          int j = 0;
          while (j < m)
          {
            localArrayList.add(arrayOfExifTag[j]);
            j += 1;
          }
        }
      }
      i += 1;
    }
    localObject = localArrayList;
    if (localArrayList.size() == 0) {
      localObject = null;
    }
    return localObject;
  }
  
  protected ByteOrder getByteOrder()
  {
    return mByteOrder;
  }
  
  protected byte[] getCompressedThumbnail()
  {
    return mThumbnail;
  }
  
  protected IfdData getIfdData(int paramInt)
  {
    if (ExifTag.isValidIfd(paramInt)) {
      return mIfdDatas[paramInt];
    }
    return null;
  }
  
  public int[] getImageSize()
  {
    return new int[] { imageWidth, imageLength };
  }
  
  protected IfdData getOrCreateIfdData(int paramInt)
  {
    IfdData localIfdData2 = mIfdDatas[paramInt];
    IfdData localIfdData1 = localIfdData2;
    if (localIfdData2 == null)
    {
      localIfdData1 = new IfdData(paramInt);
      mIfdDatas[paramInt] = localIfdData1;
    }
    return localIfdData1;
  }
  
  public List<ExifParser.Section> getSections()
  {
    return mSections;
  }
  
  protected byte[] getStrip(int paramInt)
  {
    return (byte[])mStripBytes.get(paramInt);
  }
  
  protected int getStripCount()
  {
    return mStripBytes.size();
  }
  
  protected ExifTag getTag(short paramShort, int paramInt)
  {
    IfdData localIfdData = mIfdDatas[paramInt];
    if (localIfdData == null) {
      return null;
    }
    return localIfdData.getTag(paramShort);
  }
  
  protected boolean hasCompressedThumbnail()
  {
    return mThumbnail != null;
  }
  
  protected boolean hasUncompressedStrip()
  {
    return mStripBytes.size() != 0;
  }
  
  protected void removeTag(short paramShort, int paramInt)
  {
    IfdData localIfdData = mIfdDatas[paramInt];
    if (localIfdData == null) {
      return;
    }
    localIfdData.removeTag(paramShort);
  }
  
  protected void setCompressedThumbnail(byte[] paramArrayOfByte)
  {
    mThumbnail = paramArrayOfByte;
  }
  
  protected void setImageSize(int paramInt1, int paramInt2)
  {
    imageWidth = paramInt1;
    imageLength = paramInt2;
  }
  
  public void setJpegProcess(short paramShort)
  {
    jpegProcess = paramShort;
  }
  
  protected void setQualityGuess(int paramInt)
  {
    qualityGuess = paramInt;
  }
  
  public void setSections(List<ExifParser.Section> paramList)
  {
    mSections = paramList;
  }
  
  protected void setStripBytes(int paramInt, byte[] paramArrayOfByte)
  {
    if (paramInt < mStripBytes.size())
    {
      mStripBytes.set(paramInt, paramArrayOfByte);
      return;
    }
    int i = mStripBytes.size();
    while (i < paramInt)
    {
      mStripBytes.add(null);
      i += 1;
    }
    mStripBytes.add(paramArrayOfByte);
  }
}
