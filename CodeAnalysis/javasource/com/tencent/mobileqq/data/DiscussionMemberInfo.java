package com.tencent.mobileqq.data;

import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.ConflictClause;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.uniqueConstraints;

@uniqueConstraints(clause=ConflictClause.IGNORE, columnNames="discussionUin,memberUin")
public class DiscussionMemberInfo
  extends Entity
{
  public long dataTime;
  public String discussionUin;
  @notColumn
  public String displayedNamePinyinFirst;
  public byte flag;
  public String inteRemark;
  public long inteRemarkSource;
  public String memberName;
  public String memberUin;
  
  public DiscussionMemberInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public String getDiscussionMemberName()
  {
    if (!TextUtils.isEmpty(inteRemark)) {}
    for (String str1 = inteRemark;; str1 = memberName)
    {
      String str2 = str1;
      if (TextUtils.isEmpty(str1)) {
        str2 = memberUin;
      }
      return str2;
    }
  }
}
