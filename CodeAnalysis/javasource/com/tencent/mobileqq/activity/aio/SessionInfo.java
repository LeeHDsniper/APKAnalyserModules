package com.tencent.mobileqq.activity.aio;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import krh;

public class SessionInfo
  implements Parcelable, Cloneable
{
  public static final Parcelable.Creator CREATOR = new krh();
  public int a;
  public long a;
  public ChatBackground a;
  public String a;
  public int b;
  public String b;
  public int c = 0;
  public String c;
  public int d;
  public String d;
  public String e;
  public String f;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SessionInfo()
  {
    jdField_a_of_type_Long = -1L;
    jdField_d_of_type_Int = 10004;
  }
  
  public SessionInfo(Parcel paramParcel)
  {
    jdField_a_of_type_Long = -1L;
    jdField_d_of_type_Int = 10004;
    jdField_a_of_type_Int = paramParcel.readInt();
    jdField_a_of_type_JavaLangString = paramParcel.readString();
    b = paramParcel.readString();
    jdField_d_of_type_JavaLangString = paramParcel.readString();
    e = paramParcel.readString();
    jdField_d_of_type_Int = paramParcel.readInt();
  }
  
  public Object clone()
  {
    return super.clone();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(jdField_a_of_type_Int);
    paramParcel.writeString(jdField_a_of_type_JavaLangString);
    paramParcel.writeString(b);
    paramParcel.writeString(jdField_d_of_type_JavaLangString);
    paramParcel.writeString(e);
    paramParcel.writeInt(jdField_d_of_type_Int);
  }
}
