package com.tencent.mobileqq.transfile;

import com.tencent.image.URLDrawableHandler;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.DownCallBack;
import com.tencent.mobileqq.pic.UpCallBack;
import java.io.OutputStream;

public class TransferRequest
{
  public int a;
  public long a;
  public URLDrawableHandler a;
  public MessageRecord a;
  public DownCallBack a;
  public UpCallBack a;
  public TransferResult a;
  public OutputStream a;
  public Object a;
  public String a;
  public boolean a;
  public byte[] a;
  public int b;
  public long b;
  public String b;
  public boolean b;
  public byte[] b;
  public int c;
  public long c;
  public String c;
  public boolean c;
  public int d;
  public long d;
  public String d;
  public boolean d;
  public int e;
  public long e;
  public String e;
  public boolean e;
  public int f;
  public long f;
  public String f;
  public boolean f;
  public int g;
  public String g;
  public boolean g;
  public int h;
  public String h;
  public boolean h;
  public int i;
  public String i;
  public boolean i;
  public int j;
  public String j;
  public boolean j;
  public int k;
  public String k;
  public boolean k;
  public int l;
  public String l;
  public boolean l;
  public int m;
  public String m;
  public boolean m;
  private String n;
  public boolean n;
  
  public TransferRequest()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "";
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = true;
    jdField_d_of_type_Boolean = false;
    jdField_d_of_type_Int = 5;
    jdField_e_of_type_Boolean = true;
    jdField_f_of_type_Int = 1;
    jdField_a_of_type_ComTencentMobileqqDataMessageRecord = null;
    jdField_f_of_type_Boolean = true;
    g = false;
    jdField_i_of_type_Boolean = false;
    k = false;
    l = false;
    n = null;
  }
  
  public String a()
  {
    return jdField_c_of_type_JavaLangString + jdField_a_of_type_Long;
  }
  
  public String b()
  {
    if (n == null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(jdField_c_of_type_JavaLangString);
      localStringBuilder.append("_");
      localStringBuilder.append(jdField_b_of_type_Int);
      localStringBuilder.append("_");
      localStringBuilder.append(jdField_a_of_type_Long);
      localStringBuilder.append("_");
      localStringBuilder.append(jdField_b_of_type_Long);
      return localStringBuilder.toString();
    }
    return n;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("TransferRequest\n");
    localStringBuilder.append("mUniseq=" + jdField_a_of_type_Long);
    localStringBuilder.append(",mMd5=" + jdField_f_of_type_JavaLangString);
    localStringBuilder.append(",mIsIp=" + jdField_a_of_type_Boolean);
    localStringBuilder.append(",mUinType=" + jdField_a_of_type_Int);
    localStringBuilder.append(",mFileType=" + jdField_b_of_type_Int);
    localStringBuilder.append(",mSelfUin=" + jdField_b_of_type_JavaLangString);
    localStringBuilder.append(",mPeerUin=" + jdField_c_of_type_JavaLangString);
    localStringBuilder.append(",mSecondId=" + jdField_d_of_type_JavaLangString);
    localStringBuilder.append(",mServerPath=" + jdField_e_of_type_JavaLangString);
    localStringBuilder.append(",mLocalPath=" + jdField_i_of_type_JavaLangString);
    localStringBuilder.append(",mBusiType=" + jdField_e_of_type_Int);
    localStringBuilder.append(",mGroupFileID=" + jdField_c_of_type_Long);
    localStringBuilder.append(",mExtraObj={" + jdField_a_of_type_JavaLangObject + "}");
    localStringBuilder.append(",mPrioty=" + jdField_f_of_type_Int);
    localStringBuilder.append(",mLogicCallBack=" + jdField_a_of_type_ComTencentMobileqqPicUpCallBack);
    localStringBuilder.append(",bEnableEnc=" + l);
    return localStringBuilder.toString();
  }
}
