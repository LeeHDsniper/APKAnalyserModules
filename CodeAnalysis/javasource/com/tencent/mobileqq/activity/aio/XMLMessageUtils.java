package com.tencent.mobileqq.activity.aio;

import android.support.v4.util.LruCache;
import com.tencent.biz.pubaccount.util.PAMessageUtil;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class XMLMessageUtils
{
  public static LruCache a = new LruCache(50);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public XMLMessageUtils() {}
  
  public static PAMessage a(MessageRecord paramMessageRecord)
  {
    return a(frienduin, shmsgseq, msgUid, msgData);
  }
  
  public static PAMessage a(String paramString, long paramLong1, long paramLong2, byte[] paramArrayOfByte)
  {
    String str = a(paramString, paramLong1, paramLong2);
    PAMessage localPAMessage = (PAMessage)a.get(str);
    paramString = localPAMessage;
    if (localPAMessage == null)
    {
      paramArrayOfByte = PAMessageUtil.a(paramArrayOfByte);
      paramString = paramArrayOfByte;
      if (paramArrayOfByte != null)
      {
        a.put(str, paramArrayOfByte);
        paramString = paramArrayOfByte;
      }
    }
    return paramString;
  }
  
  private static String a(String paramString, long paramLong1, long paramLong2)
  {
    return paramString + "&" + paramLong1 + "&" + paramLong2;
  }
}
