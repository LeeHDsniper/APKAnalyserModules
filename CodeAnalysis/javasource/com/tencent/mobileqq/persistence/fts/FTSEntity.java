package com.tencent.mobileqq.persistence.fts;

import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;

public abstract class FTSEntity
{
  public static final int EXT1_INDEX = 1;
  public static final int EXT2_INDEX = 2;
  public static final int EXT3_INDEX = 3;
  public static final int EXT_NON_INDEX = 0;
  public static final int FTS_OPT_DELETE = 16;
  public static final int FTS_OPT_INSERT = 1;
  public static final int FTS_OPT_NON = 0;
  public static final int FTS_OPT_UPDATE = 17;
  public static final int FTS_TYPE_MSG = 1;
  public static final int FTS_TYPE_NULL = 0;
  public static final int FTS_TYPE_TROOP = 2;
  public static final int MAX_LIMIT = 2000;
  public static final int MAX_PROXIMITY = 65535;
  public static final int MIN_PROXIMITY = 0;
  public String mContent;
  protected String mContentIndex;
  public String mExt1;
  public String mExt2;
  public String mExt3;
  public String mExt4;
  public String mExt5;
  public String mExt6;
  public String mExt7;
  public String mExt8;
  public String mExt9;
  public byte[] mExts;
  public long mOId;
  public int mOpt;
  public int mProximity;
  public int mProximityEnd;
  public int mProximityStart;
  public int mSearchScene;
  public int mType;
  
  public FTSEntity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    mOpt = 0;
    mType = -1;
    mContent = null;
    mContentIndex = null;
    mOId = -1L;
    mExt1 = null;
    mExt2 = null;
    mExt3 = null;
    mExt4 = null;
    mExt5 = null;
    mExt6 = null;
    mExt7 = null;
    mExt8 = null;
    mExt9 = null;
    mExts = null;
    mProximity = 65535;
    mProximityStart = -1;
    mProximityEnd = -1;
  }
  
  public FTSEntity(int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString1, long paramLong, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, byte[] paramArrayOfByte)
  {
    mOpt = 0;
    mType = -1;
    mContent = null;
    mContentIndex = null;
    mOId = -1L;
    mExt1 = null;
    mExt2 = null;
    mExt3 = null;
    mExt4 = null;
    mExt5 = null;
    mExt6 = null;
    mExt7 = null;
    mExt8 = null;
    mExt9 = null;
    mExts = null;
    mProximity = 65535;
    mProximityStart = -1;
    mProximityEnd = -1;
    mType = paramInt1;
    mContent = paramString1;
    mOId = paramLong;
    mExt1 = paramString2;
    mExt2 = paramString3;
    mExt3 = paramString4;
    mExt4 = paramString5;
    mExt5 = paramString6;
    mExt6 = paramString7;
    mExt7 = paramString8;
    mExt8 = paramString9;
    mExt9 = paramString10;
    mExts = paramArrayOfByte;
    mProximity = paramInt2;
    mProximityStart = paramInt3;
    mProximityEnd = paramInt4;
  }
  
  public FTSEntity(int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString1, long paramLong, String paramString2, String paramString3, String paramString4, byte[] paramArrayOfByte)
  {
    mOpt = 0;
    mType = -1;
    mContent = null;
    mContentIndex = null;
    mOId = -1L;
    mExt1 = null;
    mExt2 = null;
    mExt3 = null;
    mExt4 = null;
    mExt5 = null;
    mExt6 = null;
    mExt7 = null;
    mExt8 = null;
    mExt9 = null;
    mExts = null;
    mProximity = 65535;
    mProximityStart = -1;
    mProximityEnd = -1;
    mType = paramInt1;
    mContent = paramString1;
    mOId = paramLong;
    mExt1 = paramString2;
    mExt2 = paramString3;
    mExt3 = paramString4;
    mExts = paramArrayOfByte;
    mProximity = paramInt2;
    mProximityStart = paramInt3;
    mProximityEnd = paramInt4;
  }
  
  public FTSEntity(int paramInt, String paramString1, long paramLong, String paramString2, String paramString3, String paramString4, byte[] paramArrayOfByte)
  {
    mOpt = 0;
    mType = -1;
    mContent = null;
    mContentIndex = null;
    mOId = -1L;
    mExt1 = null;
    mExt2 = null;
    mExt3 = null;
    mExt4 = null;
    mExt5 = null;
    mExt6 = null;
    mExt7 = null;
    mExt8 = null;
    mExt9 = null;
    mExts = null;
    mProximity = 65535;
    mProximityStart = -1;
    mProximityEnd = -1;
    mType = paramInt;
    mContent = paramString1;
    mOId = paramLong;
    mExt1 = paramString2;
    mExt2 = paramString3;
    mExt3 = paramString4;
    mExts = paramArrayOfByte;
  }
  
  public abstract String createDeleteSQL();
  
  public abstract String createInsertSQL();
  
  public abstract String createUpdateSQL();
  
  public void deleteOpt()
  {
    mOpt = 16;
  }
  
  protected abstract void doDeserialize();
  
  protected abstract void doSerialize();
  
  public abstract String getTableName();
  
  public void insertOpt()
  {
    mOpt = 1;
  }
  
  public void postRead()
  {
    doDeserialize();
  }
  
  public void postWrite() {}
  
  public void preRead() {}
  
  public void preWrite()
  {
    if ((mContent == null) || (TextUtils.isEmpty(mContent))) {}
    for (mContentIndex = null;; mContentIndex = SQLiteFTSUtils.a(mContent))
    {
      doSerialize();
      return;
    }
  }
  
  public void preWriteOne()
  {
    if ((mContent == null) || (TextUtils.isEmpty(mContent)))
    {
      mContentIndex = null;
      return;
    }
    mContentIndex = SQLiteFTSUtils.a(mContent);
  }
  
  public void preWriteTwo()
  {
    doSerialize();
  }
  
  public abstract int type();
  
  public void upgradeOpt()
  {
    mOpt = 17;
  }
}
