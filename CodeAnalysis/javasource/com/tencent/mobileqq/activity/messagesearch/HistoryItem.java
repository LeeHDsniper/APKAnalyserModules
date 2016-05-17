package com.tencent.mobileqq.activity.messagesearch;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class HistoryItem
{
  public String a;
  
  public HistoryItem(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramString;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("keyword = ").append(a);
    return localStringBuilder.toString();
  }
}
