package it.sephiroth.android.library.exif2;

import android.util.Log;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class ExifOutputStream
{
  private ByteBuffer mBuffer = ByteBuffer.allocate(4);
  private ExifData mExifData;
  private final ExifInterface mInterface;
  
  protected ExifOutputStream(ExifInterface paramExifInterface)
  {
    mInterface = paramExifInterface;
  }
  
  private int calculateAllOffset()
  {
    Object localObject = mExifData.getIfdData(0);
    int i = calculateOffsetOfIfd((IfdData)localObject, 8);
    ((IfdData)localObject).getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_EXIF_IFD)).setValue(i);
    IfdData localIfdData1 = mExifData.getIfdData(2);
    int j = calculateOffsetOfIfd(localIfdData1, i);
    IfdData localIfdData2 = mExifData.getIfdData(3);
    i = j;
    if (localIfdData2 != null)
    {
      localIfdData1.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_INTEROPERABILITY_IFD)).setValue(j);
      i = calculateOffsetOfIfd(localIfdData2, j);
    }
    localIfdData1 = mExifData.getIfdData(4);
    j = i;
    if (localIfdData1 != null)
    {
      ((IfdData)localObject).getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_GPS_IFD)).setValue(i);
      j = calculateOffsetOfIfd(localIfdData1, i);
    }
    localIfdData1 = mExifData.getIfdData(1);
    i = j;
    if (localIfdData1 != null)
    {
      ((IfdData)localObject).setOffsetToNextIfd(j);
      i = calculateOffsetOfIfd(localIfdData1, j);
    }
    if (mExifData.hasCompressedThumbnail())
    {
      localIfdData1.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT)).setValue(i);
      j = i + mExifData.getCompressedThumbnail().length;
    }
    do
    {
      return j;
      j = i;
    } while (!mExifData.hasUncompressedStrip());
    localObject = new long[mExifData.getStripCount()];
    int k = 0;
    j = i;
    i = k;
    while (i < mExifData.getStripCount())
    {
      localObject[i] = j;
      j += mExifData.getStrip(i).length;
      i += 1;
    }
    localIfdData1.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS)).setValue((long[])localObject);
    return j;
  }
  
  private int calculateOffsetOfIfd(IfdData paramIfdData, int paramInt)
  {
    int i = paramInt + (paramIfdData.getTagCount() * 12 + 2 + 4);
    paramIfdData = paramIfdData.getAllTags();
    int k = paramIfdData.length;
    paramInt = 0;
    while (paramInt < k)
    {
      Object localObject = paramIfdData[paramInt];
      int j = i;
      if (localObject.getDataSize() > 4)
      {
        localObject.setOffset(i);
        j = i + localObject.getDataSize();
      }
      paramInt += 1;
      i = j;
    }
    return i;
  }
  
  private void createRequiredIfdAndTag()
    throws IOException
  {
    Object localObject2 = mExifData.getIfdData(0);
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = new IfdData(0);
      mExifData.addIfdData((IfdData)localObject1);
    }
    localObject2 = mInterface.buildUninitializedTag(ExifInterface.TAG_EXIF_IFD);
    if (localObject2 == null) {
      throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_EXIF_IFD);
    }
    ((IfdData)localObject1).setTag((ExifTag)localObject2);
    Object localObject3 = mExifData.getIfdData(2);
    localObject2 = localObject3;
    if (localObject3 == null)
    {
      localObject2 = new IfdData(2);
      mExifData.addIfdData((IfdData)localObject2);
    }
    if (mExifData.getIfdData(4) != null)
    {
      localObject3 = mInterface.buildUninitializedTag(ExifInterface.TAG_GPS_IFD);
      if (localObject3 == null) {
        throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_GPS_IFD);
      }
      ((IfdData)localObject1).setTag((ExifTag)localObject3);
    }
    if (mExifData.getIfdData(3) != null)
    {
      localObject1 = mInterface.buildUninitializedTag(ExifInterface.TAG_INTEROPERABILITY_IFD);
      if (localObject1 == null) {
        throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_INTEROPERABILITY_IFD);
      }
      ((IfdData)localObject2).setTag((ExifTag)localObject1);
    }
    localObject2 = mExifData.getIfdData(1);
    if (mExifData.hasCompressedThumbnail())
    {
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = new IfdData(1);
        mExifData.addIfdData((IfdData)localObject1);
      }
      localObject2 = mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
      if (localObject2 == null) {
        throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
      }
      ((IfdData)localObject1).setTag((ExifTag)localObject2);
      localObject2 = mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
      if (localObject2 == null) {
        throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
      }
      ((ExifTag)localObject2).setValue(mExifData.getCompressedThumbnail().length);
      ((IfdData)localObject1).setTag((ExifTag)localObject2);
      ((IfdData)localObject1).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
      ((IfdData)localObject1).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
    }
    do
    {
      return;
      if (mExifData.hasUncompressedStrip())
      {
        localObject1 = localObject2;
        if (localObject2 == null)
        {
          localObject1 = new IfdData(1);
          mExifData.addIfdData((IfdData)localObject1);
        }
        int i = mExifData.getStripCount();
        localObject2 = mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_OFFSETS);
        if (localObject2 == null) {
          throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_STRIP_OFFSETS);
        }
        localObject3 = mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_BYTE_COUNTS);
        if (localObject3 == null) {
          throw new IOException("No definition for crucial exif tag: " + ExifInterface.TAG_STRIP_BYTE_COUNTS);
        }
        long[] arrayOfLong = new long[i];
        i = 0;
        while (i < mExifData.getStripCount())
        {
          arrayOfLong[i] = mExifData.getStrip(i).length;
          i += 1;
        }
        ((ExifTag)localObject3).setValue(arrayOfLong);
        ((IfdData)localObject1).setTag((ExifTag)localObject2);
        ((IfdData)localObject1).setTag((ExifTag)localObject3);
        ((IfdData)localObject1).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
        ((IfdData)localObject1).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
        return;
      }
    } while (localObject2 == null);
    ((IfdData)localObject2).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
    ((IfdData)localObject2).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
    ((IfdData)localObject2).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
    ((IfdData)localObject2).removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
  }
  
  private ArrayList<ExifTag> stripNullValueTags(ExifData paramExifData)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramExifData.getAllTags().iterator();
    while (localIterator.hasNext())
    {
      ExifTag localExifTag = (ExifTag)localIterator.next();
      if ((localExifTag.getValue() == null) && (!ExifInterface.isOffsetTag(localExifTag.getTagId())))
      {
        paramExifData.removeTag(localExifTag.getTagId(), localExifTag.getIfd());
        localArrayList.add(localExifTag);
      }
    }
    return localArrayList;
  }
  
  private void writeAllTags(OrderedDataOutputStream paramOrderedDataOutputStream)
    throws IOException
  {
    writeIfd(mExifData.getIfdData(0), paramOrderedDataOutputStream);
    writeIfd(mExifData.getIfdData(2), paramOrderedDataOutputStream);
    IfdData localIfdData = mExifData.getIfdData(3);
    if (localIfdData != null) {
      writeIfd(localIfdData, paramOrderedDataOutputStream);
    }
    localIfdData = mExifData.getIfdData(4);
    if (localIfdData != null) {
      writeIfd(localIfdData, paramOrderedDataOutputStream);
    }
    if (mExifData.getIfdData(1) != null) {
      writeIfd(mExifData.getIfdData(1), paramOrderedDataOutputStream);
    }
  }
  
  private void writeIfd(IfdData paramIfdData, OrderedDataOutputStream paramOrderedDataOutputStream)
    throws IOException
  {
    ExifTag[] arrayOfExifTag = paramIfdData.getAllTags();
    paramOrderedDataOutputStream.writeShort((short)arrayOfExifTag.length);
    int k = arrayOfExifTag.length;
    int i = 0;
    if (i < k)
    {
      ExifTag localExifTag = arrayOfExifTag[i];
      paramOrderedDataOutputStream.writeShort(localExifTag.getTagId());
      paramOrderedDataOutputStream.writeShort(localExifTag.getDataType());
      paramOrderedDataOutputStream.writeInt(localExifTag.getComponentCount());
      if (localExifTag.getDataSize() > 4) {
        paramOrderedDataOutputStream.writeInt(localExifTag.getOffset());
      }
      for (;;)
      {
        i += 1;
        break;
        writeTagValue(localExifTag, paramOrderedDataOutputStream);
        j = 0;
        int m = localExifTag.getDataSize();
        while (j < 4 - m)
        {
          paramOrderedDataOutputStream.write(0);
          j += 1;
        }
      }
    }
    paramOrderedDataOutputStream.writeInt(paramIfdData.getOffsetToNextIfd());
    int j = arrayOfExifTag.length;
    i = 0;
    while (i < j)
    {
      paramIfdData = arrayOfExifTag[i];
      if (paramIfdData.getDataSize() > 4) {
        writeTagValue(paramIfdData, paramOrderedDataOutputStream);
      }
      i += 1;
    }
  }
  
  static void writeTagValue(ExifTag paramExifTag, OrderedDataOutputStream paramOrderedDataOutputStream)
    throws IOException
  {
    switch (paramExifTag.getDataType())
    {
    }
    for (;;)
    {
      return;
      byte[] arrayOfByte = paramExifTag.getStringByte();
      if (arrayOfByte.length == paramExifTag.getComponentCount())
      {
        arrayOfByte[(arrayOfByte.length - 1)] = 0;
        paramOrderedDataOutputStream.write(arrayOfByte);
        return;
      }
      paramOrderedDataOutputStream.write(arrayOfByte);
      paramOrderedDataOutputStream.write(0);
      return;
      int i = 0;
      int j = paramExifTag.getComponentCount();
      while (i < j)
      {
        paramOrderedDataOutputStream.writeInt((int)paramExifTag.getValueAt(i));
        i += 1;
      }
      continue;
      i = 0;
      j = paramExifTag.getComponentCount();
      while (i < j)
      {
        paramOrderedDataOutputStream.writeRational(paramExifTag.getRational(i));
        i += 1;
      }
      continue;
      arrayOfByte = new byte[paramExifTag.getComponentCount()];
      paramExifTag.getBytes(arrayOfByte);
      paramOrderedDataOutputStream.write(arrayOfByte);
      return;
      i = 0;
      j = paramExifTag.getComponentCount();
      while (i < j)
      {
        paramOrderedDataOutputStream.writeShort((short)(int)paramExifTag.getValueAt(i));
        i += 1;
      }
    }
  }
  
  private void writeThumbnail(OrderedDataOutputStream paramOrderedDataOutputStream)
    throws IOException
  {
    if (mExifData.hasCompressedThumbnail())
    {
      Log.d("ExifOutputStream", "writing thumbnail..");
      paramOrderedDataOutputStream.write(mExifData.getCompressedThumbnail());
    }
    for (;;)
    {
      return;
      if (mExifData.hasUncompressedStrip())
      {
        Log.d("ExifOutputStream", "writing uncompressed strip..");
        int i = 0;
        while (i < mExifData.getStripCount())
        {
          paramOrderedDataOutputStream.write(mExifData.getStrip(i));
          i += 1;
        }
      }
    }
  }
  
  protected void setExifData(ExifData paramExifData)
  {
    mExifData = paramExifData;
  }
  
  public void writeExifData(OutputStream paramOutputStream)
    throws IOException
  {
    if (mExifData == null) {
      return;
    }
    Log.v("ExifOutputStream", "Writing exif data...");
    Object localObject = stripNullValueTags(mExifData);
    createRequiredIfdAndTag();
    int i = calculateAllOffset();
    if (i + 8 > 65535) {
      throw new IOException("Exif header is too large (>64Kb)");
    }
    paramOutputStream = new OrderedDataOutputStream(new BufferedOutputStream(paramOutputStream, 65536));
    paramOutputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
    paramOutputStream.write(255);
    paramOutputStream.write(225);
    paramOutputStream.writeShort((short)(i + 8));
    paramOutputStream.writeInt(1165519206);
    paramOutputStream.writeShort((short)0);
    if (mExifData.getByteOrder() == ByteOrder.BIG_ENDIAN) {
      paramOutputStream.writeShort((short)19789);
    }
    for (;;)
    {
      paramOutputStream.setByteOrder(mExifData.getByteOrder());
      paramOutputStream.writeShort((short)42);
      paramOutputStream.writeInt(8);
      writeAllTags(paramOutputStream);
      writeThumbnail(paramOutputStream);
      localObject = ((ArrayList)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        ExifTag localExifTag = (ExifTag)((Iterator)localObject).next();
        mExifData.addTag(localExifTag);
      }
      paramOutputStream.writeShort((short)18761);
    }
    paramOutputStream.flush();
  }
}
