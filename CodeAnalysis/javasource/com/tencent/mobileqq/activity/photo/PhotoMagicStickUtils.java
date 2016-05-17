package com.tencent.mobileqq.activity.photo;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

public class PhotoMagicStickUtils
{
  private static int jdField_a_of_type_Int;
  static long jdField_a_of_type_Long;
  private static int b = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 19922944;
  }
  
  public PhotoMagicStickUtils() {}
  
  public static void a(Activity paramActivity, String paramString1, ActionSheet paramActionSheet, boolean paramBoolean, int paramInt, String paramString2, String paramString3, String paramString4)
  {
    String str = paramActionSheet.a(paramInt);
    if (str == null) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("_photo", 2, "onBtnClickListener clikedBtn text:" + str);
    }
    Intent localIntent = new Intent();
    localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_CLASS_NAME", paramActivity.getClass().getName());
    localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    if (paramActivity.getString(2131369791).equals(str)) {
      PhotoUtils.a(paramActivity, localIntent, 4, paramString1, paramString2, paramString3, paramString4);
    }
    for (;;)
    {
      paramActionSheet.dismiss();
      return;
      if (paramActivity.getString(2131369792).equals(str)) {
        PhotoUtils.a(paramActivity, localIntent, 5, paramString1, paramString2, paramString3, paramString4);
      } else if (paramActivity.getString(2131369793).equals(str)) {
        PhotoUtils.a(paramActivity, localIntent, 6, paramString1, paramString2, paramString3, paramString4);
      }
    }
  }
  
  public static void a(Context paramContext, ArrayList paramArrayList, ActionSheet paramActionSheet, int paramInt)
  {
    Iterator localIterator = paramArrayList.iterator();
    int j = 0;
    int i = 0;
    int k;
    int m;
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      long l = new File(str).length();
      k = j;
      if (l > a) {
        k = j + 1;
      }
      m = (int)(i + l);
      i = m;
      j = k;
      if (QLog.isColorLevel())
      {
        QLog.d("_photo", 2, "addExtraBtn path:" + str + ",len:" + l);
        i = m;
        j = k;
      }
    }
    if (paramInt == 0)
    {
      k = 1;
      if (paramInt != 3000) {
        break label323;
      }
      m = 1;
      label155:
      if (paramInt != 1) {
        break label329;
      }
      paramInt = 1;
      label162:
      paramInt = k | m | paramInt;
      if ((paramInt == 0) || (j > 0)) {
        break label334;
      }
    }
    label323:
    label329:
    label334:
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("_photo", 2, "addExtraBtn showSendRaw:" + bool);
      }
      paramArrayList = PhotoUtils.b(paramArrayList);
      paramActionSheet.a(paramContext.getString(2131369795) + "(" + paramArrayList + ")", 5, false);
      if (!bool) {
        break label340;
      }
      paramArrayList = PhotoUtils.a(paramContext, i);
      paramActionSheet.a(paramContext.getString(2131369796) + "(" + paramArrayList + ")", 5, false);
      paramActionSheet.a(2131369810);
      return;
      k = 0;
      break;
      m = 0;
      break label155;
      paramInt = 0;
      break label162;
    }
    label340:
    if (paramInt != 0)
    {
      paramActionSheet.a(2131369811);
      return;
    }
    paramActionSheet.a(2131369810);
  }
  
  public static void a(String paramString1, Activity paramActivity, boolean paramBoolean, int paramInt, String paramString2, String paramString3, String paramString4)
  {
    Intent localIntent = paramActivity.getIntent();
    localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_CLASS_NAME", paramActivity.getClass().getName());
    localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    PhotoUtils.a(paramActivity, localIntent, 6, paramString1, paramString2, paramString3, paramString4);
  }
  
  public static void a(String paramString1, String paramString2, Activity paramActivity, boolean paramBoolean, int paramInt1, String paramString3, String paramString4, String paramString5, int paramInt2, String paramString6, String paramString7, byte[] paramArrayOfByte)
  {
    if (paramActivity == null) {}
    do
    {
      return;
      Intent localIntent = paramActivity.getIntent();
      localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_CLASS_NAME", paramActivity.getClass().getName());
      localIntent.putExtra("PhotoConst.PHOTO_SELECT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      paramInt1 = localIntent.getIntExtra("PasterConstants.intent_params_refer", -1);
      if (paramInt1 > 0) {
        paramInt2 = paramInt1;
      }
      localIntent.putExtra("PasterConstants.intent_params_refer", paramInt2);
      localIntent.putExtra("PasterConstants.select_image_pasters", paramArrayOfByte);
      localIntent.putExtra("PasterConstants.paster_id", paramString6);
      localIntent.putExtra("PasterConstants.paster_cate_id", paramString7);
      localIntent.putExtra("PasterConstants.paster_original_path", paramString2);
      PhotoUtils.a(paramActivity, localIntent, 7, paramString1, paramString3, paramString4, paramString5);
    } while ((TextUtils.isEmpty(paramString7)) && (TextUtils.isEmpty(paramString6)));
    paramActivity.finish();
  }
}
