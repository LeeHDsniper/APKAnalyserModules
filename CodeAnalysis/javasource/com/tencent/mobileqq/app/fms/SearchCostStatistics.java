package com.tencent.mobileqq.app.fms;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SearchCostStatistics
{
  public static final String a = "SearchMessageStatistic_FTS";
  public static final String b = "SearchMessageStatistic";
  public static final String c = "RecentSearchStatistic";
  public int a;
  public long a;
  public int b;
  public int c;
  public int d;
  
  public SearchCostStatistics()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    b = 0;
    c = 0;
    d = 0;
    jdField_a_of_type_Long = 0L;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("M_size=");
    localStringBuilder.append(jdField_a_of_type_Int);
    localStringBuilder.append(",C_size=");
    localStringBuilder.append(b);
    localStringBuilder.append(",R_size=");
    localStringBuilder.append(c);
    localStringBuilder.append(",K_len=");
    localStringBuilder.append(d);
    localStringBuilder.append(",time=");
    localStringBuilder.append(jdField_a_of_type_Long);
    return localStringBuilder.toString();
  }
}
