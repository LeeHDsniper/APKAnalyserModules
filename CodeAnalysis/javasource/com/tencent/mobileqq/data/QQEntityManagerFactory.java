package com.tencent.mobileqq.data;

import android.database.Cursor;
import com.dataline.mpfile.MpfileTaskRecord;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarData;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.SQLiteOpenHelper;
import com.tencent.mobileqq.dating.GodEntity;
import com.tencent.mobileqq.dating.GodListConfig;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.freshnews.FreshNewsInfo;
import com.tencent.mobileqq.freshnews.FreshNewsNotify;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.newfriend.RecommendMessage;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.OGEntityManager;
import com.tencent.mobileqq.persistence.TableBuilder;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.utils.SecurityUtile;
import com.tencent.util.VersionUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import nvp;

public class QQEntityManagerFactory
  extends EntityManagerFactory
{
  private static final int DB_VERSION = 125;
  private static final int FLAG_CHECK_AUTHENTICATION = -1;
  protected static boolean isUpdateFromLowV74 = false;
  public String TAG = "QQEntityManagerFactory";
  protected boolean bUpdated = false;
  protected SQLiteOpenHelper dbHelper;
  protected QQEntityManagerFactory.SQLiteOpenHelperImpl mInnerDbHelper;
  public String name;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public QQEntityManagerFactory(String paramString)
  {
    super(paramString);
    name = paramString;
  }
  
  public static void checkColumnChange(String paramString, android.database.sqlite.SQLiteDatabase paramSQLiteDatabase)
  {
    System.currentTimeMillis();
    Cursor localCursor1 = paramSQLiteDatabase.rawQuery("select distinct tbl_name from Sqlite_master", null);
    ArrayList localArrayList = new ArrayList();
    if (localCursor1 != null)
    {
      while (localCursor1.moveToNext())
      {
        String str = SecurityUtile.a(localCursor1.getString(0));
        Cursor localCursor2 = paramSQLiteDatabase.rawQuery("select sql from sqlite_master where type=? and name=?", new String[] { "table", str });
        if (localCursor2 != null) {
          for (;;)
          {
            try
            {
              if (!str.equals("mr_fileManager")) {
                continue;
              }
              localObject = FileManagerEntity.class;
              OGEntityManager.a(localArrayList, str, localCursor2, (Class)localObject);
            }
            catch (ClassNotFoundException localClassNotFoundException)
            {
              Object localObject;
              continue;
            }
            localCursor2.close();
            break;
            if (str.equals(DataLineMsgRecord.tableName())) {
              localObject = DataLineMsgRecord.class;
            } else if (str.equals(MpfileTaskRecord.tableName())) {
              localObject = MpfileTaskRecord.class;
            } else if (str.equals(PrinterItemMsgRecord.tableName())) {
              localObject = PrinterItemMsgRecord.class;
            } else if (str.startsWith(RouterMsgRecord.tableBasicName())) {
              localObject = RouterMsgRecord.class;
            } else if (str.startsWith("mr_")) {
              localObject = MessageRecord.class;
            } else if (str.equals("recent")) {
              localObject = RecentUser.class;
            } else if (str.startsWith(SecMsg.getTabPrefix())) {
              localObject = SecMsg.class;
            } else if (str.equals("recent_call")) {
              localObject = QCallRecent.class;
            } else if (str.equals(ConversationInfo.getConversationInfoTableName())) {
              localObject = ConversationInfo.class;
            } else if (str.equals(TroopBarData.class.getSimpleName())) {
              localObject = TroopBarData.class;
            } else {
              localObject = Class.forName(paramString + "." + str);
            }
          }
        }
      }
      localCursor1.close();
    }
    com.tencent.mobileqq.app.SQLiteDatabase.g();
    paramSQLiteDatabase.beginTransaction();
    try
    {
      paramString = localArrayList.iterator();
      while (paramString.hasNext()) {
        paramSQLiteDatabase.execSQL((String)paramString.next());
      }
      paramSQLiteDatabase.setTransactionSuccessful();
    }
    finally
    {
      paramSQLiteDatabase.endTransaction();
      com.tencent.mobileqq.app.SQLiteDatabase.h();
    }
    paramSQLiteDatabase.endTransaction();
    com.tencent.mobileqq.app.SQLiteDatabase.h();
  }
  
  public SQLiteOpenHelper build(String paramString)
  {
    if (dbHelper == null) {
      if (!VersionUtils.e()) {
        break label75;
      }
    }
    label75:
    for (mInnerDbHelper = new QQEntityManagerFactory.SQLiteOpenHelperImpl(this, paramString + ".db", null, 125, new nvp(this));; mInnerDbHelper = new QQEntityManagerFactory.SQLiteOpenHelperImpl(this, paramString + ".db", null, 125))
    {
      dbHelper = new SQLiteOpenHelper(mInnerDbHelper);
      return dbHelper;
    }
  }
  
  protected void createDatabase(android.database.sqlite.SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Groups()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Friends()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new RecentUser()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Ability()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new TroopInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Card()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new DiscussionInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new PhoneContact()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new DataLineMsgRecord()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new DataLineMsgRecord(1)));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new EmoticonPackage()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Emoticon()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new EmoticonTab()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new RoamSetting()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new TroopMemberInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new TroopRemindSettingData()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new ShieldListInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new ContactCard()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new QZoneCover()));
    MessageRecord localMessageRecord = MessageRecordFactory.a(64536);
    frienduin = String.valueOf(AppConstants.aq);
    istroop = 1001;
    paramSQLiteDatabase.execSQL(TableBuilder.a(localMessageRecord));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new SearchHistory()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new Stranger()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new CircleBuddy()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new ExtensionInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new CommonlyUsedTroop()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new ExpiredPushBanner()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new HotChatInfo()));
    paramSQLiteDatabase.execSQL(TableBuilder.a(new SpecialCareInfo()));
  }
  
  protected String getPackageName()
  {
    return "com.tencent.mobileqq.data";
  }
  
  public boolean isUpdateFromLowV74()
  {
    return isUpdateFromLowV74;
  }
  
  public boolean isUpdated()
  {
    return bUpdated;
  }
  
  public void resetUpdateFromLowV74()
  {
    isUpdateFromLowV74 = false;
  }
  
  protected void upgradeDatabase(android.database.sqlite.SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (paramInt1 < 20)
    {
      mInnerDbHelper.dropAllTable();
      return;
    }
    if (paramInt1 < 112) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new DataLineMsgRecord(1)));
    }
    if (paramInt1 < 70) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new ExtensionInfo()));
    }
    if (paramInt1 < 34)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(DiscussionInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new DiscussionInfo()));
    }
    if (paramInt1 < 115) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(TroopAppInfo.class.getSimpleName()));
    }
    if (paramInt1 < 29) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new Ability()));
    }
    if (paramInt1 < 35) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new PhoneContact()));
    }
    if (paramInt1 < 36)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a("TroopSelfInfo"));
      paramSQLiteDatabase.execSQL(TableBuilder.a(TroopInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new TroopInfo()));
      bUpdated = true;
    }
    if (paramInt1 < 41)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(Card.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new Card()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(ResourcePluginInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new ResourcePluginInfo()));
    }
    if (paramInt1 < 48)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(Setting.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new Setting()));
    }
    if (paramInt1 <= 66)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new SearchHistory()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new Stranger()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new CircleBuddy()));
    }
    if (paramInt1 < 74) {
      isUpdateFromLowV74 = true;
    }
    if (paramInt1 <= 84)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new ExpiredPushBanner()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new ShortVideoUpInfo()));
    }
    if (paramInt1 <= 89) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new HotChatInfo()));
    }
    if (paramInt1 <= 98)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingFeedInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingPublishInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingApplyInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingInfo.class.getSimpleName()));
    }
    if (paramInt1 < 102) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new SpecialCareInfo()));
    }
    if (paramInt1 < 103) {
      paramSQLiteDatabase.execSQL(TableBuilder.a(RecommendMessage.class.getSimpleName()));
    }
    if (paramInt1 < 108)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(new FreshNewsInfo()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(new FreshNewsNotify()));
    }
    if (paramInt1 < 113)
    {
      paramSQLiteDatabase.execSQL(TableBuilder.a(FreshNewsInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(FreshNewsNotify.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingFeedInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DateEventMsg.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingApplyInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingPublishInfo.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingPublishInfoDel.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingApplyInfoDel.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(RankEventMsg.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingOthersCache.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(DatingRecentDetail.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(GodEntity.class.getSimpleName()));
      paramSQLiteDatabase.execSQL(TableBuilder.a(GodListConfig.class.getSimpleName()));
    }
    checkColumnChange(getPackageName(), paramSQLiteDatabase);
  }
  
  public boolean verifyAuthentication()
  {
    if (name.matches("^[0-9]*$"))
    {
      EntityManager localEntityManager = createEntityManager();
      Ability localAbility = (Ability)localEntityManager.a(Ability.class, "flags=?", new String[] { String.valueOf(-1) });
      if (localAbility == null)
      {
        localAbility = new Ability();
        flags = -1;
        uin = name;
        localEntityManager.b(localAbility);
        return true;
      }
      if ((uin == null) || (!uin.equals(name)))
      {
        mInnerDbHelper.dropAllTable();
        localAbility = new Ability();
        flags = -1;
        uin = name;
        localEntityManager.b(localAbility);
        return false;
      }
    }
    return true;
  }
}
