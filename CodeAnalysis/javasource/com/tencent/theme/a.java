package com.tencent.theme;

import android.content.res.XmlResourceParser;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import org.xmlpull.v1.XmlPullParserException;

public class a
  implements XmlResourceParser
{
  private static final int A = 1048834;
  private static final int B = 1048835;
  private static final int C = 1048836;
  private static final int D = 1048836;
  private static final String o = "Method is not supported.";
  private static final int p = 0;
  private static final int q = 1;
  private static final int r = 2;
  private static final int s = 3;
  private static final int t = 4;
  private static final int u = 5;
  private static final int v = 524291;
  private static final int w = 524672;
  private static final int x = 1048832;
  private static final int y = 1048832;
  private static final int z = 1048833;
  private ByteBuffer a;
  private boolean b = false;
  private l c;
  private int[] d;
  private a e = new a();
  private boolean f;
  private int g;
  private int h;
  private int i;
  private int j;
  private int[] k;
  private int l;
  private int m;
  private int n;
  
  public a()
  {
    b();
  }
  
  private final int a(String paramString1, String paramString2)
  {
    if ((c == null) || (paramString2 == null)) {}
    label104:
    for (;;)
    {
      return -1;
      int i3 = c.a(paramString2);
      if (i3 != -1)
      {
        int i1;
        int i2;
        if (paramString1 != null)
        {
          i1 = c.a(paramString1);
          i2 = 0;
        }
        for (;;)
        {
          if (i2 == k.length) {
            break label104;
          }
          if ((i3 == k[(i2 + 1)]) && ((i1 == -1) || (i1 == k[(i2 + 0)])))
          {
            return i2 / 5;
            i1 = -1;
            break;
          }
          i2 += 1;
        }
      }
    }
  }
  
  private final void b()
  {
    g = -1;
    h = -1;
    i = -1;
    j = -1;
    k = null;
    l = -1;
    m = -1;
    n = -1;
  }
  
  private final int c(int paramInt)
  {
    if (g != 2) {
      throw new IndexOutOfBoundsException("Current event is not START_TAG.");
    }
    int i1 = paramInt * 5;
    if (i1 >= k.length) {
      throw new IndexOutOfBoundsException("Invalid attribute index (" + paramInt + ").");
    }
    return i1;
  }
  
  private final void c()
    throws IOException
  {
    int i2 = 3;
    if (c == null)
    {
      c.a(a, 524291);
      c.b(a, 4);
      c = l.a(a);
      e.f();
      b = true;
    }
    if (g == 1) {
      return;
    }
    int i3 = g;
    b();
    int i1;
    do
    {
      int i4;
      for (;;)
      {
        if (f)
        {
          f = false;
          e.g();
        }
        if ((i3 == 3) && (e.e() == 1) && (e.c() == 0))
        {
          g = 1;
          return;
        }
        if (i3 == 0) {
          i1 = 1048834;
        }
        for (;;)
        {
          if (i1 == 524672)
          {
            i1 = a.getInt();
            if ((i1 < 8) || (i1 % 4 != 0))
            {
              throw new IOException("Invalid resource ids size (" + i1 + ").");
              i1 = a.getInt();
            }
            else
            {
              d = c.c(a, i1 / 4 - 2);
              break;
            }
          }
        }
        if ((i1 < 1048832) || (i1 > 1048836)) {
          throw new IOException("Invalid chunk type (" + i1 + ").");
        }
        if ((i1 == 1048834) && (i3 == -1))
        {
          g = 0;
          return;
        }
        c.b(a, 4);
        i4 = a.getInt();
        c.b(a, 4);
        if ((i1 != 1048832) && (i1 != 1048833)) {
          break;
        }
        if (i1 == 1048832)
        {
          i1 = a.getInt();
          i4 = a.getInt();
          e.a(i1, i4);
        }
        else
        {
          c.b(a, 4);
          c.b(a, 4);
          e.d();
        }
      }
      h = i4;
      if (i1 == 1048834)
      {
        j = a.getInt();
        i = a.getInt();
        c.b(a, 4);
        i1 = a.getInt();
        l = ((i1 >>> 16) - 1);
        m = a.getInt();
        n = ((m >>> 16) - 1);
        m = ((m & 0xFFFF) - 1);
        k = c.c(a, (i1 & 0xFFFF) * 5);
        i1 = i2;
        while (i1 < k.length)
        {
          k[i1] >>>= 24;
          i1 += 5;
        }
        e.f();
        g = 2;
        return;
      }
      if (i1 == 1048835)
      {
        j = a.getInt();
        i = a.getInt();
        g = 3;
        f = true;
        return;
      }
    } while (i1 != 1048836);
    i = a.getInt();
    c.b(a, 4);
    c.b(a, 4);
    g = 4;
  }
  
  public int a(int paramInt)
  {
    paramInt = c(paramInt);
    return k[(paramInt + 3)];
  }
  
  final l a()
  {
    return c;
  }
  
  public int b(int paramInt)
  {
    paramInt = c(paramInt);
    return k[(paramInt + 4)];
  }
  
  public void close()
  {
    if (!b) {
      return;
    }
    b = false;
    a = null;
    c = null;
    d = null;
    e.a();
    b();
  }
  
  public void defineEntityReplacementText(String paramString1, String paramString2)
    throws XmlPullParserException
  {
    throw new XmlPullParserException("Method is not supported.");
  }
  
  public boolean getAttributeBooleanValue(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i1 = 1; getAttributeIntValue(paramInt, i1) != 0; i1 = 0) {
      return true;
    }
    return false;
  }
  
  public boolean getAttributeBooleanValue(String paramString1, String paramString2, boolean paramBoolean)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return paramBoolean;
    }
    return getAttributeBooleanValue(i1, paramBoolean);
  }
  
  public int getAttributeCount()
  {
    if (g != 2) {
      return -1;
    }
    return k.length / 5;
  }
  
  public float getAttributeFloatValue(int paramInt, float paramFloat)
  {
    paramInt = c(paramInt);
    if (k[(paramInt + 3)] == 4) {
      paramFloat = Float.intBitsToFloat(k[(paramInt + 4)]);
    }
    return paramFloat;
  }
  
  public float getAttributeFloatValue(String paramString1, String paramString2, float paramFloat)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return paramFloat;
    }
    return getAttributeFloatValue(i1, paramFloat);
  }
  
  public int getAttributeIntValue(int paramInt1, int paramInt2)
  {
    int i1 = c(paramInt1);
    int i2 = k[(i1 + 3)];
    paramInt1 = paramInt2;
    if (i2 >= 16)
    {
      paramInt1 = paramInt2;
      if (i2 <= 31) {
        paramInt1 = k[(i1 + 4)];
      }
    }
    return paramInt1;
  }
  
  public int getAttributeIntValue(String paramString1, String paramString2, int paramInt)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return paramInt;
    }
    return getAttributeIntValue(i1, paramInt);
  }
  
  public int getAttributeListValue(int paramInt1, String[] paramArrayOfString, int paramInt2)
  {
    return 0;
  }
  
  public int getAttributeListValue(String paramString1, String paramString2, String[] paramArrayOfString, int paramInt)
  {
    return 0;
  }
  
  public String getAttributeName(int paramInt)
  {
    paramInt = c(paramInt);
    paramInt = k[(paramInt + 1)];
    if (paramInt == -1) {
      return "";
    }
    return c.a(paramInt);
  }
  
  public int getAttributeNameResource(int paramInt)
  {
    paramInt = c(paramInt);
    paramInt = k[(paramInt + 1)];
    if ((d == null) || (paramInt < 0) || (paramInt >= d.length)) {
      return 0;
    }
    return d[paramInt];
  }
  
  public String getAttributeNamespace(int paramInt)
  {
    paramInt = c(paramInt);
    paramInt = k[(paramInt + 0)];
    if (paramInt == -1) {
      return "";
    }
    return c.a(paramInt);
  }
  
  public String getAttributePrefix(int paramInt)
  {
    paramInt = c(paramInt);
    paramInt = k[(paramInt + 0)];
    paramInt = e.d(paramInt);
    if (paramInt == -1) {
      return "";
    }
    return c.a(paramInt);
  }
  
  public int getAttributeResourceValue(int paramInt1, int paramInt2)
  {
    paramInt1 = c(paramInt1);
    if (k[(paramInt1 + 3)] == 1) {
      paramInt2 = k[(paramInt1 + 4)];
    }
    return paramInt2;
  }
  
  public int getAttributeResourceValue(String paramString1, String paramString2, int paramInt)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return paramInt;
    }
    return getAttributeResourceValue(i1, paramInt);
  }
  
  public String getAttributeType(int paramInt)
  {
    return "CDATA";
  }
  
  public int getAttributeUnsignedIntValue(int paramInt1, int paramInt2)
  {
    return getAttributeIntValue(paramInt1, paramInt2);
  }
  
  public int getAttributeUnsignedIntValue(String paramString1, String paramString2, int paramInt)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return paramInt;
    }
    return getAttributeUnsignedIntValue(i1, paramInt);
  }
  
  public String getAttributeValue(int paramInt)
  {
    paramInt = c(paramInt);
    if (k[(paramInt + 3)] == 3)
    {
      paramInt = k[(paramInt + 2)];
      return c.a(paramInt);
    }
    paramInt = k[(paramInt + 4)];
    return "";
  }
  
  public String getAttributeValue(String paramString1, String paramString2)
  {
    int i1 = a(paramString1, paramString2);
    if (i1 == -1) {
      return null;
    }
    return getAttributeValue(i1);
  }
  
  public String getClassAttribute()
  {
    if (m == -1) {
      return null;
    }
    int i1 = c(m);
    i1 = k[(i1 + 2)];
    return c.a(i1);
  }
  
  public int getColumnNumber()
  {
    return -1;
  }
  
  public int getDepth()
  {
    return e.e() - 1;
  }
  
  public int getEventType()
    throws XmlPullParserException
  {
    return g;
  }
  
  public boolean getFeature(String paramString)
  {
    return false;
  }
  
  public String getIdAttribute()
  {
    if (l == -1) {
      return null;
    }
    int i1 = c(l);
    i1 = k[(i1 + 2)];
    return c.a(i1);
  }
  
  public int getIdAttributeResourceValue(int paramInt)
  {
    if (l == -1) {}
    int i1;
    do
    {
      return paramInt;
      i1 = c(l);
    } while (k[(i1 + 3)] != 1);
    return k[(i1 + 4)];
  }
  
  public String getInputEncoding()
  {
    return null;
  }
  
  public int getLineNumber()
  {
    return h;
  }
  
  public String getName()
  {
    if ((i == -1) || ((g != 2) && (g != 3))) {
      return null;
    }
    return c.a(i);
  }
  
  public String getNamespace()
  {
    return c.a(j);
  }
  
  public String getNamespace(String paramString)
  {
    throw new RuntimeException("Method is not supported.");
  }
  
  public int getNamespaceCount(int paramInt)
    throws XmlPullParserException
  {
    return e.a(paramInt);
  }
  
  public String getNamespacePrefix(int paramInt)
    throws XmlPullParserException
  {
    paramInt = e.b(paramInt);
    return c.a(paramInt);
  }
  
  public String getNamespaceUri(int paramInt)
    throws XmlPullParserException
  {
    paramInt = e.c(paramInt);
    return c.a(paramInt);
  }
  
  public String getPositionDescription()
  {
    return "XML line #" + getLineNumber();
  }
  
  public String getPrefix()
  {
    int i1 = e.d(j);
    return c.a(i1);
  }
  
  public Object getProperty(String paramString)
  {
    return null;
  }
  
  public int getStyleAttribute()
  {
    if (n == -1) {
      return 0;
    }
    int i1 = c(n);
    return k[(i1 + 4)];
  }
  
  public String getText()
  {
    if ((i == -1) || (g != 4)) {
      return null;
    }
    return c.a(i);
  }
  
  public char[] getTextCharacters(int[] paramArrayOfInt)
  {
    String str = getText();
    if (str == null) {
      return null;
    }
    paramArrayOfInt[0] = 0;
    paramArrayOfInt[1] = str.length();
    paramArrayOfInt = new char[str.length()];
    str.getChars(0, str.length(), paramArrayOfInt, 0);
    return paramArrayOfInt;
  }
  
  public boolean isAttributeDefault(int paramInt)
  {
    return false;
  }
  
  public boolean isEmptyElementTag()
    throws XmlPullParserException
  {
    return false;
  }
  
  public boolean isWhitespace()
    throws XmlPullParserException
  {
    return false;
  }
  
  public int next()
    throws XmlPullParserException, IOException
  {
    if (a == null) {
      throw new XmlPullParserException("Parser is not opened.", this, null);
    }
    try
    {
      c();
      int i1 = g;
      return i1;
    }
    catch (IOException localIOException)
    {
      close();
      throw localIOException;
    }
  }
  
  public int nextTag()
    throws XmlPullParserException, IOException
  {
    int i2 = next();
    int i1 = i2;
    if (i2 == 4)
    {
      i1 = i2;
      if (isWhitespace()) {
        i1 = next();
      }
    }
    if ((i1 != 2) && (i1 != 3)) {
      throw new XmlPullParserException("Expected start or end tag.", this, null);
    }
    return i1;
  }
  
  public String nextText()
    throws XmlPullParserException, IOException
  {
    if (getEventType() != 2) {
      throw new XmlPullParserException("Parser must be on START_TAG to read next text.", this, null);
    }
    int i1 = next();
    String str;
    if (i1 == 4)
    {
      str = getText();
      if (next() != 3) {
        throw new XmlPullParserException("Event TEXT must be immediately followed by END_TAG.", this, null);
      }
    }
    else
    {
      if (i1 != 3) {
        break label67;
      }
      str = "";
    }
    return str;
    label67:
    throw new XmlPullParserException("Parser must be on START_TAG or TEXT to read text.", this, null);
  }
  
  public int nextToken()
    throws XmlPullParserException, IOException
  {
    return next();
  }
  
  public void require(int paramInt, String paramString1, String paramString2)
    throws XmlPullParserException, IOException
  {
    if ((paramInt != getEventType()) || ((paramString1 != null) && (!paramString1.equals(getNamespace()))) || ((paramString2 != null) && (!paramString2.equals(getName())))) {
      throw new XmlPullParserException(TYPES[paramInt] + " is expected.", this, null);
    }
  }
  
  public void setFeature(String paramString, boolean paramBoolean)
    throws XmlPullParserException
  {
    throw new XmlPullParserException("Method is not supported.");
  }
  
  public void setInput(InputStream paramInputStream, String paramString)
    throws XmlPullParserException
  {
    try
    {
      close();
      if (paramInputStream != null)
      {
        paramString = new byte[paramInputStream.available()];
        paramInputStream.read(paramString);
        paramInputStream.close();
        a = ByteBuffer.wrap(paramString);
        a.order(ByteOrder.LITTLE_ENDIAN);
      }
      return;
    }
    catch (IOException paramInputStream)
    {
      new XmlPullParserException("error load stream").initCause(paramInputStream);
    }
  }
  
  public void setInput(Reader paramReader)
    throws XmlPullParserException
  {
    throw new XmlPullParserException("Method is not supported.");
  }
  
  public void setProperty(String paramString, Object paramObject)
    throws XmlPullParserException
  {
    throw new XmlPullParserException("Method is not supported.");
  }
  
  private static final class a
  {
    private int[] a = new int[32];
    private int b;
    private int c;
    private int d;
    
    public a() {}
    
    private final int a(int paramInt, boolean paramBoolean)
    {
      if (b == 0) {}
      for (;;)
      {
        return -1;
        int i = b - 1;
        int j = d;
        while (j != 0)
        {
          int k = a[i];
          i -= 2;
          while (k != 0)
          {
            if (paramBoolean)
            {
              if (a[i] == paramInt) {
                return a[(i + 1)];
              }
            }
            else if (a[(i + 1)] == paramInt) {
              return a[i];
            }
            i -= 2;
            k -= 1;
          }
          j -= 1;
        }
      }
    }
    
    private final int b(int paramInt, boolean paramBoolean)
    {
      if ((b == 0) || (paramInt < 0)) {}
      int j;
      for (;;)
      {
        return -1;
        i = 0;
        int k = d;
        j = paramInt;
        paramInt = k;
        while (paramInt != 0)
        {
          k = a[i];
          if (j < k) {
            break label69;
          }
          j -= k;
          i += k * 2 + 2;
          paramInt -= 1;
        }
      }
      label69:
      int i = j * 2 + 1 + i;
      paramInt = i;
      if (!paramBoolean) {
        paramInt = i + 1;
      }
      return a[paramInt];
    }
    
    private void f(int paramInt)
    {
      int i = a.length - b;
      if (i > paramInt) {
        return;
      }
      int[] arrayOfInt = new int[(i + a.length) * 2];
      System.arraycopy(a, 0, arrayOfInt, 0, b);
      a = arrayOfInt;
    }
    
    public final int a(int paramInt)
    {
      int m = 0;
      int j = 0;
      int i = j;
      if (b != 0)
      {
        if (paramInt < 0) {
          i = j;
        }
      }
      else {
        return i;
      }
      i = paramInt;
      if (paramInt > d) {
        i = d;
      }
      j = 0;
      int k = i;
      paramInt = m;
      for (;;)
      {
        i = paramInt;
        if (k == 0) {
          break;
        }
        i = a[j];
        k -= 1;
        j = i * 2 + 2 + j;
        paramInt += i;
      }
    }
    
    public final void a()
    {
      b = 0;
      c = 0;
      d = 0;
    }
    
    public final void a(int paramInt1, int paramInt2)
    {
      if (d == 0) {
        f();
      }
      f(2);
      int i = b - 1;
      int j = a[i];
      a[(i - 1 - j * 2)] = (j + 1);
      a[i] = paramInt1;
      a[(i + 1)] = paramInt2;
      a[(i + 2)] = (j + 1);
      b += 2;
      c += 1;
    }
    
    public final int b()
    {
      return c;
    }
    
    public final int b(int paramInt)
    {
      return b(paramInt, true);
    }
    
    public final boolean b(int paramInt1, int paramInt2)
    {
      if (b == 0) {}
      int k;
      int m;
      int i;
      int j;
      for (;;)
      {
        return false;
        k = b - 1;
        m = a[k];
        i = k - 2;
        j = 0;
        while (j != m)
        {
          if ((a[i] == paramInt1) && (a[(i + 1)] == paramInt2)) {
            break label76;
          }
          j += 1;
          i -= 2;
        }
      }
      label76:
      paramInt1 = m - 1;
      if (j == 0)
      {
        a[i] = paramInt1;
        a[(i - (paramInt1 * 2 + 1))] = paramInt1;
      }
      for (;;)
      {
        b -= 2;
        c -= 1;
        return true;
        a[k] = paramInt1;
        a[(k - (paramInt1 * 2 + 3))] = paramInt1;
        System.arraycopy(a, i + 2, a, i, b - i);
      }
    }
    
    public final int c()
    {
      if (b == 0) {
        return 0;
      }
      int i = b;
      return a[(i - 1)];
    }
    
    public final int c(int paramInt)
    {
      return b(paramInt, false);
    }
    
    public final int d(int paramInt)
    {
      return a(paramInt, false);
    }
    
    public final boolean d()
    {
      if (b == 0) {}
      int i;
      int j;
      do
      {
        return false;
        i = b - 1;
        j = a[i];
      } while (j == 0);
      j -= 1;
      i -= 2;
      a[i] = j;
      a[(i - (j * 2 + 1))] = j;
      b -= 2;
      c -= 1;
      return true;
    }
    
    public final int e()
    {
      return d;
    }
    
    public final int e(int paramInt)
    {
      return a(paramInt, true);
    }
    
    public final void f()
    {
      f(2);
      int i = b;
      a[i] = 0;
      a[(i + 1)] = 0;
      b += 2;
      d += 1;
    }
    
    public final void g()
    {
      if (b == 0) {}
      int i;
      int j;
      do
      {
        return;
        i = b - 1;
        j = a[i];
      } while (i - 1 - j * 2 == 0);
      b -= j * 2 + 2;
      c -= j;
      d -= 1;
    }
  }
}
