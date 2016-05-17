package com.tencent.mobileqq.app;

import QQService.SvcRspGetDevLoginInfo;
import android.os.Bundle;
import com.tencent.mobileqq.app.proxy.GroupActionResp;
import com.tencent.mobileqq.data.Setting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import friendlist.GetOnlineInfoResp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FriendListObserver
  implements BusinessObserver
{
  public static final String b = "addDirect";
  public static final int c = 7;
  public static final int d = 9;
  
  public FriendListObserver()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a() {}
  
  protected void a(long paramLong, boolean paramBoolean, Object paramObject, int paramInt) {}
  
  protected void a(long paramLong, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Shield", 2, "FriendShield : send_oidb_0x5d1_0 : uin : " + paramLong + " isSetOrClear:" + paramBoolean1 + " isSuc:" + paramBoolean2 + " isPush:" + paramBoolean3 + " errMsg:" + paramString);
    }
  }
  
  public void a(String paramString) {}
  
  protected void a(String paramString, byte paramByte1, byte paramByte2) {}
  
  protected void a(String paramString, boolean paramBoolean) {}
  
  protected void a(ArrayList paramArrayList, boolean paramBoolean) {}
  
  protected void a(boolean paramBoolean) {}
  
  protected void a(boolean paramBoolean, byte paramByte1, String paramString1, long paramLong, byte paramByte2, byte paramByte3, short paramShort, String paramString2) {}
  
  protected void a(boolean paramBoolean1, int paramInt1, Object paramObject, int paramInt2, String paramString, boolean paramBoolean2) {}
  
  protected void a(boolean paramBoolean, long paramLong, int paramInt1, int paramInt2) {}
  
  protected void a(boolean paramBoolean, long paramLong, String paramString, GetOnlineInfoResp paramGetOnlineInfoResp) {}
  
  protected void a(boolean paramBoolean, SvcRspGetDevLoginInfo paramSvcRspGetDevLoginInfo) {}
  
  protected void a(boolean paramBoolean, Bundle paramBundle) {}
  
  protected void a(boolean paramBoolean, GroupActionResp paramGroupActionResp) {}
  
  protected void a(boolean paramBoolean, Setting paramSetting) {}
  
  public void a(boolean paramBoolean, Object paramObject) {}
  
  protected void a(boolean paramBoolean, String paramString) {}
  
  protected void a(boolean paramBoolean, String paramString, int paramInt) {}
  
  protected void a(boolean paramBoolean1, String paramString, int paramInt, boolean paramBoolean2) {}
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2) {}
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2, byte paramByte) {}
  
  protected void a(boolean paramBoolean, String paramString1, String paramString2, int paramInt) {}
  
  protected void a(boolean paramBoolean, ArrayList paramArrayList) {}
  
  protected void a(boolean paramBoolean, HashMap paramHashMap) {}
  
  protected void a(boolean paramBoolean, List paramList) {}
  
  protected void a(boolean paramBoolean, List paramList1, List paramList2) {}
  
  public void a(boolean paramBoolean, Map paramMap) {}
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, List paramList) {}
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {}
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, Object paramObject) {}
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString, Bundle paramBundle) {}
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject) {}
  
  protected void a(boolean paramBoolean, String[] paramArrayOfString) {}
  
  protected void a(boolean paramBoolean, String[] paramArrayOfString, Bundle paramBundle) {}
  
  protected void a(boolean paramBoolean, String[] paramArrayOfString, Map paramMap) {}
  
  protected void b() {}
  
  protected void b(boolean paramBoolean) {}
  
  protected void b(boolean paramBoolean, long paramLong, int paramInt1, int paramInt2) {}
  
  protected void b(boolean paramBoolean, SvcRspGetDevLoginInfo paramSvcRspGetDevLoginInfo) {}
  
  protected void b(boolean paramBoolean, GroupActionResp paramGroupActionResp) {}
  
  protected void b(boolean paramBoolean, Object paramObject) {}
  
  protected void b(boolean paramBoolean, String paramString) {}
  
  protected void b(boolean paramBoolean, String paramString, int paramInt) {}
  
  protected void b(boolean paramBoolean1, String paramString, int paramInt, boolean paramBoolean2) {}
  
  protected void b(boolean paramBoolean, String paramString1, String paramString2) {}
  
  protected void b(boolean paramBoolean, ArrayList paramArrayList) {}
  
  protected void b(boolean paramBoolean, List paramList) {}
  
  protected void b(boolean paramBoolean, Map paramMap) {}
  
  protected void b(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void b(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3) {}
  
  protected void b(boolean paramBoolean, Object[] paramArrayOfObject) {}
  
  protected void b(boolean paramBoolean, String[] paramArrayOfString) {}
  
  protected void c() {}
  
  protected void c(boolean paramBoolean) {}
  
  protected void c(boolean paramBoolean, SvcRspGetDevLoginInfo paramSvcRspGetDevLoginInfo) {}
  
  protected void c(boolean paramBoolean, GroupActionResp paramGroupActionResp) {}
  
  protected void c(boolean paramBoolean, Object paramObject) {}
  
  protected void c(boolean paramBoolean, String paramString) {}
  
  protected void c(boolean paramBoolean, String paramString, int paramInt) {}
  
  protected void c(boolean paramBoolean, String paramString1, String paramString2) {}
  
  protected void c(boolean paramBoolean, Map paramMap) {}
  
  protected void c(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void c(boolean paramBoolean, Object[] paramArrayOfObject) {}
  
  protected void d(boolean paramBoolean) {}
  
  protected void d(boolean paramBoolean, GroupActionResp paramGroupActionResp) {}
  
  protected void d(boolean paramBoolean, Object paramObject) {}
  
  public void d(boolean paramBoolean, String paramString) {}
  
  protected void d(boolean paramBoolean, String paramString, int paramInt) {}
  
  protected void d(boolean paramBoolean, Map paramMap) {}
  
  protected void d(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void d(boolean paramBoolean, Object[] paramArrayOfObject) {}
  
  protected void e(boolean paramBoolean) {}
  
  protected void e(boolean paramBoolean, Object paramObject) {}
  
  protected void e(boolean paramBoolean, Map paramMap) {}
  
  protected void e(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void f(boolean paramBoolean, Map paramMap) {}
  
  protected void f(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void g(boolean paramBoolean, Map paramMap) {}
  
  protected void g(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void h(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void i(boolean paramBoolean1, boolean paramBoolean2) {}
  
  protected void j(boolean paramBoolean1, boolean paramBoolean2) {}
  
  public final void onUpdate(int paramInt, boolean paramBoolean, Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = false;
    switch (paramInt)
    {
    case 16: 
    case 17: 
    case 20: 
    case 23: 
    case 24: 
    case 25: 
    case 26: 
    case 29: 
    case 31: 
    case 32: 
    case 34: 
    case 36: 
    case 40: 
    case 46: 
    case 54: 
    case 55: 
    case 57: 
    case 87: 
    case 88: 
    default: 
    case 1: 
    case 48: 
    case 2: 
    case 64: 
    case 65: 
    case 45: 
    case 4: 
    case 5: 
    case 6: 
    case 30: 
    case 53: 
    case 3: 
    case 67: 
    case 7: 
    case 8: 
    case 9: 
    case 10: 
    case 11: 
    case 12: 
    case 13: 
    case 14: 
    case 15: 
    case 27: 
    case 28: 
    case 33: 
    case 35: 
    case 37: 
    case 101: 
    case 38: 
    case 41: 
    case 42: 
    case 43: 
    case 44: 
    case 47: 
    case 39: 
    case 49: 
    case 73: 
    case 50: 
    case 58: 
    case 59: 
    case 60: 
    case 51: 
    case 61: 
    case 62: 
    case 52: 
    case 56: 
    case 69: 
    case 70: 
    case 63: 
    case 66: 
    case 68: 
      do
      {
        do
        {
          do
          {
            do
            {
              return;
              if (paramBoolean)
              {
                a(paramBoolean, ((Boolean)paramObject).booleanValue());
                return;
              }
              a(paramBoolean, false);
              return;
              if (paramBoolean) {}
              for (bool1 = ((Boolean)paramObject).booleanValue();; bool1 = true)
              {
                b(paramBoolean, bool1);
                return;
              }
              b(paramBoolean, (String[])paramObject);
              return;
              paramObject = (Object[])paramObject;
              a(paramBoolean, (String[])paramObject[0], (Bundle)paramObject[1]);
              return;
              paramObject = (Object[])paramObject;
              a(paramBoolean, (String[])paramObject[0], (Map)paramObject[1]);
              return;
              a(paramBoolean, (Setting)paramObject);
              return;
              a(paramBoolean, (String)((Object[])(Object[])paramObject)[0]);
              return;
              paramObject = (Object[])paramObject;
              a(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue(), ((Boolean)paramObject[2]).booleanValue());
              return;
              paramObject = (Object[])paramObject;
              b(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue(), ((Boolean)paramObject[2]).booleanValue());
              return;
              c(paramBoolean, (String)((Object[])(Object[])paramObject)[0]);
              return;
              paramObject = (Bundle)paramObject;
              c(paramBoolean, paramObject.getString("troopUin"), paramObject.getString("url"));
              return;
              a((String)paramObject, paramBoolean);
              return;
              a((ArrayList)paramObject, paramBoolean);
              return;
              a();
              return;
              a(paramBoolean, (HashMap)paramObject);
              return;
              if (paramBoolean)
              {
                paramObject = (Object[])paramObject;
                a((String)paramObject[0], ((Byte)paramObject[1]).byteValue(), ((Byte)paramObject[2]).byteValue());
                return;
              }
              a(null, (byte)0, (byte)0);
              return;
              if (paramBoolean)
              {
                paramObject = (Object[])paramObject;
                a(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue());
                return;
              }
              a(paramBoolean, "", 0);
              return;
              paramObject = (Bundle)paramObject;
              String str = paramObject.getString("uin");
              paramInt = paramObject.getInt("resultCode", 1);
              bool2 = paramObject.getBoolean("addDirect", false);
              if (paramInt == 0) {
                bool1 = true;
              }
              a(paramBoolean, bool1, bool2, str, paramObject);
              return;
              a(paramBoolean, (Bundle)paramObject);
              return;
              a(paramBoolean, (String[])paramObject);
              return;
              d(paramBoolean);
              return;
              a(paramBoolean, paramObject);
              return;
              paramObject = (Object[])paramObject;
              a(paramBoolean, (String)paramObject[0], (String)paramObject[1], ((Byte)paramObject[2]).byteValue());
              return;
              a(paramBoolean);
              return;
              paramObject = (Bundle)paramObject;
              str = paramObject.getString("uin");
              if (paramBoolean)
              {
                a(true, str, paramObject.getString("nick_name"), paramObject.getInt("group_id", 0));
                return;
              }
              a(false, str, "", 0);
              return;
              bool1 = bool2;
              if ((paramObject instanceof Object[]))
              {
                paramObject = (Object[])paramObject;
                bool1 = bool2;
                if (paramObject.length == 1)
                {
                  bool1 = bool2;
                  if ((paramObject[0] instanceof Boolean)) {
                    bool1 = ((Boolean)paramObject[0]).booleanValue();
                  }
                }
              }
              c(paramBoolean, bool1);
              return;
              a(paramBoolean, (ArrayList)paramObject);
              return;
              b();
              return;
              a(paramBoolean, (Map)paramObject);
              return;
              c(paramBoolean, (Map)paramObject);
              return;
              d(paramBoolean, (Map)paramObject);
              return;
              e(paramBoolean, (Map)paramObject);
              return;
              f(paramBoolean, (Map)paramObject);
              return;
              b(paramBoolean, (Map)paramObject);
              return;
              b(paramBoolean, (String)((Object[])(Object[])paramObject)[0]);
              return;
              paramObject = (Object[])paramObject;
              a(paramBoolean, ((Integer)paramObject[0]).intValue(), paramObject[1], ((Integer)paramObject[2]).intValue(), (String)paramObject[3], ((Boolean)paramObject[4]).booleanValue());
              return;
              paramObject = (Object[])paramObject;
              a(((Long)paramObject[0]).longValue(), paramBoolean, paramObject[1], ((Integer)paramObject[2]).intValue());
              return;
              if (paramObject == null)
              {
                a(false, null, null);
                return;
              }
              paramObject = (Object[])paramObject;
              a(paramBoolean, (List)paramObject[0], (List)paramObject[1]);
              return;
              b(paramBoolean, (SvcRspGetDevLoginInfo)paramObject);
              return;
              c(paramBoolean, (SvcRspGetDevLoginInfo)paramObject);
              return;
              a(paramBoolean, (SvcRspGetDevLoginInfo)paramObject);
              return;
              paramObject = (Object[])paramObject;
              d(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue());
              return;
              paramObject = (Object[])paramObject;
              b(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue());
              return;
              paramObject = (Object[])paramObject;
              c(paramBoolean, (String)paramObject[0], ((Integer)paramObject[1]).intValue());
              return;
              paramObject = (Object[])paramObject;
              b(paramBoolean, ((Long)paramObject[0]).longValue(), ((Integer)paramObject[1]).intValue(), ((Integer)paramObject[2]).intValue());
              return;
            } while (!(paramObject instanceof Object[]));
            paramObject = (Object[])paramObject;
            a(((Long)paramObject[0]).longValue(), ((Boolean)paramObject[1]).booleanValue(), ((Boolean)paramObject[2]).booleanValue(), ((Boolean)paramObject[3]).booleanValue(), (String)paramObject[4]);
            return;
            if (paramBoolean)
            {
              b(paramBoolean, (ArrayList)paramObject);
              return;
            }
            b(paramBoolean, null);
            return;
            e(paramBoolean);
            return;
          } while ((!paramBoolean) || (paramObject == null) || (!(paramObject instanceof String)));
          a((String)paramObject);
          return;
          b(paramBoolean, paramObject);
          return;
        } while (!(paramObject instanceof Object[]));
        paramObject = (Object[])paramObject;
        paramInt = paramObject.length;
        if (paramInt == 2)
        {
          a(paramBoolean, ((Long)paramObject[0]).longValue(), (String)paramObject[1], null);
          return;
        }
      } while (paramInt != 3);
      a(paramBoolean, ((Long)paramObject[0]).longValue(), (String)paramObject[1], (GetOnlineInfoResp)paramObject[2]);
      return;
    case 18: 
      a(paramBoolean, (GroupActionResp)paramObject);
      return;
    case 19: 
      b(paramBoolean, (GroupActionResp)paramObject);
      return;
    case 21: 
      c(paramBoolean, (GroupActionResp)paramObject);
      return;
    case 22: 
      d(paramBoolean, (GroupActionResp)paramObject);
      return;
    case 71: 
    case 72: 
      paramObject = (Bundle)paramObject;
      long l = paramObject.getLong("uin");
      int j = paramObject.getInt("safety_flag");
      int i = 146;
      if (paramInt == 72) {
        i = 147;
      }
      a(paramBoolean, l, i, j);
      return;
    case 76: 
      d(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 77: 
      e(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 74: 
      paramObject = (Bundle)paramObject;
      a(paramBoolean, paramObject.getString("uin"), paramObject.getString("nick_name"));
      return;
    case 75: 
      c(paramBoolean, paramObject);
      return;
    case 78: 
      g(paramBoolean, (Map)paramObject);
      return;
    case 89: 
      paramObject = (Object[])paramObject;
      b(paramBoolean, (String)paramObject[0], (String)paramObject[1]);
      return;
    case 79: 
      paramObject = (Object[])paramObject;
      a(paramBoolean, ((Boolean)paramObject[0]).booleanValue(), ((Boolean)paramObject[1]).booleanValue());
      return;
    case 81: 
      g(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 82: 
      i(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 83: 
      h(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 84: 
      j(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 80: 
      f(paramBoolean, ((Boolean)paramObject).booleanValue());
      return;
    case 90: 
      b(paramBoolean, (List)paramObject);
      return;
    case 91: 
      a(paramBoolean, (List)paramObject);
      return;
    case 85: 
      c(paramBoolean);
      return;
    case 86: 
      paramObject = (List)paramObject;
      if ((paramObject != null) && (paramObject.size() == 2))
      {
        b(paramBoolean, ((Boolean)paramObject.get(0)).booleanValue(), ((Boolean)paramObject.get(1)).booleanValue());
        return;
      }
      b(false, false, false);
      return;
    case 92: 
      if (paramBoolean)
      {
        paramObject = (Object[])paramObject;
        a(true, ((Boolean)paramObject[0]).booleanValue(), ((Boolean)paramObject[1]).booleanValue(), paramObject[2]);
        return;
      }
      a(false, false, false, null);
      return;
    case 94: 
      if (paramBoolean)
      {
        e(true, paramObject);
        return;
      }
      e(false, null);
      return;
    case 93: 
      d(paramBoolean, paramObject);
      return;
    case 100: 
      b(paramBoolean);
      return;
    case 95: 
      a(paramBoolean, (Object[])paramObject);
      return;
    case 96: 
      b(paramBoolean, (Object[])paramObject);
      return;
    case 97: 
      c(paramBoolean, (Object[])paramObject);
      return;
    case 99: 
      d(paramBoolean, (Object[])paramObject);
      return;
    case 98: 
      if (paramBoolean)
      {
        paramObject = (Object[])paramObject;
        a(paramBoolean, ((Boolean)paramObject[0]).booleanValue(), (List)paramObject[1]);
        return;
      }
      a(false, false, null);
      return;
    case 102: 
      c();
      return;
    }
    d(paramBoolean, (String)((Object[])(Object[])paramObject)[0]);
  }
}
