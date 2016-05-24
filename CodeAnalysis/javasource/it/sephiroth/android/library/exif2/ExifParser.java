package it.sephiroth.android.library.exif2;

import android.util.Log;
import android.util.SparseIntArray;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;

class ExifParser
{
  private static final short TAG_EXIF_IFD;
  private static final short TAG_GPS_IFD;
  private static final short TAG_INTEROPERABILITY_IFD;
  private static final short TAG_JPEG_INTERCHANGE_FORMAT;
  private static final short TAG_JPEG_INTERCHANGE_FORMAT_LENGTH;
  private static final short TAG_STRIP_BYTE_COUNTS;
  private static final short TAG_STRIP_OFFSETS;
  private static final Charset US_ASCII = Charset.forName("US-ASCII");
  static final int[][] deftabs = { std_luminance_quant_tbl, std_chrominance_quant_tbl };
  static final int[] std_chrominance_quant_tbl;
  static final int[] std_luminance_quant_tbl;
  private final byte[] mByteArray = new byte[8];
  private final ByteBuffer mByteBuffer = ByteBuffer.wrap(mByteArray);
  private final TreeMap<Integer, Object> mCorrespondingEvent = new TreeMap();
  private byte[] mDataAboveIfd0;
  private int mIfd0Position;
  private int mIfdStartOffset = 0;
  private int mIfdType;
  private ImageEvent mImageEvent;
  private int mImageLength;
  private int mImageWidth;
  private final ExifInterface mInterface;
  private ExifTag mJpegSizeTag;
  private boolean mNeedToParseOffsetsInCurrentIfd;
  private int mNumOfTagInIfd = 0;
  private final int mOptions;
  private short mProcess = 0;
  private int mQualityGuess;
  private List<Section> mSections;
  private ExifTag mStripSizeTag;
  private ExifTag mTag;
  private final CountedDataInputStream mTiffStream;
  private int mUncompressedDataPosition = 0;
  
