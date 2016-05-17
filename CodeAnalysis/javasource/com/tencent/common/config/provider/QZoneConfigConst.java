package com.tencent.common.config.provider;

import android.net.Uri;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract interface QZoneConfigConst
{
  public static final int a = 1;
  public static final Uri a = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_configs");
  public static final String a = "config_db";
  public static final int b = 2;
  public static final Uri b = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_cookie");
  public static final String b = "qz_configs";
  public static final int c = 3;
  public static final Uri c = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_update");
  public static final String c = "qz_cookie";
  public static final int d = 4;
  public static final Uri d = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_delete");
  public static final String d = "qz_update";
  public static final int e = 5;
  public static final Uri e = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_isp_config");
  public static final String e = "qz_check_time";
  public static final int f = 6;
  public static final Uri f = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_check_time");
  public static final String f = "qz_isp_config";
  public static final int g = 8;
  public static final Uri g = Uri.parse("content://com.tencent.common.config.provider.QZoneConfigProvider/qz_navigator_bar");
  public static final String g = "qz_navigator_bar";
  public static final int h = 8;
  public static final String h = "qz_delete";
  public static final String i = "main_key";
  public static final String j = "second_key";
  public static final String k = "value";
  public static final String l = "key";
  public static final String m = "cookie";
  public static final String n = "check_time";
  public static final String o = "updatelog";
  public static final String p = "name";
  public static final String q = "uin";
  public static final String r = "entraceid";
  public static final String s = "entracename";
  public static final String t = "entraceicon";
  public static final String u = "entraceaction";
  public static final String v = "isDefault";
  public static final String w = "tabid";
  public static final String x = "com.tencent.common.config.provider.QZoneConfigProvider";
  public static final String y = "id";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
