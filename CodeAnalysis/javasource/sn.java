import com.google.zxing.common.reedsolomon.GenericGF;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class sn
{
  private final GenericGF jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF;
  private final int[] jdField_a_of_type_ArrayOfInt;
  
  public sn(GenericGF paramGenericGF, int[] paramArrayOfInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (paramArrayOfInt.length == 0) {
      throw new IllegalArgumentException();
    }
    jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF = paramGenericGF;
    int j = paramArrayOfInt.length;
    if ((j > 1) && (paramArrayOfInt[0] == 0))
    {
      while ((i < j) && (paramArrayOfInt[i] == 0)) {
        i += 1;
      }
      if (i == j)
      {
        jdField_a_of_type_ArrayOfInt = ajdField_a_of_type_ArrayOfInt;
        return;
      }
      jdField_a_of_type_ArrayOfInt = new int[j - i];
      System.arraycopy(paramArrayOfInt, i, jdField_a_of_type_ArrayOfInt, 0, jdField_a_of_type_ArrayOfInt.length);
      return;
    }
    jdField_a_of_type_ArrayOfInt = paramArrayOfInt;
  }
  
  int a()
  {
    return jdField_a_of_type_ArrayOfInt.length - 1;
  }
  
  int a(int paramInt)
  {
    return jdField_a_of_type_ArrayOfInt[(jdField_a_of_type_ArrayOfInt.length - 1 - paramInt)];
  }
  
  public sn a(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {
      throw new IllegalArgumentException();
    }
    if (paramInt2 == 0) {
      return jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.a();
    }
    int i = jdField_a_of_type_ArrayOfInt.length;
    int[] arrayOfInt = new int[i + paramInt1];
    paramInt1 = 0;
    while (paramInt1 < i)
    {
      arrayOfInt[paramInt1] = jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.b(jdField_a_of_type_ArrayOfInt[paramInt1], paramInt2);
      paramInt1 += 1;
    }
    return new sn(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF, arrayOfInt);
  }
  
  sn a(sn paramSn)
  {
    if (!jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.equals(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF)) {
      throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
    }
    if (a()) {
      return paramSn;
    }
    if (paramSn.a()) {
      return this;
    }
    Object localObject = jdField_a_of_type_ArrayOfInt;
    int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
    if (localObject.length > arrayOfInt.length) {
      paramSn = arrayOfInt;
    }
    for (;;)
    {
      arrayOfInt = new int[localObject.length];
      int j = localObject.length - paramSn.length;
      System.arraycopy(localObject, 0, arrayOfInt, 0, j);
      int i = j;
      while (i < localObject.length)
      {
        arrayOfInt[i] = GenericGF.a(paramSn[(i - j)], localObject[i]);
        i += 1;
      }
      return new sn(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF, arrayOfInt);
      paramSn = (sn)localObject;
      localObject = arrayOfInt;
    }
  }
  
  boolean a()
  {
    boolean bool = false;
    if (jdField_a_of_type_ArrayOfInt[0] == 0) {
      bool = true;
    }
    return bool;
  }
  
  public int[] a()
  {
    return jdField_a_of_type_ArrayOfInt;
  }
  
  public sn[] a(sn paramSn)
  {
    if (!jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.equals(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF)) {
      throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
    }
    if (paramSn.a()) {
      throw new IllegalArgumentException("Divide by 0");
    }
    sn localSn2 = jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.a();
    int i = paramSn.a(paramSn.a());
    i = jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.c(i);
    sn localSn3;
    for (sn localSn1 = this; (localSn1.a() >= paramSn.a()) && (!localSn1.a()); localSn1 = localSn1.a(localSn3))
    {
      int j = localSn1.a() - paramSn.a();
      int k = jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.b(localSn1.a(localSn1.a()), i);
      localSn3 = paramSn.a(j, k);
      localSn2 = localSn2.a(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.a(j, k));
    }
    return new sn[] { localSn2, localSn1 };
  }
  
  public sn b(sn paramSn)
  {
    if (!jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.equals(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF)) {
      throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
    }
    if ((a()) || (paramSn.a())) {
      return jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.a();
    }
    int[] arrayOfInt1 = jdField_a_of_type_ArrayOfInt;
    int k = arrayOfInt1.length;
    paramSn = jdField_a_of_type_ArrayOfInt;
    int m = paramSn.length;
    int[] arrayOfInt2 = new int[k + m - 1];
    int i = 0;
    while (i < k)
    {
      int n = arrayOfInt1[i];
      int j = 0;
      while (j < m)
      {
        arrayOfInt2[(i + j)] = GenericGF.a(arrayOfInt2[(i + j)], jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.b(n, paramSn[j]));
        j += 1;
      }
      i += 1;
    }
    return new sn(jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF, arrayOfInt2);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(a() * 8);
    int i = a();
    if (i >= 0)
    {
      int k = a(i);
      int j;
      if (k != 0)
      {
        if (k >= 0) {
          break label104;
        }
        localStringBuilder.append(" - ");
        j = -k;
        label50:
        if ((i == 0) || (j != 1))
        {
          j = jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF.b(j);
          if (j != 0) {
            break label127;
          }
          localStringBuilder.append('1');
        }
        label80:
        if (i != 0)
        {
          if (i != 1) {
            break label161;
          }
          localStringBuilder.append('x');
        }
      }
      for (;;)
      {
        i -= 1;
        break;
        label104:
        j = k;
        if (localStringBuilder.length() <= 0) {
          break label50;
        }
        localStringBuilder.append(" + ");
        j = k;
        break label50;
        label127:
        if (j == 1)
        {
          localStringBuilder.append('a');
          break label80;
        }
        localStringBuilder.append("a^");
        localStringBuilder.append(j);
        break label80;
        label161:
        localStringBuilder.append("x^");
        localStringBuilder.append(i);
      }
    }
    return localStringBuilder.toString();
  }
}
