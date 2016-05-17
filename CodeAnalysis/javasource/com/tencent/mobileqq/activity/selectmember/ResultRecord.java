package com.tencent.mobileqq.activity.selectmember;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mmi;

public class ResultRecord
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new mmi();
  public int a;
  public String a;
  public String b;
  public String c;
  public String d;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ResultRecord() {}
  
  private ResultRecord(Parcel paramParcel)
  {
    jdField_a_of_type_JavaLangString = paramParcel.readString();
    b = paramParcel.readString();
    jdField_a_of_type_Int = paramParcel.readInt();
    c = paramParcel.readString();
    d = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof ResultRecord))
    {
      paramObject = (ResultRecord)paramObject;
      if ((jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_Int == jdField_a_of_type_Int) && (((!TextUtils.isEmpty(d)) && (!TextUtils.isEmpty(d)) && (d.equals(d))) || ((TextUtils.isEmpty(d)) && (TextUtils.isEmpty(d))))) {
        return true;
      }
    }
    return false;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[uin:").append(jdField_a_of_type_JavaLangString);
    localStringBuilder.append(", name:").append(b);
    localStringBuilder.append(", type:").append(jdField_a_of_type_Int);
    localStringBuilder.append(", groupUin:").append(c);
    localStringBuilder.append(", phone:").append(d).append("]");
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(jdField_a_of_type_JavaLangString);
    paramParcel.writeString(b);
    paramParcel.writeInt(jdField_a_of_type_Int);
    paramParcel.writeString(c);
    paramParcel.writeString(d);
  }
}
