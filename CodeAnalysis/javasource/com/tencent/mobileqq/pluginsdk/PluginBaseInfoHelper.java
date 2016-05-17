package com.tencent.mobileqq.pluginsdk;

import android.util.Xml;
import java.io.ByteArrayInputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import org.xmlpull.v1.XmlSerializer;

public final class PluginBaseInfoHelper
{
  public PluginBaseInfoHelper() {}
  
  /* Error */
  public static PluginBaseInfo createFromFile(java.io.File paramFile, Class paramClass)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: invokevirtual 36	java/io/File:length	()J
    //   6: l2i
    //   7: newarray byte
    //   9: astore_3
    //   10: new 38	java/io/FileInputStream
    //   13: dup
    //   14: aload_0
    //   15: invokespecial 41	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   18: astore_0
    //   19: aload_0
    //   20: aload_3
    //   21: invokevirtual 45	java/io/FileInputStream:read	([B)I
    //   24: pop
    //   25: new 47	java/lang/String
    //   28: dup
    //   29: aload_3
    //   30: iconst_0
    //   31: invokestatic 51	com/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper$Base64Helper:decode	([BI)[B
    //   34: invokespecial 54	java/lang/String:<init>	([B)V
    //   37: astore_3
    //   38: new 18	com/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper$PluginInfoParser
    //   41: dup
    //   42: invokespecial 55	com/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper$PluginInfoParser:<init>	()V
    //   45: astore 4
    //   47: aload 4
    //   49: aload_1
    //   50: invokevirtual 59	com/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper$PluginInfoParser:setResultClass	(Ljava/lang/Class;)V
    //   53: aload_3
    //   54: aload 4
    //   56: invokestatic 63	com/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper:parseConfig	(Ljava/lang/String;Lcom/tencent/mobileqq/pluginsdk/PluginBaseInfoHelper$PluginInfoParser;)Lcom/tencent/mobileqq/pluginsdk/PluginBaseInfo;
    //   59: astore_1
    //   60: aload_1
    //   61: astore_2
    //   62: aload_0
    //   63: ifnull +9 -> 72
    //   66: aload_0
    //   67: invokevirtual 66	java/io/FileInputStream:close	()V
    //   70: aload_1
    //   71: astore_2
    //   72: aload_2
    //   73: areturn
    //   74: astore_0
    //   75: aconst_null
    //   76: astore_0
    //   77: aload_0
    //   78: ifnull -6 -> 72
    //   81: aload_0
    //   82: invokevirtual 66	java/io/FileInputStream:close	()V
    //   85: aconst_null
    //   86: areturn
    //   87: astore_0
    //   88: aconst_null
    //   89: areturn
    //   90: astore_1
    //   91: aconst_null
    //   92: astore_0
    //   93: aload_0
    //   94: ifnull +7 -> 101
    //   97: aload_0
    //   98: invokevirtual 66	java/io/FileInputStream:close	()V
    //   101: aload_1
    //   102: athrow
    //   103: astore_0
    //   104: aload_1
    //   105: areturn
    //   106: astore_0
    //   107: goto -6 -> 101
    //   110: astore_1
    //   111: goto -18 -> 93
    //   114: astore_1
    //   115: goto -38 -> 77
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	118	0	paramFile	java.io.File
    //   0	118	1	paramClass	Class
    //   1	72	2	localClass	Class
    //   9	45	3	localObject	Object
    //   45	10	4	localPluginInfoParser	PluginInfoParser
    // Exception table:
    //   from	to	target	type
    //   10	19	74	java/lang/Exception
    //   81	85	87	java/io/IOException
    //   10	19	90	finally
    //   66	70	103	java/io/IOException
    //   97	101	106	java/io/IOException
    //   19	60	110	finally
    //   19	60	114	java/lang/Exception
  }
  
  public static PluginBaseInfo parseConfig(String paramString, PluginInfoParser paramPluginInfoParser)
  {
    try
    {
      SAXParserFactory.newInstance().newSAXParser().parse(new ByteArrayInputStream(paramString.getBytes()), paramPluginInfoParser);
      paramString = paramPluginInfoParser.getResult();
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  public static class Base64Helper
  {
    public static final int CRLF = 4;
    public static final int DEFAULT = 0;
    public static final int NO_CLOSE = 16;
    public static final int NO_PADDING = 1;
    public static final int NO_WRAP = 2;
    public static final int URL_SAFE = 8;
    
    static
    {
      if (!PluginBaseInfoHelper.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        a = bool;
        return;
      }
    }
    
    protected Base64Helper() {}
    
    public static byte[] decode(String paramString, int paramInt)
    {
      return decode(paramString.getBytes(), paramInt);
    }
    
    public static byte[] decode(byte[] paramArrayOfByte, int paramInt)
    {
      return decode(paramArrayOfByte, 0, paramArrayOfByte.length, paramInt);
    }
    
    public static byte[] decode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
    {
      b localB = new b(paramInt3, new byte[paramInt2 * 3 / 4]);
      if (!localB.a(paramArrayOfByte, paramInt1, paramInt2, true)) {
        throw new IllegalArgumentException("bad base-64");
      }
      if (b == a.length) {
        return a;
      }
      paramArrayOfByte = new byte[b];
      System.arraycopy(a, 0, paramArrayOfByte, 0, b);
      return paramArrayOfByte;
    }
    
    public static byte[] encode(byte[] paramArrayOfByte, int paramInt)
    {
      return encode(paramArrayOfByte, 0, paramArrayOfByte.length, paramInt);
    }
    
    public static byte[] encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
    {
      c localC = new c(paramInt3, null);
      int i = paramInt2 / 3 * 4;
      int j;
      if (e)
      {
        paramInt3 = i;
        if (paramInt2 % 3 > 0) {
          paramInt3 = i + 4;
        }
        i = paramInt3;
        if (f)
        {
          i = paramInt3;
          if (paramInt2 > 0)
          {
            j = (paramInt2 - 1) / 57;
            if (!g) {
              break label186;
            }
          }
        }
      }
      label186:
      for (i = 2;; i = 1)
      {
        i = paramInt3 + i * (j + 1);
        a = new byte[i];
        localC.a(paramArrayOfByte, paramInt1, paramInt2, true);
        if ((a) || (b == i)) {
          break label192;
        }
        throw new AssertionError();
        paramInt3 = i;
        switch (paramInt2 % 3)
        {
        case 0: 
        default: 
          paramInt3 = i;
          break;
        case 1: 
          paramInt3 = i + 2;
          break;
        case 2: 
          paramInt3 = i + 3;
          break;
        }
      }
      label192:
      return a;
    }
    
    public static String encodeToString(byte[] paramArrayOfByte, int paramInt)
    {
      try
      {
        paramArrayOfByte = new String(encode(paramArrayOfByte, paramInt), "US-ASCII");
        return paramArrayOfByte;
      }
      catch (UnsupportedEncodingException paramArrayOfByte)
      {
        throw new AssertionError(paramArrayOfByte);
      }
    }
    
    public static String encodeToString(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
    {
      try
      {
        paramArrayOfByte = new String(encode(paramArrayOfByte, paramInt1, paramInt2, paramInt3), "US-ASCII");
        return paramArrayOfByte;
      }
      catch (UnsupportedEncodingException paramArrayOfByte)
      {
        throw new AssertionError(paramArrayOfByte);
      }
    }
    
    static abstract class a
    {
      public byte[] a;
      public int b;
      
      a() {}
      
      public abstract int a(int paramInt);
      
      public abstract boolean a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean);
    }
    
    static class b
      extends PluginBaseInfoHelper.Base64Helper.a
    {
      private static final int[] c = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
      private static final int[] d = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
      private static final int e = -1;
      private static final int f = -2;
      private int g;
      private int h;
      private final int[] i;
      
      public b(int paramInt, byte[] paramArrayOfByte)
      {
        a = paramArrayOfByte;
        if ((paramInt & 0x8) == 0) {}
        for (paramArrayOfByte = c;; paramArrayOfByte = d)
        {
          i = paramArrayOfByte;
          g = 0;
          h = 0;
          return;
        }
      }
      
      public int a(int paramInt)
      {
        return paramInt * 3 / 4 + 10;
      }
      
      public boolean a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean)
      {
        if (g == 6) {
          return false;
        }
        int i3 = paramInt2 + paramInt1;
        int k = g;
        paramInt2 = h;
        int j = 0;
        byte[] arrayOfByte = a;
        int[] arrayOfInt = i;
        int m;
        int n;
        int i2;
        if (paramInt1 < i3)
        {
          m = j;
          n = paramInt2;
          i2 = paramInt1;
          if (k == 0)
          {
            int i1 = paramInt1;
            for (paramInt1 = paramInt2; i1 + 4 <= i3; paramInt1 = paramInt2)
            {
              paramInt2 = arrayOfInt[(paramArrayOfByte[i1] & 0xFF)] << 18 | arrayOfInt[(paramArrayOfByte[(i1 + 1)] & 0xFF)] << 12 | arrayOfInt[(paramArrayOfByte[(i1 + 2)] & 0xFF)] << 6 | arrayOfInt[(paramArrayOfByte[(i1 + 3)] & 0xFF)];
              paramInt1 = paramInt2;
              if (paramInt2 < 0) {
                break;
              }
              arrayOfByte[(j + 2)] = ((byte)paramInt2);
              arrayOfByte[(j + 1)] = ((byte)(paramInt2 >> 8));
              arrayOfByte[j] = ((byte)(paramInt2 >> 16));
              j += 3;
              i1 += 4;
            }
            m = j;
            n = paramInt1;
            i2 = i1;
            if (i1 >= i3) {
              paramInt2 = paramInt1;
            }
          }
        }
        for (;;)
        {
          if (!paramBoolean)
          {
            g = k;
            h = paramInt2;
            b = j;
            return true;
            paramInt2 = arrayOfInt[(paramArrayOfByte[i2] & 0xFF)];
            switch (k)
            {
            }
            label292:
            label577:
            do
            {
              do
              {
                paramInt1 = k;
                paramInt2 = n;
                j = m;
                for (;;)
                {
                  k = paramInt1;
                  paramInt1 = i2 + 1;
                  break;
                  if (paramInt2 >= 0)
                  {
                    paramInt1 = k + 1;
                    j = m;
                  }
                  else
                  {
                    if (paramInt2 == -1) {
                      break label292;
                    }
                    g = 6;
                    return false;
                    if (paramInt2 >= 0)
                    {
                      paramInt2 = n << 6 | paramInt2;
                      paramInt1 = k + 1;
                      j = m;
                    }
                    else
                    {
                      if (paramInt2 == -1) {
                        break label292;
                      }
                      g = 6;
                      return false;
                      if (paramInt2 >= 0)
                      {
                        paramInt2 = n << 6 | paramInt2;
                        paramInt1 = k + 1;
                        j = m;
                      }
                      else if (paramInt2 == -2)
                      {
                        arrayOfByte[m] = ((byte)(n >> 4));
                        paramInt1 = 4;
                        j = m + 1;
                        paramInt2 = n;
                      }
                      else
                      {
                        if (paramInt2 == -1) {
                          break label292;
                        }
                        g = 6;
                        return false;
                        if (paramInt2 >= 0)
                        {
                          paramInt2 = n << 6 | paramInt2;
                          arrayOfByte[(m + 2)] = ((byte)paramInt2);
                          arrayOfByte[(m + 1)] = ((byte)(paramInt2 >> 8));
                          arrayOfByte[m] = ((byte)(paramInt2 >> 16));
                          j = m + 3;
                          paramInt1 = 0;
                        }
                        else if (paramInt2 == -2)
                        {
                          arrayOfByte[(m + 1)] = ((byte)(n >> 2));
                          arrayOfByte[m] = ((byte)(n >> 10));
                          j = m + 2;
                          paramInt1 = 5;
                          paramInt2 = n;
                        }
                        else
                        {
                          if (paramInt2 == -1) {
                            break label292;
                          }
                          g = 6;
                          return false;
                          if (paramInt2 != -2) {
                            break label577;
                          }
                          paramInt1 = k + 1;
                          j = m;
                          paramInt2 = n;
                        }
                      }
                    }
                  }
                }
              } while (paramInt2 == -1);
              g = 6;
              return false;
            } while (paramInt2 == -1);
            g = 6;
            return false;
          }
          paramInt1 = j;
          switch (k)
          {
          default: 
            paramInt1 = j;
          case 0: 
          case 1: 
          case 2: 
          case 3: 
            for (;;)
            {
              g = k;
              b = paramInt1;
              return true;
              g = 6;
              return false;
              arrayOfByte[j] = ((byte)(paramInt2 >> 4));
              paramInt1 = j + 1;
              continue;
              m = j + 1;
              arrayOfByte[j] = ((byte)(paramInt2 >> 10));
              paramInt1 = m + 1;
              arrayOfByte[m] = ((byte)(paramInt2 >> 2));
            }
          }
          g = 6;
          return false;
        }
      }
    }
    
    static class c
      extends PluginBaseInfoHelper.Base64Helper.a
    {
      public static final int c = 19;
      private static final byte[] i;
      private static final byte[] j;
      int d;
      public final boolean e;
      public final boolean f;
      public final boolean g;
      private final byte[] k;
      private int l;
      private final byte[] m;
      
      static
      {
        if (!PluginBaseInfoHelper.class.desiredAssertionStatus()) {}
        for (boolean bool = true;; bool = false)
        {
          h = bool;
          i = new byte[] { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47 };
          j = new byte[] { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95 };
          return;
        }
      }
      
      public c(int paramInt, byte[] paramArrayOfByte)
      {
        a = paramArrayOfByte;
        boolean bool1;
        if ((paramInt & 0x1) == 0)
        {
          bool1 = true;
          e = bool1;
          if ((paramInt & 0x2) != 0) {
            break label101;
          }
          bool1 = true;
          label33:
          f = bool1;
          if ((paramInt & 0x4) == 0) {
            break label106;
          }
          bool1 = bool2;
          label47:
          g = bool1;
          if ((paramInt & 0x8) != 0) {
            break label111;
          }
          paramArrayOfByte = i;
          label63:
          m = paramArrayOfByte;
          k = new byte[2];
          d = 0;
          if (!f) {
            break label118;
          }
        }
        label101:
        label106:
        label111:
        label118:
        for (paramInt = 19;; paramInt = -1)
        {
          l = paramInt;
          return;
          bool1 = false;
          break;
          bool1 = false;
          break label33;
          bool1 = false;
          break label47;
          paramArrayOfByte = j;
          break label63;
        }
      }
      
      public int a(int paramInt)
      {
        return paramInt * 8 / 5 + 10;
      }
      
      public boolean a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean)
      {
        byte[] arrayOfByte1 = m;
        byte[] arrayOfByte2 = a;
        int n = 0;
        int i3 = l;
        int i5 = paramInt2 + paramInt1;
        int i2 = -1;
        label62:
        int i1;
        switch (d)
        {
        default: 
          paramInt2 = paramInt1;
          paramInt1 = i3;
          i1 = paramInt2;
          if (i2 != -1)
          {
            arrayOfByte2[0] = arrayOfByte1[(i2 >> 18 & 0x3F)];
            arrayOfByte2[1] = arrayOfByte1[(i2 >> 12 & 0x3F)];
            arrayOfByte2[2] = arrayOfByte1[(i2 >> 6 & 0x3F)];
            n = 4;
            arrayOfByte2[3] = arrayOfByte1[(i2 & 0x3F)];
            i2 = i3 - 1;
            paramInt1 = i2;
            i1 = paramInt2;
            if (i2 == 0)
            {
              if (!g) {
                break label1226;
              }
              paramInt1 = 5;
              arrayOfByte2[4] = 13;
            }
          }
          break;
        }
        for (;;)
        {
          arrayOfByte2[paramInt1] = 10;
          i1 = 19;
          paramInt1 += 1;
          for (;;)
          {
            label180:
            if (paramInt2 + 3 <= i5)
            {
              n = (paramArrayOfByte[paramInt2] & 0xFF) << 16 | (paramArrayOfByte[(paramInt2 + 1)] & 0xFF) << 8 | paramArrayOfByte[(paramInt2 + 2)] & 0xFF;
              arrayOfByte2[paramInt1] = arrayOfByte1[(n >> 18 & 0x3F)];
              arrayOfByte2[(paramInt1 + 1)] = arrayOfByte1[(n >> 12 & 0x3F)];
              arrayOfByte2[(paramInt1 + 2)] = arrayOfByte1[(n >> 6 & 0x3F)];
              arrayOfByte2[(paramInt1 + 3)] = arrayOfByte1[(n & 0x3F)];
              paramInt2 += 3;
              i2 = paramInt1 + 4;
              i3 = i1 - 1;
              paramInt1 = i3;
              n = i2;
              i1 = paramInt2;
              if (i3 != 0) {
                break label1210;
              }
              if (!g) {
                break label1204;
              }
              paramInt1 = i2 + 1;
              arrayOfByte2[i2] = 13;
            }
            for (;;)
            {
              arrayOfByte2[paramInt1] = 10;
              i1 = 19;
              paramInt1 += 1;
              break label180;
              paramInt2 = paramInt1;
              break label62;
              if (paramInt1 + 2 > i5) {
                break;
              }
              i1 = k[0];
              paramInt2 = paramInt1 + 1;
              i2 = (i1 & 0xFF) << 16 | (paramArrayOfByte[paramInt1] & 0xFF) << 8 | paramArrayOfByte[paramInt2] & 0xFF;
              d = 0;
              paramInt2 += 1;
              break label62;
              if (paramInt1 + 1 > i5) {
                break;
              }
              i1 = k[0];
              i2 = k[1];
              paramInt2 = paramInt1 + 1;
              i2 = (i1 & 0xFF) << 16 | (i2 & 0xFF) << 8 | paramArrayOfByte[paramInt1] & 0xFF;
              d = 0;
              break label62;
              label742:
              int i4;
              if (paramBoolean)
              {
                if (paramInt2 - d == i5 - 1)
                {
                  if (d > 0)
                  {
                    paramArrayOfByte = k;
                    n = 1;
                    i2 = paramArrayOfByte[0];
                  }
                  for (;;)
                  {
                    i2 = (i2 & 0xFF) << 4;
                    d -= n;
                    i3 = paramInt1 + 1;
                    arrayOfByte2[paramInt1] = arrayOfByte1[(i2 >> 6 & 0x3F)];
                    n = i3 + 1;
                    arrayOfByte2[i3] = arrayOfByte1[(i2 & 0x3F)];
                    paramInt1 = n;
                    if (e)
                    {
                      i2 = n + 1;
                      arrayOfByte2[n] = 61;
                      paramInt1 = i2 + 1;
                      arrayOfByte2[i2] = 61;
                    }
                    n = paramInt1;
                    if (f)
                    {
                      n = paramInt1;
                      if (g)
                      {
                        arrayOfByte2[paramInt1] = 13;
                        n = paramInt1 + 1;
                      }
                      arrayOfByte2[n] = 10;
                      n += 1;
                    }
                    i2 = paramInt2;
                    if ((h) || (d == 0)) {
                      break;
                    }
                    throw new AssertionError();
                    i2 = paramArrayOfByte[paramInt2];
                    paramInt2 += 1;
                    n = 0;
                  }
                }
                if (paramInt2 - d == i5 - 2) {
                  if (d > 1)
                  {
                    byte[] arrayOfByte3 = k;
                    i3 = 1;
                    i2 = arrayOfByte3[0];
                    n = paramInt2;
                    paramInt2 = i3;
                    if (d <= 0) {
                      break label946;
                    }
                    i3 = k[paramInt2];
                    i4 = paramInt2 + 1;
                    paramInt2 = n;
                    n = i4;
                    label769:
                    i2 = (i3 & 0xFF) << 2 | (i2 & 0xFF) << 10;
                    d -= n;
                    n = paramInt1 + 1;
                    arrayOfByte2[paramInt1] = arrayOfByte1[(i2 >> 12 & 0x3F)];
                    i3 = n + 1;
                    arrayOfByte2[n] = arrayOfByte1[(i2 >> 6 & 0x3F)];
                    paramInt1 = i3 + 1;
                    arrayOfByte2[i3] = arrayOfByte1[(i2 & 0x3F)];
                    if (!e) {
                      break label1201;
                    }
                    n = paramInt1 + 1;
                    arrayOfByte2[paramInt1] = 61;
                    paramInt1 = n;
                  }
                }
              }
              label946:
              label1123:
              label1201:
              for (;;)
              {
                n = paramInt1;
                if (f)
                {
                  n = paramInt1;
                  if (g)
                  {
                    arrayOfByte2[paramInt1] = 13;
                    n = paramInt1 + 1;
                  }
                  arrayOfByte2[n] = 10;
                  n += 1;
                }
                i2 = paramInt2;
                break;
                i2 = paramArrayOfByte[paramInt2];
                n = paramInt2 + 1;
                paramInt2 = 0;
                break label742;
                i3 = paramArrayOfByte[n];
                i4 = n + 1;
                n = paramInt2;
                paramInt2 = i4;
                break label769;
                i2 = paramInt2;
                n = paramInt1;
                if (!f) {
                  break;
                }
                i2 = paramInt2;
                n = paramInt1;
                if (paramInt1 <= 0) {
                  break;
                }
                i2 = paramInt2;
                n = paramInt1;
                if (i1 == 19) {
                  break;
                }
                if (g)
                {
                  n = paramInt1 + 1;
                  arrayOfByte2[paramInt1] = 13;
                  paramInt1 = n;
                }
                for (;;)
                {
                  n = paramInt1 + 1;
                  arrayOfByte2[paramInt1] = 10;
                  i2 = paramInt2;
                  break;
                  i3 = n;
                  if (!h)
                  {
                    i3 = n;
                    if (i2 != i5)
                    {
                      throw new AssertionError();
                      if (paramInt2 != i5 - 1) {
                        break label1123;
                      }
                      arrayOfByte1 = k;
                      n = d;
                      d = (n + 1);
                      arrayOfByte1[n] = paramArrayOfByte[paramInt2];
                      i3 = paramInt1;
                    }
                  }
                  for (;;)
                  {
                    b = i3;
                    l = i1;
                    return true;
                    i3 = paramInt1;
                    if (paramInt2 == i5 - 2)
                    {
                      arrayOfByte1 = k;
                      n = d;
                      d = (n + 1);
                      arrayOfByte1[n] = paramArrayOfByte[paramInt2];
                      arrayOfByte1 = k;
                      n = d;
                      d = (n + 1);
                      arrayOfByte1[n] = paramArrayOfByte[(paramInt2 + 1)];
                      i3 = paramInt1;
                    }
                  }
                }
              }
              label1204:
              paramInt1 = i2;
            }
            label1210:
            i2 = paramInt1;
            paramInt1 = n;
            paramInt2 = i1;
            i1 = i2;
          }
          label1226:
          paramInt1 = 4;
        }
      }
    }
  }
  
  public static class PluginInfoParser
    extends DefaultHandler
  {
    private static final String a = "PluginInfo";
    private static final String b = "ID";
    private static final String c = "Name";
    private static final String d = "Version";
    private static final String e = "MD5";
    private static final String f = "URL";
    private static final String g = "Type";
    private static final String h = "PackageName";
    private static final String i = "CurVersion";
    private static final String j = "Length";
    private static final String k = "State";
    private static final String l = "Processes";
    private static final String m = "UpdateType";
    private static final String n = "InstallType";
    private static final String o = "InstalledPath";
    private static final String p = "ForceUrl";
    private Class q;
    private PluginBaseInfo r;
    private StringBuilder s;
    
    public PluginInfoParser() {}
    
    public static String pluginToXML(PluginBaseInfo paramPluginBaseInfo)
      throws Exception
    {
      XmlSerializer localXmlSerializer = Xml.newSerializer();
      StringWriter localStringWriter = new StringWriter();
      localXmlSerializer.setOutput(localStringWriter);
      localXmlSerializer.startDocument("utf-8", null);
      localXmlSerializer.startTag("", "PluginInfo");
      localXmlSerializer.startTag("", "ID");
      localXmlSerializer.text(mID);
      localXmlSerializer.endTag("", "ID");
      localXmlSerializer.startTag("", "Name");
      localXmlSerializer.text(mName);
      localXmlSerializer.endTag("", "Name");
      localXmlSerializer.startTag("", "Version");
      localXmlSerializer.text(mVersion);
      localXmlSerializer.endTag("", "Version");
      localXmlSerializer.startTag("", "URL");
      localXmlSerializer.text(mURL);
      localXmlSerializer.endTag("", "URL");
      localXmlSerializer.startTag("", "MD5");
      localXmlSerializer.text(mMD5);
      localXmlSerializer.endTag("", "MD5");
      localXmlSerializer.startTag("", "Type");
      localXmlSerializer.text(String.valueOf(mType));
      localXmlSerializer.endTag("", "Type");
      localXmlSerializer.startTag("", "PackageName");
      localXmlSerializer.text(mPackageName);
      localXmlSerializer.endTag("", "PackageName");
      localXmlSerializer.startTag("", "CurVersion");
      localXmlSerializer.text(String.valueOf(mCurVersion));
      localXmlSerializer.endTag("", "CurVersion");
      localXmlSerializer.startTag("", "Length");
      localXmlSerializer.text(String.valueOf(mLength));
      localXmlSerializer.endTag("", "Length");
      localXmlSerializer.startTag("", "State");
      localXmlSerializer.text(String.valueOf(mState));
      localXmlSerializer.endTag("", "State");
      String str1 = "";
      String str2 = str1;
      if (mProcesses != null)
      {
        String[] arrayOfString = mProcesses;
        int i2 = arrayOfString.length;
        int i1 = 0;
        for (;;)
        {
          str2 = str1;
          if (i1 >= i2) {
            break;
          }
          str2 = arrayOfString[i1];
          str1 = str1 + str2 + "|";
          i1 += 1;
        }
      }
      localXmlSerializer.startTag("", "Processes");
      localXmlSerializer.text(str2);
      localXmlSerializer.endTag("", "Processes");
      localXmlSerializer.startTag("", "UpdateType");
      localXmlSerializer.text(String.valueOf(mUpdateType));
      localXmlSerializer.endTag("", "UpdateType");
      localXmlSerializer.startTag("", "InstallType");
      localXmlSerializer.text(String.valueOf(mInstallType));
      localXmlSerializer.endTag("", "InstallType");
      localXmlSerializer.startTag("", "InstalledPath");
      if (mInstalledPath == null) {}
      for (paramPluginBaseInfo = "";; paramPluginBaseInfo = mInstalledPath)
      {
        localXmlSerializer.text(paramPluginBaseInfo);
        localXmlSerializer.endTag("", "InstalledPath");
        localXmlSerializer.endTag("", "PluginInfo");
        localXmlSerializer.endDocument();
        return localStringWriter.toString();
      }
    }
    
    public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
      throws SAXException
    {
      s.append(paramArrayOfChar, paramInt1, paramInt2);
    }
    
    public void endDocument()
      throws SAXException
    {
      s = null;
    }
    
    public void endElement(String paramString1, String paramString2, String paramString3)
      throws SAXException
    {
      paramString1 = s.toString();
      if ("ID".equals(paramString2)) {
        r.mID = paramString1;
      }
      do
      {
        return;
        if ("Name".equals(paramString2))
        {
          r.mName = paramString1;
          return;
        }
        if ("Version".equals(paramString2))
        {
          r.mVersion = paramString1;
          return;
        }
        if ("URL".equals(paramString2))
        {
          r.mURL = paramString1;
          return;
        }
        if ("MD5".equals(paramString2))
        {
          r.mMD5 = paramString1;
          return;
        }
        if ("Type".equals(paramString2))
        {
          r.mType = Integer.valueOf(paramString1).intValue();
          return;
        }
        if ("PackageName".equals(paramString2))
        {
          r.mPackageName = paramString1;
          return;
        }
        if ("CurVersion".equals(paramString2))
        {
          r.mCurVersion = Long.parseLong(paramString1);
          return;
        }
        if ("Length".equals(paramString2))
        {
          r.mLength = Long.parseLong(paramString1);
          return;
        }
        if ("State".equals(paramString2))
        {
          r.mState = Integer.parseInt(paramString1);
          return;
        }
        if ("Processes".equals(paramString2))
        {
          if (paramString1 != null)
          {
            r.mProcesses = paramString1.split("\\|");
            return;
          }
          r.mProcesses = new String[0];
          return;
        }
        if ("UpdateType".equals(paramString2))
        {
          r.mUpdateType = Integer.parseInt(paramString1);
          return;
        }
        if ("InstallType".equals(paramString2))
        {
          r.mInstallType = Integer.parseInt(paramString1);
          return;
        }
        if ("InstalledPath".equals(paramString2))
        {
          if ((paramString1 == null) || (paramString1.length() == 0))
          {
            r.mInstalledPath = null;
            return;
          }
          r.mInstalledPath = paramString1;
          return;
        }
      } while ((!"ForceUrl".equals(paramString2)) || (paramString1 == null) || (paramString1.length() <= 0));
      r.mForceUrl = 1;
    }
    
    public PluginBaseInfo getResult()
    {
      return r;
    }
    
    public void setResultClass(Class paramClass)
    {
      q = paramClass;
    }
    
    public void startDocument()
      throws SAXException
    {
      s = new StringBuilder();
    }
    
    public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
      throws SAXException
    {
      s.setLength(0);
      if ("PluginInfo".equals(paramString2)) {}
      try
      {
        r = ((PluginBaseInfo)q.newInstance());
        return;
      }
      catch (Exception paramString1) {}
    }
  }
}