  static
  {
    TAG_EXIF_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_EXIF_IFD);
    TAG_GPS_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_GPS_IFD);
    TAG_INTEROPERABILITY_IFD = ExifInterface.getTrueTagKey(ExifInterface.TAG_INTEROPERABILITY_IFD);
    TAG_JPEG_INTERCHANGE_FORMAT = ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
    TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
    TAG_STRIP_OFFSETS = ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS);
    TAG_STRIP_BYTE_COUNTS = ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS);
    std_luminance_quant_tbl = new int[] { 16, 11, 12, 14, 12, 10, 16, 14, 13, 14, 18, 17, 16, 19, 24, 40, 26, 24, 22, 22, 24, 49, 35, 37, 29, 40, 58, 51, 61, 60, 57, 51, 56, 55, 64, 72, 92, 78, 64, 68, 87, 69, 55, 56, 80, 109, 81, 87, 95, 98, 103, 104, 103, 62, 77, 113, 121, 112, 100, 120, 92, 101, 103, 99 };
    std_chrominance_quant_tbl = new int[] { 17, 18, 18, 24, 21, 24, 47, 26, 26, 47, 99, 66, 56, 66, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99 };
  }
  
  private ExifParser(InputStream paramInputStream, int paramInt, ExifInterface paramExifInterface)
    throws IOException, ExifInvalidFormatException
  {
    if (paramInputStream == null) {
      throw new IOException("Null argument inputStream to ExifParser");
    }
    Log.v("ExifParser", "Reading exif...");
    mSections = new ArrayList(0);
    mInterface = paramExifInterface;
    mTiffStream = seekTiffData(paramInputStream);
    mOptions = paramInt;
    if (mTiffStream == null) {}
    long l;
    do
    {
      do
      {
        return;
        parseTiffHeader(mTiffStream);
        l = mTiffStream.readUnsignedInt();
        if (l > 2147483647L) {
          throw new ExifInvalidFormatException("Invalid offset " + l);
        }
        mIfd0Position = ((int)l);
        mIfdType = 0;
      } while ((!isIfdRequested(0)) && (!needToParseOffsetsInCurrentIfd()));
      registerIfd(0, l);
    } while (l == 8L);
    mDataAboveIfd0 = new byte[(int)l - 8];
    read(mDataAboveIfd0);
  }
  
  static int Get16m(byte[] paramArrayOfByte, int paramInt)
  {
    return (paramArrayOfByte[paramInt] & 0xFF) << 8 | paramArrayOfByte[(paramInt + 1)] & 0xFF;
  }
  
  private void checkOffsetOrImageTag(ExifTag paramExifTag)
  {
    if (paramExifTag.getComponentCount() == 0) {}
    int i;
    int j;
    label237:
    label270:
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  return;
                  i = paramExifTag.getTagId();
                  j = paramExifTag.getIfd();
                  if ((i != TAG_EXIF_IFD) || (!checkAllowed(j, ExifInterface.TAG_EXIF_IFD))) {
                    break;
                  }
                } while ((!isIfdRequested(2)) && (!isIfdRequested(3)));
                registerIfd(2, paramExifTag.getValueAt(0));
                return;
                if ((i != TAG_GPS_IFD) || (!checkAllowed(j, ExifInterface.TAG_GPS_IFD))) {
                  break;
                }
              } while (!isIfdRequested(4));
              registerIfd(4, paramExifTag.getValueAt(0));
              return;
              if ((i != TAG_INTEROPERABILITY_IFD) || (!checkAllowed(j, ExifInterface.TAG_INTEROPERABILITY_IFD))) {
                break;
              }
            } while (!isIfdRequested(3));
            registerIfd(3, paramExifTag.getValueAt(0));
            return;
            if ((i != TAG_JPEG_INTERCHANGE_FORMAT) || (!checkAllowed(j, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT))) {
              break;
            }
          } while (!isThumbnailRequested());
          registerCompressedImage(paramExifTag.getValueAt(0));
          return;
          if ((i != TAG_JPEG_INTERCHANGE_FORMAT_LENGTH) || (!checkAllowed(j, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH))) {
            break;
          }
        } while (!isThumbnailRequested());
        mJpegSizeTag = paramExifTag;
        return;
        if ((i != TAG_STRIP_OFFSETS) || (!checkAllowed(j, ExifInterface.TAG_STRIP_OFFSETS))) {
          break;
        }
      } while (!isThumbnailRequested());
      if (paramExifTag.hasValue())
      {
        i = 0;
        if (i < paramExifTag.getComponentCount())
        {
          if (paramExifTag.getDataType() != 3) {
            break label270;
          }
          registerUncompressedStrip(i, paramExifTag.getValueAt(i));
        }
        for (;;)
        {
          i += 1;
          break label237;
          break;
          registerUncompressedStrip(i, paramExifTag.getValueAt(i));
        }
      }
      mCorrespondingEvent.put(Integer.valueOf(paramExifTag.getOffset()), new ExifTagEvent(paramExifTag, false));
      return;
    } while ((i != TAG_STRIP_BYTE_COUNTS) || (!checkAllowed(j, ExifInterface.TAG_STRIP_BYTE_COUNTS)) || (!isThumbnailRequested()) || (!paramExifTag.hasValue()));
    mStripSizeTag = paramExifTag;
  }
  
  private boolean isIfdRequested(int paramInt)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      bool = false;
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              return bool;
            } while ((mOptions & 0x1) != 0);
            return false;
          } while ((mOptions & 0x2) != 0);
          return false;
        } while ((mOptions & 0x4) != 0);
        return false;
      } while ((mOptions & 0x8) != 0);
      return false;
    } while ((mOptions & 0x10) != 0);
    return false;
  }
  
  private boolean isThumbnailRequested()
  {
    return (mOptions & 0x20) != 0;
  }
  
  private boolean needToParseOffsetsInCurrentIfd()
  {
    switch (mIfdType)
    {
    default: 
    case 0: 
      do
      {
        return false;
      } while ((!isIfdRequested(2)) && (!isIfdRequested(4)) && (!isIfdRequested(3)) && (!isIfdRequested(1)));
      return true;
    case 1: 
      return isThumbnailRequested();
    }
    return isIfdRequested(3);
  }
  
  protected static ExifParser parse(InputStream paramInputStream, int paramInt, ExifInterface paramExifInterface)
    throws IOException, ExifInvalidFormatException
  {
    return new ExifParser(paramInputStream, paramInt, paramExifInterface);
  }
  
  private void parseTiffHeader(CountedDataInputStream paramCountedDataInputStream)
    throws IOException, ExifInvalidFormatException
  {
    int i = paramCountedDataInputStream.readShort();
    if (18761 == i) {
      paramCountedDataInputStream.setByteOrder(ByteOrder.LITTLE_ENDIAN);
    }
    while (paramCountedDataInputStream.readShort() != 42)
    {
      throw new ExifInvalidFormatException("Invalid TIFF header");
      if (19789 == i) {
        paramCountedDataInputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
      } else {
        throw new ExifInvalidFormatException("Invalid TIFF header");
      }
    }
  }
  
  private void process_M_DQT(byte[] paramArrayOfByte, int paramInt)
  {
    paramInt = 2;
    double d1 = 0.0D;
    int[] arrayOfInt = null;
    int i = 1;
    for (;;)
    {
      double d2;
      if (paramInt < paramArrayOfByte.length)
      {
        int k = paramInt + 1;
        int n = paramArrayOfByte[paramInt];
        int i1 = n & 0xF;
        if (i1 < 2) {
          arrayOfInt = deftabs[i1];
        }
        int j = 0;
        d2 = d1;
        paramInt = k;
        if (j < 64)
        {
          int m;
          if (n >> 4 != 0)
          {
            k = paramInt + 1;
            paramInt = paramArrayOfByte[paramInt];
            m = paramArrayOfByte[k] + paramInt * 256;
          }
          for (paramInt = k + 1;; paramInt = k)
          {
            k = i;
            d1 = d2;
            if (arrayOfInt != null)
            {
              d2 += 100.0D * m / arrayOfInt[j];
              k = i;
              d1 = d2;
              if (m != 1)
              {
                k = 0;
                d1 = d2;
              }
            }
            j += 1;
            i = k;
            d2 = d1;
            break;
            k = paramInt + 1;
            m = paramArrayOfByte[paramInt];
          }
        }
        if (arrayOfInt != null)
        {
          d2 /= 64.0D;
          if (i != 0) {
            d1 = 100.0D;
          }
          for (;;)
          {
            if (i1 == 0) {
              mQualityGuess = ((int)(0.5D + d1));
            }
            d1 = d2;
            break;
            if (d2 <= 100.0D) {
              d1 = (200.0D - d2) / 2.0D;
            } else {
              d1 = 5000.0D / d2;
            }
          }
        }
      }
      else
      {
        return;
      }
      d1 = d2;
    }
  }
  
  private void process_M_SOFn(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramArrayOfByte.length > 7)
    {
      mImageLength = Get16m(paramArrayOfByte, 3);
      mImageWidth = Get16m(paramArrayOfByte, 5);
    }
    mProcess = ((short)paramInt);
  }
  
  private int readBytes(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int j = 0;
    int k = Math.min(1024, paramInt2);
    int i = paramInt1;
    for (paramInt1 = k;; paramInt1 = Math.min(paramInt1, paramInt2 - j))
    {
      k = paramInputStream.read(paramArrayOfByte, i, paramInt1);
      if (k <= 0) {
        break;
      }
      j += k;
      i += k;
    }
    return j;
  }
  
  private int readInt(byte[] paramArrayOfByte, int paramInt)
  {
    mByteBuffer.rewind();
    mByteBuffer.put(paramArrayOfByte, paramInt, 4);
    mByteBuffer.rewind();
    return mByteBuffer.getInt();
  }
  
  private short readShort(byte[] paramArrayOfByte, int paramInt)
  {
    mByteBuffer.rewind();
    mByteBuffer.put(paramArrayOfByte, paramInt, 2);
    mByteBuffer.rewind();
    return mByteBuffer.getShort();
  }
  
  private ExifTag readTag()
    throws IOException, ExifInvalidFormatException
  {
    short s1 = mTiffStream.readShort();
    short s2 = mTiffStream.readShort();
    long l1 = mTiffStream.readUnsignedInt();
    if (l1 > 2147483647L) {
      throw new ExifInvalidFormatException("Number of component is larger then Integer.MAX_VALUE");
    }
    if (!ExifTag.isValidType(s2))
    {
      Log.w("ExifParser", String.format("Tag %04x: Invalid data type %d", new Object[] { Short.valueOf(s1), Short.valueOf(s2) }));
      mTiffStream.skip(4L);
      return null;
    }
    int i = (int)l1;
    int j = mIfdType;
    if ((int)l1 != 0) {}
    ExifTag localExifTag;
    long l2;
    for (boolean bool = true;; bool = false)
    {
      localExifTag = new ExifTag(s1, s2, i, j, bool);
      i = localExifTag.getDataSize();
      if (i <= 4) {
        break label241;
      }
      l2 = mTiffStream.readUnsignedInt();
      if (l2 <= 2147483647L) {
        break;
      }
      throw new ExifInvalidFormatException("offset is larger then Integer.MAX_VALUE");
    }
    if ((l2 < mIfd0Position) && (s2 == 7))
    {
      byte[] arrayOfByte = new byte[(int)l1];
      System.arraycopy(mDataAboveIfd0, (int)l2 - 8, arrayOfByte, 0, (int)l1);
      localExifTag.setValue(arrayOfByte);
      return localExifTag;
    }
    localExifTag.setOffset((int)l2);
    return localExifTag;
    label241:
    bool = localExifTag.hasDefinedCount();
    localExifTag.setHasDefinedCount(false);
    readFullTagValue(localExifTag);
    localExifTag.setHasDefinedCount(bool);
    mTiffStream.skip(4 - i);
    localExifTag.setOffset(mTiffStream.getReadByteCount() - 4);
    return localExifTag;
  }
  
  private void registerCompressedImage(long paramLong)
  {
    mCorrespondingEvent.put(Integer.valueOf((int)paramLong), new ImageEvent(3));
  }
  
  private void registerIfd(int paramInt, long paramLong)
  {
    mCorrespondingEvent.put(Integer.valueOf((int)paramLong), new IfdEvent(paramInt, isIfdRequested(paramInt)));
  }
  
  private void registerUncompressedStrip(int paramInt, long paramLong)
  {
    mCorrespondingEvent.put(Integer.valueOf((int)paramLong), new ImageEvent(4, paramInt));
  }
  
  private CountedDataInputStream seekTiffData(InputStream paramInputStream)
    throws IOException, ExifInvalidFormatException
  {
    CountedDataInputStream localCountedDataInputStream = new CountedDataInputStream(paramInputStream);
    InputStream localInputStream = null;
    int k = localCountedDataInputStream.readUnsignedByte();
    int m = localCountedDataInputStream.readUnsignedByte();
    byte[] arrayOfByte;
    int i1;
    Object localObject;
    if ((k != 255) || (m != 216))
    {
      Log.e("ExifParser", "invalid jpeg header");
      return null;
      process_M_DQT(arrayOfByte, i1);
      paramInputStream = localInputStream;
      k = m;
      if (k != 0) {
        break label777;
      }
      mSections.add(localObject);
    }
    for (localInputStream = paramInputStream;; localInputStream = paramInputStream)
    {
      m = 0;
      k = 0;
      int n;
      int i;
      int j;
      for (;;)
      {
        n = localCountedDataInputStream.readUnsignedByte();
        if ((n != 255) && (m == 255))
        {
          if (k > 10) {
            Log.w("ExifParser", "Extraneous " + (k - 1) + " padding bytes before section " + n);
          }
          localObject = new Section();
          type = n;
          i = localCountedDataInputStream.readByte();
          j = localCountedDataInputStream.readByte();
          i1 = (i & 0xFF) << 8 | j & 0xFF;
          if (i1 >= 2) {
            break;
          }
          throw new ExifInvalidFormatException("Invalid marker");
        }
        m = n;
        k += 1;
      }
      size = i1;
      arrayOfByte = new byte[i1];
      arrayOfByte[0] = i;
      arrayOfByte[1] = j;
      k = readBytes(localCountedDataInputStream, arrayOfByte, 2, i1 - 2);
      if (k != i1 - 2) {
        throw new ExifInvalidFormatException("Premature end of file? Expecting " + (i1 - 2) + ", received " + k);
      }
      data = arrayOfByte;
      m = 0;
      k = m;
      paramInputStream = localInputStream;
      switch (n)
      {
      case 219: 
      case 196: 
      case 237: 
      default: 
        Log.w("ExifParser", "Unknown marker: " + String.format("0x%2X", new Object[] { Integer.valueOf(n) }) + ", length: " + i1);
        k = m;
        paramInputStream = localInputStream;
        break;
      case 218: 
        mSections.add(localObject);
        mUncompressedDataPosition = localCountedDataInputStream.getReadByteCount();
        return localInputStream;
      case 217: 
        Log.w("ExifParser", "No image in jpeg!");
        return null;
      case 254: 
        k = 1;
        paramInputStream = localInputStream;
        break;
      case 224: 
        k = m;
        paramInputStream = localInputStream;
        if (i1 >= 16) {
          break;
        }
        k = 1;
        paramInputStream = localInputStream;
        break;
      case 192: 
      case 193: 
      case 194: 
      case 195: 
      case 197: 
      case 198: 
      case 199: 
      case 201: 
      case 202: 
      case 203: 
      case 205: 
      case 206: 
      case 207: 
        process_M_SOFn(arrayOfByte, n);
        k = m;
        paramInputStream = localInputStream;
        break;
      case 225: 
        k = m;
        paramInputStream = localInputStream;
        if (i1 < 8) {
          break;
        }
        k = readInt(arrayOfByte, 2);
        int i2 = readShort(arrayOfByte, 6);
        if ((k == 1165519206) && (i2 == 0))
        {
          paramInputStream = new CountedDataInputStream(new ByteArrayInputStream(arrayOfByte, 8, i1 - 8));
          paramInputStream.setEnd(i1 - 6);
          k = 0;
          break;
        }
        Log.v("ExifParser", "Image cotains XMP section");
        k = m;
        paramInputStream = localInputStream;
        break;
        label777:
        Log.v("ExifParser", "ignoring marker: " + String.format("0x%2X", new Object[] { Integer.valueOf(n) }) + ", length: " + i1);
      }
    }
  }
  
  private void skipTo(int paramInt)
    throws IOException
  {
    mTiffStream.skipTo(paramInt);
    while ((!mCorrespondingEvent.isEmpty()) && (((Integer)mCorrespondingEvent.firstKey()).intValue() < paramInt)) {
      mCorrespondingEvent.pollFirstEntry();
    }
  }
  
  public boolean checkAllowed(int paramInt1, int paramInt2)
  {
    paramInt2 = mInterface.getTagInfo().get(paramInt2);
    if (paramInt2 == 0) {
      return false;
    }
    return ExifInterface.isIfdAllowed(paramInt2, paramInt1);
  }
  
  protected ByteOrder getByteOrder()
  {
    if (mTiffStream != null) {
      return mTiffStream.getByteOrder();
    }
    return null;
  }
  
  protected int getCompressedImageSize()
  {
    if (mJpegSizeTag == null) {
      return 0;
    }
    return (int)mJpegSizeTag.getValueAt(0);
  }
  
  protected int getCurrentIfd()
  {
    return mIfdType;
  }
  
  public int getImageLength()
  {
    return mImageLength;
  }
  
  public int getImageWidth()
  {
    return mImageWidth;
  }
  
  public short getJpegProcess()
  {
    return mProcess;
  }
  
  public int getQualityGuess()
  {
    return mQualityGuess;
  }
  
  public List<Section> getSections()
  {
    return mSections;
  }
  
  protected int getStripIndex()
  {
    return mImageEvent.stripIndex;
  }
  
  protected int getStripSize()
  {
    if (mStripSizeTag == null) {
      return 0;
    }
    return (int)mStripSizeTag.getValueAt(0);
  }
  
  protected ExifTag getTag()
  {
    return mTag;
  }
  
  public int getUncompressedDataPosition()
  {
    return mUncompressedDataPosition;
  }
  
  public boolean isDefinedTag(int paramInt1, int paramInt2)
  {
    return mInterface.getTagInfo().get(ExifInterface.defineTag(paramInt1, (short)paramInt2)) != 0;
  }
  
  protected int next()
    throws IOException, ExifInvalidFormatException
  {
    if (mTiffStream == null) {
      return 5;
    }
    int i = mTiffStream.getReadByteCount();
    int j = mIfdStartOffset + 2 + mNumOfTagInIfd * 12;
    if (i < j)
    {
      mTag = readTag();
      if (mTag == null) {
        return next();
      }
      if (mNeedToParseOffsetsInCurrentIfd) {
        checkOffsetOrImageTag(mTag);
      }
      return 1;
    }
    long l;
    if (i == j)
    {
      if (mIfdType != 0) {
        break label266;
      }
      l = readUnsignedLong();
      if (((isIfdRequested(1)) || (isThumbnailRequested())) && (l != 0L)) {
        registerIfd(1, l);
      }
    }
    while (mCorrespondingEvent.size() != 0)
    {
      Object localObject1 = mCorrespondingEvent.pollFirstEntry();
      Object localObject2 = ((Map.Entry)localObject1).getValue();
      try
      {
        skipTo(((Integer)((Map.Entry)localObject1).getKey()).intValue());
        if (!(localObject2 instanceof IfdEvent)) {
          break label467;
        }
        mIfdType = ifd;
        mNumOfTagInIfd = mTiffStream.readUnsignedShort();
        mIfdStartOffset = ((Integer)((Map.Entry)localObject1).getKey()).intValue();
        if (mNumOfTagInIfd * 12 + mIfdStartOffset + 2 <= mTiffStream.getEnd()) {
          break label439;
        }
        Log.w("ExifParser", "Invalid size of IFD " + mIfdType);
        return 5;
      }
      catch (IOException localIOException)
      {
        label266:
        Log.w("ExifParser", "Failed to skip to data at: " + ((Map.Entry)localObject1).getKey() + " for " + localObject2.getClass().getName() + ", the file may be broken.");
      }
      i = 4;
      if (mCorrespondingEvent.size() > 0) {
        i = ((Integer)mCorrespondingEvent.firstEntry().getKey()).intValue() - mTiffStream.getReadByteCount();
      }
      if (i < 4)
      {
        Log.w("ExifParser", "Invalid size of link to next IFD: " + i);
      }
      else
      {
        l = readUnsignedLong();
        if (l != 0L)
        {
          Log.w("ExifParser", "Invalid link to next IFD: " + l);
          continue;
          continue;
          label439:
          mNeedToParseOffsetsInCurrentIfd = needToParseOffsetsInCurrentIfd();
          if (isRequested) {
            return 0;
          }
          skipRemainingTagsInCurrentIfd();
          continue;
          label467:
          if ((localObject2 instanceof ImageEvent))
          {
            mImageEvent = ((ImageEvent)localObject2);
            return mImageEvent.type;
          }
          localObject1 = (ExifTagEvent)localObject2;
          mTag = tag;
          if (mTag.getDataType() != 7)
          {
            readFullTagValue(mTag);
            checkOffsetOrImageTag(mTag);
          }
          if (isRequested) {
            return 2;
          }
        }
      }
    }
    return 5;
  }
  
  protected int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return mTiffStream.read(paramArrayOfByte);
  }
  
  protected void readFullTagValue(ExifTag paramExifTag)
    throws IOException
  {
    int j = paramExifTag.getDataType();
    int i = paramExifTag.getComponentCount();
    if (i >= 1711276032) {
      throw new IOException("size out of bounds");
    }
    if ((j == 2) || (j == 7) || (j == 1))
    {
      j = paramExifTag.getComponentCount();
      if ((mCorrespondingEvent.size() > 0) && (((Integer)mCorrespondingEvent.firstEntry().getKey()).intValue() < mTiffStream.getReadByteCount() + j))
      {
        localObject = mCorrespondingEvent.firstEntry().getValue();
        if (!(localObject instanceof ImageEvent)) {
          break label241;
        }
        Log.w("ExifParser", "Thumbnail overlaps value for tag: \n" + paramExifTag.toString());
        localObject = mCorrespondingEvent.pollFirstEntry();
        Log.w("ExifParser", "Invalid thumbnail offset: " + ((Map.Entry)localObject).getKey());
      }
    }
    switch (paramExifTag.getDataType())
    {
    case 6: 
    case 8: 
    default: 
      return;
      if ((localObject instanceof IfdEvent)) {
        Log.w("ExifParser", "Ifd " + ifd + " overlaps value for tag: \n" + paramExifTag.toString());
      }
      for (;;)
      {
        j = ((Integer)mCorrespondingEvent.firstEntry().getKey()).intValue() - mTiffStream.getReadByteCount();
        Log.w("ExifParser", "Invalid size of tag: \n" + paramExifTag.toString() + " setting count to: " + j);
        paramExifTag.forceSetComponentCount(j);
        break;
        if ((localObject instanceof ExifTagEvent)) {
          Log.w("ExifParser", "Tag value for tag: \n" + tag.toString() + " overlaps value for tag: \n" + paramExifTag.toString());
        }
      }
    case 1: 
    case 7: 
      localObject = new byte[i];
      read((byte[])localObject);
      paramExifTag.setValue((byte[])localObject);
      return;
    case 2: 
      paramExifTag.setValue(readString(i));
      return;
    case 4: 
      localObject = new long[i];
      i = 0;
      j = localObject.length;
      while (i < j)
      {
        localObject[i] = readUnsignedLong();
        i += 1;
      }
      paramExifTag.setValue((long[])localObject);
      return;
    case 5: 
      localObject = new Rational[i];
      i = 0;
      j = localObject.length;
      while (i < j)
      {
        localObject[i] = readUnsignedRational();
        i += 1;
      }
      paramExifTag.setValue((Rational[])localObject);
      return;
    case 3: 
      localObject = new int[i];
      i = 0;
      j = localObject.length;
      while (i < j)
      {
        localObject[i] = readUnsignedShort();
        i += 1;
      }
      paramExifTag.setValue((int[])localObject);
      return;
    case 9: 
      label241:
      localObject = new int[i];
      i = 0;
      j = localObject.length;
      while (i < j)
      {
        localObject[i] = readLong();
        i += 1;
      }
      paramExifTag.setValue((int[])localObject);
      return;
    }
    Object localObject = new Rational[i];
    i = 0;
    j = localObject.length;
    while (i < j)
    {
      localObject[i] = readRational();
      i += 1;
    }
    paramExifTag.setValue((Rational[])localObject);
  }
  
  protected int readLong()
    throws IOException
  {
    return mTiffStream.readInt();
  }
  
  protected Rational readRational()
    throws IOException
  {
    int i = readLong();
    int j = readLong();
    return new Rational(i, j);
  }
  
  protected String readString(int paramInt)
    throws IOException
  {
    return readString(paramInt, US_ASCII);
  }
  
  protected String readString(int paramInt, Charset paramCharset)
    throws IOException
  {
    if (paramInt > 0) {
      return mTiffStream.readString(paramInt, paramCharset);
    }
    return "";
  }
  
  protected long readUnsignedLong()
    throws IOException
  {
    return readLong() & 0xFFFFFFFF;
  }
  
  protected Rational readUnsignedRational()
    throws IOException
  {
    return new Rational(readUnsignedLong(), readUnsignedLong());
  }
  
  protected int readUnsignedShort()
    throws IOException
  {
    return mTiffStream.readShort() & 0xFFFF;
  }
  
  protected void registerForTagValue(ExifTag paramExifTag)
  {
    if (paramExifTag.getOffset() >= mTiffStream.getReadByteCount()) {
      mCorrespondingEvent.put(Integer.valueOf(paramExifTag.getOffset()), new ExifTagEvent(paramExifTag, true));
    }
  }
  
  protected void skipRemainingTagsInCurrentIfd()
    throws IOException, ExifInvalidFormatException
  {
    int k = mIfdStartOffset + 2 + mNumOfTagInIfd * 12;
    int i = mTiffStream.getReadByteCount();
    if (i > k) {}
    long l;
    do
    {
      return;
      if (mNeedToParseOffsetsInCurrentIfd) {
        while (i < k)
        {
          mTag = readTag();
          int j = i + 12;
          i = j;
          if (mTag != null)
          {
            checkOffsetOrImageTag(mTag);
            i = j;
          }
        }
      }
      skipTo(k);
      l = readUnsignedLong();
    } while ((mIfdType != 0) || ((!isIfdRequested(1)) && (!isThumbnailRequested())) || (l <= 0L));
    registerIfd(1, l);
  }
  
  private static class ExifTagEvent
  {
    boolean isRequested;
    ExifTag tag;
    
    ExifTagEvent(ExifTag paramExifTag, boolean paramBoolean)
    {
      tag = paramExifTag;
      isRequested = paramBoolean;
    }
  }
  
  private static class IfdEvent
  {
    int ifd;
    boolean isRequested;
    
    IfdEvent(int paramInt, boolean paramBoolean)
    {
      ifd = paramInt;
      isRequested = paramBoolean;
    }
  }
  
  private static class ImageEvent
  {
    int stripIndex;
    int type;
    
    ImageEvent(int paramInt)
    {
      stripIndex = 0;
      type = paramInt;
    }
    
    ImageEvent(int paramInt1, int paramInt2)
    {
      type = paramInt1;
      stripIndex = paramInt2;
    }
  }
  
  public static class Section
  {
    byte[] data;
    int size;
    int type;
    
    public Section() {}
  }
}
