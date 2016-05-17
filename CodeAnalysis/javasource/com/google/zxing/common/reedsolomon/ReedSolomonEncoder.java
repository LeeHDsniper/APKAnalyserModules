package com.google.zxing.common.reedsolomon;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;
import sn;

public final class ReedSolomonEncoder
{
  private final GenericGF jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF;
  private final List jdField_a_of_type_JavaUtilList;
  
  public ReedSolomonEncoder(GenericGF paramGenericGF)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (!GenericGF.jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.equals(paramGenericGF)) {
      throw new IllegalArgumentException("Only QR Code is supported at this time");
    }
    jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF = paramGenericGF;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilList.add(new sn(paramGenericGF, new int[] { 1 }));
  }
  
  private sn a(int paramInt)
  {
    if (paramInt >= jdField_a_of_type_JavaUtilList.size())
    {
      sn localSn = (sn)jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_JavaUtilList.size() - 1);
      int i = jdField_a_of_type_JavaUtilList.size();
      while (i <= paramInt)
      {
        localSn = localSn.b(new sn(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF, new int[] { 1, jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.a(i - 1) }));
        jdField_a_of_type_JavaUtilList.add(localSn);
        i += 1;
      }
    }
    return (sn)jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public void a(int[] paramArrayOfInt, int paramInt)
  {
    if (paramInt == 0) {
      throw new IllegalArgumentException("No error correction bytes");
    }
    int i = paramArrayOfInt.length - paramInt;
    if (i <= 0) {
      throw new IllegalArgumentException("No data bytes provided");
    }
    Object localObject = a(paramInt);
    int[] arrayOfInt = new int[i];
    System.arraycopy(paramArrayOfInt, 0, arrayOfInt, 0, i);
    localObject = new sn(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF, arrayOfInt).a(paramInt, 1).a(localObject)[1].a();
    int j = paramInt - localObject.length;
    paramInt = 0;
    while (paramInt < j)
    {
      paramArrayOfInt[(i + paramInt)] = 0;
      paramInt += 1;
    }
    System.arraycopy(localObject, 0, paramArrayOfInt, i + j, localObject.length);
  }
}
