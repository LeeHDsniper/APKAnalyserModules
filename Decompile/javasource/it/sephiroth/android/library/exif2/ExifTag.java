package it.sephiroth.android.library.exif2;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;

public class ExifTag
{
  private static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy:MM:dd kk:mm:ss");
  private static final int[] TYPE_TO_SIZE_MAP = new int[11];
  private static Charset US_ASCII = Charset.forName("US-ASCII");
  private int mComponentCountActual;
  private final short mDataType;
  private boolean mHasDefinedDefaultComponentCount;
  private int mIfd;
  private int mOffset;
  private final short mTagId;
  private Object mValue;
  
  static
  {
    TYPE_TO_SIZE_MAP[1] = 1;
    TYPE_TO_SIZE_MAP[2] = 1;
    TYPE_TO_SIZE_MAP[3] = 2;
    TYPE_TO_SIZE_MAP[4] = 4;
    TYPE_TO_SIZE_MAP[5] = 8;
    TYPE_TO_SIZE_MAP[7] = 1;
    TYPE_TO_SIZE_MAP[9] = 4;
    TYPE_TO_SIZE_MAP[10] = 8;
  }
  
  ExifTag(short paramShort1, short paramShort2, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    mTagId = paramShort1;
    mDataType = paramShort2;
    mComponentCountActual = paramInt1;
    mHasDefinedDefaultComponentCount = paramBoolean;
    mIfd = paramInt2;
    mValue = null;
  }
  
  private boolean checkBadComponentCount(int paramInt)
  {
    return (mHasDefinedDefaultComponentCount) && (mComponentCountActual != paramInt);
  }
  
