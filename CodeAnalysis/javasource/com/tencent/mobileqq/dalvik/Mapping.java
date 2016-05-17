package com.tencent.mobileqq.dalvik;

public class Mapping
{
  private final long jdField_a_of_type_Long;
  private final String jdField_a_of_type_JavaLangString;
  private final boolean jdField_a_of_type_Boolean;
  private final long jdField_b_of_type_Long;
  private final boolean jdField_b_of_type_Boolean;
  private final boolean c;
  
  public Mapping(long paramLong1, long paramLong2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString)
  {
    jdField_a_of_type_Long = paramLong1;
    jdField_b_of_type_Long = paramLong2;
    jdField_a_of_type_Boolean = paramBoolean1;
    jdField_b_of_type_Boolean = paramBoolean2;
    c = paramBoolean3;
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public final long a()
  {
    return jdField_a_of_type_Long;
  }
  
  public final String a()
  {
    return jdField_a_of_type_JavaLangString;
  }
  
  public final boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public final long b()
  {
    return jdField_b_of_type_Long;
  }
}
