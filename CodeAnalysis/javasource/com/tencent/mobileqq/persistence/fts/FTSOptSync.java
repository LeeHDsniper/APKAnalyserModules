package com.tencent.mobileqq.persistence.fts;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;

public abstract class FTSOptSync
  extends Entity
{
  public String mContent;
  public long mOId;
  public int mOpt;
  public int mType;
  
  public FTSOptSync()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
