package com.tencent.mobileqq.content;

import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.net.Uri;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import mqq.app.AppContentProvider;
import mqq.app.AppRuntime;

public class FriendListProvider
  extends AppContentProvider
  implements FriendList
{
  public static final int a = 1000;
  public static final int b = 1001;
  public static final int c = 1002;
  public static final int d = 1003;
  public static final int e = 1004;
  public static final int f = 1005;
  public static final int g = 1006;
  public static final String p = "FriendListProvider";
  private final UriMatcher a;
  
  public FriendListProvider()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new UriMatcher(-1);
  }
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }
  
  public String getType(Uri paramUri)
  {
    return null;
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    return null;
  }
  
  public boolean onCreate()
  {
    super.onCreate();
    a.addURI("qq.friendlist", "group/#", 1000);
    a.addURI("qq.friendlist", "friendlist/#", 1001);
    a.addURI("qq.friendlist", "trooplist/#", 1002);
    a.addURI("qq.friendlist", "troopmemberinfo/#/#/#", 1003);
    a.addURI("qq.friendlist", "troopname/#/#", 1004);
    a.addURI("qq.friendlist", "discussinfo/#/#", 1005);
    a.addURI("qq.friendlist", "discussmenberinfo/#/#/#", 1006);
    return true;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    int i = a.match(paramUri);
    Object localObject = (String)paramUri.getPathSegments().get(1);
    AppRuntime localAppRuntime = getRuntime((String)localObject);
    localObject = new ProviderAppRuntimeProxy().a(localAppRuntime, (String)localObject);
    if (localObject == null)
    {
      paramString1 = null;
      return paramString1;
    }
    switch (i)
    {
    default: 
      if (QLog.isColorLevel()) {
        QLog.e("FriendListProvider", 2, "Uri match missing! match: " + paramUri);
      }
      label135:
      paramArrayOfString1 = null;
    }
    for (;;)
    {
      paramString1 = paramArrayOfString1;
      if (paramArrayOfString1 == null) {
        break;
      }
      paramArrayOfString1.setNotificationUri(getContext().getContentResolver(), paramUri);
      return paramArrayOfString1;
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new Groups().getTableName(), new String[] { "group_name", "group_online_friend_count", "group_friend_count", "group_id", "seqid" }, paramString1, paramArrayOfString2, paramString2, null);
      continue;
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new Friends().getTableName(), paramArrayOfString1, paramString1, paramArrayOfString2, paramString2, null);
      continue;
      if (QLog.isColorLevel()) {
        QLog.d("query", 2, getClass().getName() + " MATCH_TROOP_LIST");
      }
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a("select _id,troopuin,troopname,troopmemo from TroopInfo", null);
      continue;
      paramArrayOfString1 = paramUri.getPathSegments();
      if (paramArrayOfString1.size() < 4) {
        break label135;
      }
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new TroopMemberInfo().getTableName(), null, "troopuin=? AND memberuin=?", new String[] { (String)paramArrayOfString1.get(2), (String)paramArrayOfString1.get(3) }, null, null);
      continue;
      paramString1 = paramUri.getPathSegments();
      if (paramString1.size() < 2) {
        break label135;
      }
      paramArrayOfString1 = new TroopInfo().getTableName();
      paramString1 = (String)paramString1.get(2);
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a(paramArrayOfString1, new String[] { "troopname" }, "troopuin=?", new String[] { paramString1 }, paramString2, null);
      continue;
      paramArrayOfString1 = paramUri.getPathSegments();
      if (paramArrayOfString1.size() < 3) {
        break label135;
      }
      paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new DiscussionInfo().getTableName(), null, "uin=?", new String[] { (String)paramArrayOfString1.get(2) }, null, null);
      continue;
      paramArrayOfString1 = paramUri.getPathSegments();
      if (paramArrayOfString1.size() < 4) {
        break label135;
      }
      if ("0".equals(paramArrayOfString1.get(3))) {
        paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new DiscussionMemberInfo().getTableName(), null, "discussionUin=?", new String[] { (String)paramArrayOfString1.get(2) }, null, null);
      } else {
        paramArrayOfString1 = ((SQLiteDatabase)localObject).a(new DiscussionMemberInfo().getTableName(), null, "discussionUin=? AND memberUin=?", new String[] { (String)paramArrayOfString1.get(2), (String)paramArrayOfString1.get(3) }, null, null);
      }
    }
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }
}
