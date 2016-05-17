package com.tencent.mobileqq.util;

import android.util.Pair;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Arrays;
import skp;

public class SortUtils
{
  public SortUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static ArrayList a(ArrayList paramArrayList)
  {
    Object[] arrayOfObject = new Object[paramArrayList.size()];
    int i = 0;
    Object localObject;
    while (i < paramArrayList.size())
    {
      localObject = (Pair)paramArrayList.get(i);
      arrayOfObject[i] = { (String)first, String.valueOf(second) };
      i += 1;
    }
    Arrays.sort(arrayOfObject, new skp());
    paramArrayList.clear();
    i = 0;
    while (i < arrayOfObject.length)
    {
      localObject = (String[])arrayOfObject[i];
      paramArrayList.add(Pair.create(localObject[0], Long.valueOf(Long.parseLong(localObject[1]))));
      i += 1;
    }
    return paramArrayList;
  }
}
