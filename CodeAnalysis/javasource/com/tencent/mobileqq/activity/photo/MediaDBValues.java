package com.tencent.mobileqq.activity.photo;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class MediaDBValues
{
  public static final int a = 2;
  public static final String a = "media_scanner_database";
  public static final String[] a = { "id", "name", "path", "folderpath", "filesize", "modifieddate", "duration", "mimetype", "md5" };
  public static final String b = "content_table";
  public static final String[] b = { "id", "folderpath", "modifieddate" };
  public static final String c = "folder_table";
  public static final String d = "id";
  public static final String e = "name";
  public static final String f = "path";
  public static final String g = "filesize";
  public static final String h = "modifieddate";
  public static final String i = "duration";
  public static final String j = "mimetype";
  public static final String k = "md5";
  public static final String l = "folderpath";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public MediaDBValues() {}
}
