package com.tencent.mobileqq.app.fms;

import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;
import java.util.List;

public class FullMessageSearchResult
{
  public int a;
  public List a;
  
  public FullMessageSearchResult()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("FullMessageSearchResult:");
    if (jdField_a_of_type_JavaUtilList == null)
    {
      localStringBuilder.append("null");
      return localStringBuilder.toString();
    }
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    if (localIterator.hasNext())
    {
      FullMessageSearchResult.SearchResultItem localSearchResultItem = (FullMessageSearchResult.SearchResultItem)localIterator.next();
      localStringBuilder.append("(");
      localStringBuilder.append(user.uin);
      localStringBuilder.append(",");
      if (secondPageList == null)
      {
        i = 0;
        label96:
        localStringBuilder.append(i);
        localStringBuilder.append(",");
        if (secondPageMessageUniseq != null) {
          break label149;
        }
      }
      label149:
      for (int i = 0;; i = secondPageMessageUniseq.size())
      {
        localStringBuilder.append(i);
        localStringBuilder.append(")");
        break;
        i = secondPageList.size();
        break label96;
      }
    }
    localStringBuilder.append(" searchFinFlag=" + jdField_a_of_type_Int);
    return localStringBuilder.toString();
  }
}
