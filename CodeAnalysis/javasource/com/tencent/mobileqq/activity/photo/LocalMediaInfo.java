package com.tencent.mobileqq.activity.photo;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.net.URL;

public class LocalMediaInfo
  implements Comparable
{
  public static final int c = 1;
  public static final int d = 2;
  public static final int e = 3;
  public int a;
  public long a;
  public Integer a;
  public String a;
  public boolean a;
  public int b;
  public long b;
  public String b;
  public boolean b;
  public long c;
  public long d;
  public long e;
  public int f;
  public int g;
  public int h;
  public int i;
  public int j;
  
  public LocalMediaInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangInteger = Integer.valueOf(-1);
    b = true;
  }
  
  public static LocalMediaInfo a(URL paramURL)
  {
    try
    {
      paramURL = paramURL.getFile().split("\\|");
      LocalMediaInfo localLocalMediaInfo = new LocalMediaInfo();
      jdField_a_of_type_JavaLangString = paramURL[0];
      f = Integer.parseInt(paramURL[1]);
      g = Integer.parseInt(paramURL[2]);
      d = Long.parseLong(paramURL[3]);
      if (paramURL.length > 6) {
        h = Integer.parseInt(paramURL[6]);
      }
      return localLocalMediaInfo;
    }
    catch (Exception paramURL) {}
    return null;
  }
  
  public static String a(LocalMediaInfo paramLocalMediaInfo)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(jdField_a_of_type_JavaLangString);
    localStringBuilder.append("|");
    localStringBuilder.append(f);
    localStringBuilder.append("|");
    localStringBuilder.append(g);
    localStringBuilder.append("|");
    localStringBuilder.append(d);
    localStringBuilder.append("|");
    localStringBuilder.append(0);
    localStringBuilder.append("|");
    localStringBuilder.append("201403010");
    return localStringBuilder.toString();
  }
  
  public int a(LocalMediaInfo paramLocalMediaInfo)
  {
    if (paramLocalMediaInfo == null) {}
    do
    {
      return -1;
      if (d > d) {
        return 1;
      }
    } while (d != d);
    return 0;
  }
}