  private boolean checkOverflowForRational(Rational[] paramArrayOfRational)
  {
    int j = paramArrayOfRational.length;
    int i = 0;
    while (i < j)
    {
      Rational localRational = paramArrayOfRational[i];
      if ((localRational.getNumerator() < -2147483648L) || (localRational.getDenominator() < -2147483648L) || (localRational.getNumerator() > 2147483647L) || (localRational.getDenominator() > 2147483647L)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean checkOverflowForUnsignedLong(int[] paramArrayOfInt)
  {
    int j = paramArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      if (paramArrayOfInt[i] < 0) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean checkOverflowForUnsignedLong(long[] paramArrayOfLong)
  {
    int j = paramArrayOfLong.length;
    int i = 0;
    while (i < j)
    {
      long l = paramArrayOfLong[i];
      if ((l < 0L) || (l > 4294967295L)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean checkOverflowForUnsignedRational(Rational[] paramArrayOfRational)
  {
    int j = paramArrayOfRational.length;
    int i = 0;
    while (i < j)
    {
      Rational localRational = paramArrayOfRational[i];
      if ((localRational.getNumerator() < 0L) || (localRational.getDenominator() < 0L) || (localRational.getNumerator() > 4294967295L) || (localRational.getDenominator() > 4294967295L)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean checkOverflowForUnsignedShort(int[] paramArrayOfInt)
  {
    int j = paramArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      int k = paramArrayOfInt[i];
      if ((k > 65535) || (k < 0)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private static String convertTypeToString(short paramShort)
  {
    switch (paramShort)
    {
    case 6: 
    case 8: 
    default: 
      return "";
    case 1: 
      return "UNSIGNED_BYTE";
    case 2: 
      return "ASCII";
    case 3: 
      return "UNSIGNED_SHORT";
    case 4: 
      return "UNSIGNED_LONG";
    case 5: 
      return "UNSIGNED_RATIONAL";
    case 7: 
      return "UNDEFINED";
    case 9: 
      return "LONG";
    }
    return "RATIONAL";
  }
  
  public static int getElementSize(short paramShort)
  {
    return TYPE_TO_SIZE_MAP[paramShort];
  }
  
  public static boolean isValidIfd(int paramInt)
  {
    return (paramInt == 0) || (paramInt == 1) || (paramInt == 2) || (paramInt == 3) || (paramInt == 4);
  }
  
  public static boolean isValidType(short paramShort)
  {
    return (paramShort == 1) || (paramShort == 2) || (paramShort == 3) || (paramShort == 4) || (paramShort == 5) || (paramShort == 7) || (paramShort == 9) || (paramShort == 10);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == null) {}
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
                  return false;
                } while (!(paramObject instanceof ExifTag));
                paramObject = (ExifTag)paramObject;
              } while ((mTagId != mTagId) || (mComponentCountActual != mComponentCountActual) || (mDataType != mDataType));
              if (mValue == null) {
                break;
              }
            } while (mValue == null);
            if (!(mValue instanceof long[])) {
              break;
            }
          } while (!(mValue instanceof long[]));
          return Arrays.equals((long[])mValue, (long[])mValue);
          if (!(mValue instanceof Rational[])) {
            break;
          }
        } while (!(mValue instanceof Rational[]));
        return Arrays.equals((Rational[])mValue, (Rational[])mValue);
        if (!(mValue instanceof byte[])) {
          break;
        }
      } while (!(mValue instanceof byte[]));
      return Arrays.equals((byte[])mValue, (byte[])mValue);
      return mValue.equals(mValue);
    } while (mValue != null);
    return true;
  }
  
  public String forceGetValueAsString()
  {
    if (mValue == null) {
      return "";
    }
    if ((mValue instanceof byte[]))
    {
      if (mDataType == 2) {
        return new String((byte[])mValue, US_ASCII);
      }
      return Arrays.toString((byte[])mValue);
    }
    if ((mValue instanceof long[]))
    {
      if (((long[])mValue).length == 1) {
        return String.valueOf(((long[])(long[])mValue)[0]);
      }
      return Arrays.toString((long[])mValue);
    }
    if ((mValue instanceof Object[]))
    {
      if (((Object[])mValue).length == 1)
      {
        Object localObject = ((Object[])(Object[])mValue)[0];
        if (localObject == null) {
          return "";
        }
        return localObject.toString();
      }
      return Arrays.toString((Object[])mValue);
    }
    return mValue.toString();
  }
  
  protected void forceSetComponentCount(int paramInt)
  {
    mComponentCountActual = paramInt;
  }
  
  protected void getBytes(byte[] paramArrayOfByte)
  {
    getBytes(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  protected void getBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if ((mDataType != 7) && (mDataType != 1)) {
      throw new IllegalArgumentException("Cannot get BYTE value from " + convertTypeToString(mDataType));
    }
    Object localObject = mValue;
    int i = paramInt2;
    if (paramInt2 > mComponentCountActual) {
      i = mComponentCountActual;
    }
    System.arraycopy(localObject, 0, paramArrayOfByte, paramInt1, i);
  }
  
  public int getComponentCount()
  {
    return mComponentCountActual;
  }
  
  public int getDataSize()
  {
    return getComponentCount() * getElementSize(getDataType());
  }
  
  public short getDataType()
  {
    return mDataType;
  }
  
  public int getIfd()
  {
    return mIfd;
  }
  
  protected int getOffset()
  {
    return mOffset;
  }
  
  protected Rational getRational(int paramInt)
  {
    if ((mDataType != 10) && (mDataType != 5)) {
      throw new IllegalArgumentException("Cannot get RATIONAL value from " + convertTypeToString(mDataType));
    }
    return ((Rational[])(Rational[])mValue)[paramInt];
  }
  
  protected byte[] getStringByte()
  {
    return (byte[])mValue;
  }
  
  public short getTagId()
  {
    return mTagId;
  }
  
  public Object getValue()
  {
    return mValue;
  }
  
  public int[] getValueAsInts()
  {
    Object localObject = null;
    if (mValue == null) {}
    while (!(mValue instanceof long[])) {
      return localObject;
    }
    long[] arrayOfLong = (long[])mValue;
    int[] arrayOfInt = new int[arrayOfLong.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfInt;
      if (i >= arrayOfLong.length) {
        break;
      }
      arrayOfInt[i] = ((int)arrayOfLong[i]);
      i += 1;
    }
  }
  
  protected long getValueAt(int paramInt)
  {
    if ((mValue instanceof long[])) {
      return ((long[])(long[])mValue)[paramInt];
    }
    if ((mValue instanceof byte[])) {
      return ((byte[])(byte[])mValue)[paramInt];
    }
    throw new IllegalArgumentException("Cannot get integer value from " + convertTypeToString(mDataType));
  }
  
  protected boolean hasDefinedCount()
  {
    return mHasDefinedDefaultComponentCount;
  }
  
  public boolean hasValue()
  {
    return mValue != null;
  }
  
  protected void setHasDefinedCount(boolean paramBoolean)
  {
    mHasDefinedDefaultComponentCount = paramBoolean;
  }
  
  protected void setIfd(int paramInt)
  {
    mIfd = paramInt;
  }
  
  protected void setOffset(int paramInt)
  {
    mOffset = paramInt;
  }
  
  public boolean setValue(byte paramByte)
  {
    return setValue(new byte[] { paramByte });
  }
  
  public boolean setValue(int paramInt)
  {
    return setValue(new int[] { paramInt });
  }
  
  public boolean setValue(long paramLong)
  {
    return setValue(new long[] { paramLong });
  }
  
  public boolean setValue(Rational paramRational)
  {
    return setValue(new Rational[] { paramRational });
  }
  
  public boolean setValue(Object paramObject)
  {
    if (paramObject == null) {}
    do
    {
      return false;
      if ((paramObject instanceof Short)) {
        return setValue(((Short)paramObject).shortValue() & 0xFFFF);
      }
      if ((paramObject instanceof String)) {
        return setValue((String)paramObject);
      }
      if ((paramObject instanceof int[])) {
        return setValue((int[])paramObject);
      }
      if ((paramObject instanceof long[])) {
        return setValue((long[])paramObject);
      }
      if ((paramObject instanceof Rational)) {
        return setValue((Rational)paramObject);
      }
      if ((paramObject instanceof Rational[])) {
        return setValue((Rational[])paramObject);
      }
      if ((paramObject instanceof byte[])) {
        return setValue((byte[])paramObject);
      }
      if ((paramObject instanceof Integer)) {
        return setValue(((Integer)paramObject).intValue());
      }
      if ((paramObject instanceof Long)) {
        return setValue(((Long)paramObject).longValue());
      }
      if ((paramObject instanceof Byte)) {
        return setValue(((Byte)paramObject).byteValue());
      }
      int k;
      if ((paramObject instanceof Short[]))
      {
        paramObject = (Short[])paramObject;
        localObject = new int[paramObject.length];
        j = 0;
        if (j < paramObject.length)
        {
          if (paramObject[j] == null) {}
          for (k = 0;; k = paramObject[j].shortValue() & 0xFFFF)
          {
            localObject[j] = k;
            j += 1;
            break;
          }
        }
        return setValue((int[])localObject);
      }
      if ((paramObject instanceof Integer[]))
      {
        paramObject = (Integer[])paramObject;
        localObject = new int[paramObject.length];
        j = 0;
        if (j < paramObject.length)
        {
          if (paramObject[j] == null) {}
          for (k = 0;; k = paramObject[j].intValue())
          {
            localObject[j] = k;
            j += 1;
            break;
          }
        }
        return setValue((int[])localObject);
      }
      if ((paramObject instanceof Long[]))
      {
        paramObject = (Long[])paramObject;
        localObject = new long[paramObject.length];
        j = 0;
        if (j < paramObject.length)
        {
          if (paramObject[j] == null) {}
          for (long l = 0L;; l = paramObject[j].longValue())
          {
            localObject[j] = l;
            j += 1;
            break;
          }
        }
        return setValue((long[])localObject);
      }
    } while (!(paramObject instanceof Byte[]));
    paramObject = (Byte[])paramObject;
    Object localObject = new byte[paramObject.length];
    int j = 0;
    if (j < paramObject.length)
    {
      if (paramObject[j] == null) {}
      for (int i = 0;; i = paramObject[j].byteValue())
      {
        localObject[j] = i;
        j += 1;
        break;
      }
    }
    return setValue((byte[])localObject);
  }
  
  public boolean setValue(String paramString)
  {
    if ((mDataType != 2) && (mDataType != 7)) {
      return false;
    }
    paramString = paramString.getBytes(US_ASCII);
    String str = paramString;
    if (paramString.length > 0) {
      if ((paramString[(paramString.length - 1)] != 0) && (mDataType != 7)) {}
    }
    for (;;)
    {
      int i = paramString.length;
      if (checkBadComponentCount(i)) {
        break;
      }
      mComponentCountActual = i;
      mValue = paramString;
      return true;
      paramString = Arrays.copyOf(paramString, paramString.length + 1);
      continue;
      paramString = str;
      if (mDataType == 2)
      {
        paramString = str;
        if (mComponentCountActual == 1)
        {
          paramString = new byte[1];
          paramString[0] = 0;
        }
      }
    }
  }
  
  public boolean setValue(byte[] paramArrayOfByte)
  {
    return setValue(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public boolean setValue(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (checkBadComponentCount(paramInt2)) {}
    while ((mDataType != 1) && (mDataType != 7)) {
      return false;
    }
    mValue = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, mValue, 0, paramInt2);
    mComponentCountActual = paramInt2;
    return true;
  }
  
  public boolean setValue(int[] paramArrayOfInt)
  {
    if (checkBadComponentCount(paramArrayOfInt.length)) {}
    while (((mDataType != 3) && (mDataType != 9) && (mDataType != 4)) || ((mDataType == 3) && (checkOverflowForUnsignedShort(paramArrayOfInt))) || ((mDataType == 4) && (checkOverflowForUnsignedLong(paramArrayOfInt)))) {
      return false;
    }
    long[] arrayOfLong = new long[paramArrayOfInt.length];
    int i = 0;
    while (i < paramArrayOfInt.length)
    {
      arrayOfLong[i] = paramArrayOfInt[i];
      i += 1;
    }
    mValue = arrayOfLong;
    mComponentCountActual = paramArrayOfInt.length;
    return true;
  }
  
  public boolean setValue(long[] paramArrayOfLong)
  {
    if ((checkBadComponentCount(paramArrayOfLong.length)) || (mDataType != 4)) {}
    while (checkOverflowForUnsignedLong(paramArrayOfLong)) {
      return false;
    }
    mValue = paramArrayOfLong;
    mComponentCountActual = paramArrayOfLong.length;
    return true;
  }
  
  public boolean setValue(Rational[] paramArrayOfRational)
  {
    if (checkBadComponentCount(paramArrayOfRational.length)) {}
    while (((mDataType != 5) && (mDataType != 10)) || ((mDataType == 5) && (checkOverflowForUnsignedRational(paramArrayOfRational))) || ((mDataType == 10) && (checkOverflowForRational(paramArrayOfRational)))) {
      return false;
    }
    mValue = paramArrayOfRational;
    mComponentCountActual = paramArrayOfRational.length;
    return true;
  }
  
  public String toString()
  {
    return String.format("tag id: %04X\n", new Object[] { Short.valueOf(mTagId) }) + "ifd id: " + mIfd + "\ntype: " + convertTypeToString(mDataType) + "\ncount: " + mComponentCountActual + "\noffset: " + mOffset + "\nvalue: " + forceGetValueAsString() + "\n";
  }
}
