package com.tencent.mobileqq.activity.aio.photo;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.galleryactivity.AbstractImageAdapter;
import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.common.galleryactivity.AbstractImageListScene;
import com.tencent.common.galleryactivity.GalleryImage;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DialogUtil.DialogOnClickAdapter;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.GestureSelectGridView;
import com.tencent.widget.GestureSelectGridView.OnSelectListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import ldw;
import ldy;
import ldz;
import lea;
import leb;
import lec;
import led;

public class AIOImageListScene
  extends AbstractImageListScene
  implements DialogInterface.OnCancelListener
{
  static final String jdField_a_of_type_JavaLangString = "AIOImageListScene";
  public static final int c = 20;
  public static final int d = 99;
  public static final int e = 98;
  static final int f = 20;
  static final int g = 0;
  static final int h = 1;
  static final int i = 2;
  static final int j = 0;
  static final int k = 1;
  static final int l = 2;
  static final int m = 3;
  static final int n = 4;
  static final int o = 5;
  static final int p = 1;
  static final int q = 2;
  static final int r = 1;
  static final int s = 2;
  static final int u = 0;
  static final int v = 1;
  static final int w = 2;
  long jdField_a_of_type_Long;
  Handler jdField_a_of_type_AndroidOsHandler;
  public AIOImageListModel a;
  public IAIOImageProvider a;
  public ArrayList a;
  public led a;
  public String b;
  boolean b;
  public String c;
  String d;
  int t;
  public int x;
  
  public AIOImageListScene(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel, IAIOImageProvider paramIAIOImageProvider, String paramString)
  {
    super(paramActivity, paramAbstractImageListModel);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_b_of_type_Boolean = false;
    t = 1;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel = ((AIOImageListModel)paramAbstractImageListModel);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider = paramIAIOImageProvider;
    jdField_b_of_type_JavaLangString = paramString;
    if (TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) {
      jdField_b_of_type_JavaLangString = "0";
    }
  }
  
  public int a()
  {
    if ((jdField_a_of_type_JavaUtilArrayList == null) || (jdField_a_of_type_JavaUtilArrayList.isEmpty())) {
      return 0;
    }
    AIORichMediaData localAIORichMediaData = jdField_a_of_type_JavaUtilArrayList.get(0)).a;
    if (AIOImageData.class.isInstance(localAIORichMediaData)) {
      return 1;
    }
    if (AIOShortVideoData.class.isInstance(localAIORichMediaData)) {
      return 2;
    }
    return 0;
  }
  
  protected View.OnClickListener a()
  {
    return new lec(this);
  }
  
  protected AbstractImageAdapter a(Activity paramActivity, int paramInt)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter = new AIOPhotoListAdapter(jdField_a_of_type_AndroidAppActivity, paramInt, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider);
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel);
    return jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter;
  }
  
  protected AdapterView.OnItemClickListener a()
  {
    return new lea(this);
  }
  
  protected GestureSelectGridView.OnSelectListener a()
  {
    return new leb(this);
  }
  
  void a(int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "showDownloadResult type = " + paramInt1);
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
    }
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 230);
    jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnDismissListener(new ldy(this));
    Object localObject;
    switch (paramInt1)
    {
    case 2: 
    default: 
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
      return;
    case 1: 
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setTitle(String.format(jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370500), new Object[] { Integer.valueOf(paramInt2) }));
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
      return;
    case 0: 
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setTitle(2131370499);
      localObject = new ldz(this, paramInt2);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setNegativeButton(2131366996, (DialogInterface.OnClickListener)localObject);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setPositiveButton(2131364331, (DialogInterface.OnClickListener)localObject);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "showSDCardResult type = " + paramInt2);
    }
    String str;
    if (paramInt2 == 22)
    {
      localObject = jdField_a_of_type_AndroidAppActivity.getString(2131367418);
      str = jdField_a_of_type_AndroidAppActivity.getString(2131367419);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(jdField_a_of_type_AndroidAppActivity, 230, (String)localObject, str, null, null);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setTitle((String)localObject);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setMessage(str);
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
      return;
      if (paramInt2 == 24)
      {
        localObject = jdField_a_of_type_AndroidAppActivity.getString(2131367416);
        str = jdField_a_of_type_AndroidAppActivity.getString(2131367417);
      }
      else if (paramInt2 == 23)
      {
        localObject = jdField_a_of_type_AndroidAppActivity.getString(2131367414);
        str = jdField_a_of_type_AndroidAppActivity.getString(2131367415);
      }
      else
      {
        localObject = null;
        str = null;
      }
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if (paramInt2 == -1)
    {
      if (paramInt1 != 1) {
        break label130;
      }
      Intent localIntent = new Intent(jdField_a_of_type_AndroidAppActivity, SendPhotoActivity.class);
      paramIntent = new Bundle(paramIntent.getExtras());
      paramIntent.putBoolean("PhotoConst.HANDLE_DEST_RESULT", false);
      paramIntent.putInt("PhotoConst.SEND_BUSINESS_TYPE", 1031);
      localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
      localIntent = AIOUtils.a(localIntent, null);
      localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
      paramIntent.putBoolean("PicContants.NEED_COMPRESS", false);
      localIntent.putExtras(paramIntent);
      jdField_a_of_type_AndroidAppActivity.startActivity(localIntent);
      jdField_a_of_type_AndroidAppActivity.finish();
    }
    label130:
    do
    {
      do
      {
        return;
      } while ((99 != paramInt1) && (98 != paramInt1));
      paramIntent = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (paramIntent.hasNext()) {
        ((GalleryImage)paramIntent.next()).a(2);
      }
      if (jdField_a_of_type_JavaUtilArrayList != null) {
        jdField_a_of_type_JavaUtilArrayList.clear();
      }
      if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter != null) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.notifyDataSetChanged();
      }
      jdField_a_of_type_Boolean = false;
      if (jdField_b_of_type_AndroidWidgetTextView != null) {
        jdField_b_of_type_AndroidWidgetTextView.setText(2131370490);
      }
    } while (jdField_a_of_type_AndroidViewView == null);
    jdField_a_of_type_AndroidViewView.setVisibility(8);
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3, String arg6)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel == null) {}
    Object localObject1;
    do
    {
      do
      {
        return;
        localObject3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel;
        if (paramInt3 != 1) {
          break;
        }
        localObject1 = ???;
        int i1 = ((AIOImageListModel)localObject3).a(paramLong, paramInt1, paramInt2, (String)localObject1);
        if (paramInt2 == 1)
        {
          int i2 = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s();
          int i3 = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getChildCount();
          if ((i1 >= i2) && (i1 <= i3 + i2 - 1))
          {
            localObject1 = jdField_a_of_type_ComTencentWidgetGestureSelectGridView.getChildAt(i1 - i2);
            ((AIOPhotoListAdapter)jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter).a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.a(i1), (View)localObject1);
          }
        }
      } while ((paramInt2 != 2) || (jdField_a_of_type_Led == null));
      localObject1 = jdField_a_of_type_Led;
    } while ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.e != paramLong) || (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.i != paramInt1));
    Object localObject3 = (AIOImageData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a;
    if (paramInt3 == 1) {}
    for (;;)
    {
      jdField_b_of_type_JavaLangString = ???;
      synchronized (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.notifyAll();
        return;
      }
      String str = "I:E";
      break;
      ??? = "I:E";
    }
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    o();
    super.a(paramViewGroup);
  }
  
  public void a(String paramString)
  {
    if (paramString.equalsIgnoreCase(jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370490)))
    {
      jdField_a_of_type_Boolean = true;
      a("Multi_Pic_choose", 0);
      return;
    }
    jdField_a_of_type_Boolean = false;
  }
  
  public void a(String paramString, int paramInt) {}
  
  public void a(Integer... paramVarArgs)
  {
    c(paramVarArgs[0].intValue(), 0);
    jdField_a_of_type_Led = new led(this, jdField_a_of_type_JavaUtilArrayList);
    jdField_a_of_type_Led.execute(paramVarArgs);
  }
  
  public boolean a(View paramView, GalleryImage paramGalleryImage)
  {
    Object localObject = (AIOPhotoListAdapter.Holder)paramView.getTag();
    if (localObject != null)
    {
      paramView = jdField_a_of_type_AndroidWidgetImageView;
      localObject = jdField_b_of_type_AndroidWidgetImageView;
      switch (paramGalleryImage.b())
      {
      default: 
        paramView.setVisibility(4);
        ((ImageView)localObject).setVisibility(4);
      }
      for (;;)
      {
        return true;
        paramView.setVisibility(0);
        ((ImageView)localObject).setVisibility(0);
        continue;
        paramView.setVisibility(4);
        ((ImageView)localObject).setVisibility(4);
      }
    }
    return false;
  }
  
  public boolean a(AIORichMediaInfo paramAIORichMediaInfo, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i1 = a();
    if (paramBoolean2) {
      if (!AIOShortVideoData.class.isInstance(a)) {}
    }
    long l1;
    do
    {
      int i2;
      do
      {
        do
        {
          return false;
        } while (i1 == 2);
        i2 = paramAIORichMediaInfo.b();
      } while (((i2 == 1) && (paramBoolean1)) || ((i2 == 2) && (!paramBoolean1)));
      if ((i2 != 2) || (!paramBoolean1) || (jdField_a_of_type_JavaUtilArrayList.size() < 20)) {
        break;
      }
      l1 = System.currentTimeMillis();
    } while (l1 - jdField_a_of_type_Long < 700L);
    if (i1 == 2) {
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 1, "最多只能选择20段视频", 0).b(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492908));
    }
    for (;;)
    {
      jdField_a_of_type_Long = l1;
      return false;
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 1, "最多只能选择20张图片", 0).b(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492908));
    }
    if (paramBoolean1)
    {
      paramAIORichMediaInfo.a(1);
      jdField_a_of_type_JavaUtilArrayList.add(paramAIORichMediaInfo);
    }
    for (;;)
    {
      return true;
      paramAIORichMediaInfo.a(2);
      jdField_a_of_type_JavaUtilArrayList.remove(paramAIORichMediaInfo);
    }
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_AndroidAppDialog != null)
    {
      jdField_a_of_type_AndroidAppDialog.dismiss();
      jdField_a_of_type_AndroidAppDialog = null;
    }
    switch (paramInt1)
    {
    case 10: 
    default: 
      return;
    case 20: 
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 2, jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370495) + AppConstants.bi, 0).b(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492908));
      return;
    case 21: 
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 1, jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370496) + AppConstants.bi, 0).b(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492908));
      return;
    case 22: 
    case 23: 
    case 24: 
      a(3, 0);
      return;
    case 11: 
      a(1, paramInt2);
      return;
    }
    s();
  }
  
  public void c(int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "showProgressDialog step = " + paramInt1);
    }
    if (jdField_a_of_type_AndroidAppDialog == null)
    {
      jdField_a_of_type_AndroidAppDialog = new Dialog(jdField_a_of_type_AndroidAppActivity, 2131558942);
      jdField_a_of_type_AndroidAppDialog.setCancelable(true);
      jdField_a_of_type_AndroidAppDialog.show();
      jdField_a_of_type_AndroidAppDialog.setContentView(2130903444);
      jdField_a_of_type_AndroidAppDialog.setOnCancelListener(this);
    }
    String str = paramInt2 + "%";
    TextView localTextView = (TextView)jdField_a_of_type_AndroidAppDialog.findViewById(2131298581);
    switch (paramInt1)
    {
    }
    for (;;)
    {
      localTextView.setText(str);
      if (!jdField_a_of_type_AndroidAppDialog.isShowing()) {
        jdField_a_of_type_AndroidAppDialog.show();
      }
      return;
      str = localTextView.getResources().getText(2131370493) + str;
      continue;
      str = localTextView.getResources().getText(2131370494) + str;
    }
  }
  
  public boolean d()
  {
    return false;
  }
  
  public void f()
  {
    super.f();
    jdField_a_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_JavaUtilArrayList = null;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel = null;
  }
  
  public void j()
  {
    super.j();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AIOImageListScene", 2, "onStart start FirstVisiblePosition " + jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s() + " LastVisiblePosition " + jdField_a_of_type_ComTencentWidgetGestureSelectGridView.t() + " SelectedIndex = " + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b());
      }
      i2 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b();
      i3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.d();
      i1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.c();
      if ((i2 > i3) || (i2 < i1) || (i2 - i1 < 4))
      {
        if ((i3 <= 0) || (i2 <= i3)) {
          break label301;
        }
        i2 -= i3;
        if ((i2 > 4) && (i2 % 4 == 0))
        {
          i1 = i2 + i1 + 4;
          if (QLog.isColorLevel()) {
            QLog.d("AIOImageListScene", 2, "onStart selectedIndex > lastPosition n " + i1);
          }
          jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setSelection(i1);
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b(jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s());
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.c(jdField_a_of_type_ComTencentWidgetGestureSelectGridView.t());
        }
      }
      else if (QLog.isColorLevel())
      {
        QLog.d("AIOImageListScene", 2, "onStart end FirstVisiblePosition " + jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s() + " LastVisiblePosition " + jdField_a_of_type_ComTencentWidgetGestureSelectGridView.t() + " SelectedIndex = " + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b());
      }
    }
    label301:
    while (!QLog.isColorLevel()) {
      for (;;)
      {
        int i2;
        int i3;
        return;
        int i1 = i2 + i1 + 8;
        continue;
        jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setSelection(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b());
      }
    }
    QLog.d("AIOImageListScene", 2, "onStart error!! mAIOModel == null ");
  }
  
  protected void l()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidAppActivity, null);
    localActionSheet.a(2131370485);
    localActionSheet.a(2131370486, 5);
    int i1 = a();
    if (i1 == 1) {
      localActionSheet.c(2131369777);
    }
    if ((jdField_b_of_type_Boolean) && (i1 == 1)) {
      localActionSheet.a(2131369786, 5);
    }
    localActionSheet.d(2131366996);
    localActionSheet.a(new ldw(this, localActionSheet));
    localActionSheet.show();
    a("Multi_Pic_Forward", jdField_a_of_type_JavaUtilArrayList.size());
  }
  
  protected void m()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "saveAllImage");
    }
    Object localObject = BaseApplication.getContext();
    boolean bool = SettingCloneUtil.readValue((Context)localObject, null, ((Context)localObject).getString(2131367548), "qqsetting_auto_receive_pic_key", true);
    int i1;
    int i2;
    label64:
    label73:
    AIORichMediaInfo localAIORichMediaInfo;
    if (NetworkUtil.b(BaseApplication.getContext()) == 1)
    {
      i1 = 1;
      if (NetworkUtil.b(BaseApplication.getContext()) != -1) {
        break label164;
      }
      i2 = 1;
      localObject = jdField_a_of_type_JavaUtilArrayList.iterator();
      do
      {
        if (!((Iterator)localObject).hasNext()) {
          break label247;
        }
        localAIORichMediaInfo = (AIORichMediaInfo)((Iterator)localObject).next();
        if (!AIOImageData.class.isInstance(a)) {
          break;
        }
      } while (((AIOImageData)a).a(2) != null);
    }
    label164:
    label247:
    for (int i3 = 0;; i3 = 1)
    {
      if (i3 != 0) {
        a(new Integer[] { Integer.valueOf(1) });
      }
      for (;;)
      {
        a("Multi_Pic_Save", jdField_a_of_type_JavaUtilArrayList.size());
        return;
        i1 = 0;
        break;
        i2 = 0;
        break label64;
        if (!AIOShortVideoData.class.isInstance(a)) {
          break label73;
        }
        break label73;
        if (i2 != 0) {
          a(1, jdField_a_of_type_JavaUtilArrayList.size());
        } else if ((bool) || (i1 != 0)) {
          a(new Integer[] { Integer.valueOf(0), Integer.valueOf(1) });
        } else {
          a(0, 0);
        }
      }
    }
  }
  
  void o()
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    Bundle localBundle = jdField_a_of_type_AndroidAppActivity.getIntent().getExtras();
    jdField_b_of_type_Boolean = localBundle.getBoolean("extra.CAN_FORWARD_TO_GROUP_ALBUM", false);
    if (jdField_b_of_type_Boolean)
    {
      c = localBundle.getString("extra.GROUP_UIN");
      d = localBundle.getString("extra.GROUP_CODE");
      if (((c == null) || (d == null) || (jdField_b_of_type_JavaLangString == null)) && (QLog.isColorLevel())) {
        QLog.i("AIOImageListScene", 2, "mGroupUin=" + c + ", mGroupCode=" + d + ", mMyUin=" + jdField_b_of_type_JavaLangString);
      }
    }
    t = localBundle.getInt("extra.EXTRA_FORWARD_TO_QZONE_SRC");
    x = localBundle.getInt("forward_source_uin_type", -1);
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    jdField_a_of_type_AndroidAppDialog = null;
    paramDialogInterface = jdField_a_of_type_Led;
    if (paramDialogInterface != null) {
      jdField_a_of_type_Boolean = false;
    }
  }
  
  public void p()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "forwardAllImage");
    }
    Object localObject = BaseApplication.getContext();
    boolean bool = SettingCloneUtil.readValue((Context)localObject, null, ((Context)localObject).getString(2131367548), "qqsetting_auto_receive_pic_key", true);
    int i1;
    int i2;
    if (NetworkUtil.b(BaseApplication.getContext()) == 1)
    {
      i1 = 1;
      if (NetworkUtil.b(BaseApplication.getContext()) != -1) {
        break label136;
      }
      i2 = 1;
      label64:
      localObject = jdField_a_of_type_JavaUtilArrayList.iterator();
      AIORichMediaInfo localAIORichMediaInfo;
      do
      {
        if (!((Iterator)localObject).hasNext()) {
          break;
        }
        localAIORichMediaInfo = (AIORichMediaInfo)((Iterator)localObject).next();
      } while ((!AIOImageData.class.isInstance(a)) || (a.a(2) != null));
    }
    for (int i3 = 0;; i3 = 1)
    {
      if (i3 != 0)
      {
        s();
        return;
        i1 = 0;
        break;
        label136:
        i2 = 0;
        break label64;
      }
      if (i2 != 0)
      {
        a(1, jdField_a_of_type_JavaUtilArrayList.size());
        return;
      }
      if ((bool) || (i1 != 0))
      {
        a(new Integer[] { Integer.valueOf(0), Integer.valueOf(2) });
        return;
      }
      a(0, 1);
      return;
    }
  }
  
  public void q()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "forwardToGroupAlbum()");
    }
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList3 = new ArrayList();
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (AIORichMediaInfo)localIterator.next();
      if (AIOImageData.class.isInstance(a))
      {
        localObject = (AIOImageData)a;
        localArrayList1.add(a);
        localArrayList2.add(e);
        localArrayList3.add(Long.valueOf(c));
      }
    }
    AIOGalleryUtils.a(jdField_a_of_type_AndroidAppActivity, jdField_b_of_type_JavaLangString, c, d, localArrayList1, localArrayList2, localArrayList3, 2);
  }
  
  public void r()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "forwardToQZoneAlbum()");
    }
    AIOGalleryUtils.a(jdField_a_of_type_AndroidAppActivity, jdField_b_of_type_JavaLangString, d, t, (List)jdField_a_of_type_JavaUtilArrayList.clone(), jdField_b_of_type_Boolean, c);
  }
  
  void s()
  {
    if ((jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.get(0) != null) && ((jdField_a_of_type_JavaUtilArrayList.get(0) instanceof AIORichMediaInfo)))
    {
      localObject1 = (AIORichMediaInfo)jdField_a_of_type_JavaUtilArrayList.get(0);
      if (AIOImageData.class.isInstance(a))
      {
        localObject2 = (AIOImageData)a;
        localObject1 = new Bundle();
        ((Bundle)localObject1).putInt("forward_type", 12);
        localObject3 = ((AIOImageData)localObject2).a(2);
        ((Bundle)localObject1).putString("forward_urldrawable_thumb_url", ((AIOImageData)localObject2).a(1));
        ((Bundle)localObject1).putString("forward_urldrawable_big_url", (String)localObject3);
        ((Bundle)localObject1).putBoolean("forward_urldrawable", true);
        if (jdField_a_of_type_JavaUtilArrayList.size() > 1) {
          ((Bundle)localObject1).putString("forward_text", jdField_a_of_type_JavaUtilArrayList.size() + "张图片");
        }
        ((Bundle)localObject1).putBoolean("sendMultiple", true);
        localObject2 = new ArrayList();
        localObject3 = jdField_a_of_type_JavaUtilArrayList.iterator();
        while (((Iterator)localObject3).hasNext()) {
          ((ArrayList)localObject2).add(nexta).jdField_b_of_type_JavaLangString);
        }
        ((Bundle)localObject1).putStringArrayList("PhotoConst.PHOTO_PATHS", (ArrayList)localObject2);
        localObject2 = new Intent();
        ((Intent)localObject2).putExtras((Bundle)localObject1);
        ForwardBaseOption.a(jdField_a_of_type_AndroidAppActivity, (Intent)localObject2, 1);
      }
    }
    while (!QLog.isColorLevel())
    {
      Object localObject1;
      Object localObject2;
      Object localObject3;
      return;
    }
    QLog.d("AIOImageListScene", 2, "callForwardRecentActivity error! mSelectedPhotoList ==null || mSelectedPhotoList.get(0) == null || !mSelectedPhotoList.get(0) instanceof AIOImageInfo");
  }
  
  public void t()
  {
    if (jdField_a_of_type_Boolean)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(2131370491);
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      int i1 = a();
      if (i1 == 1)
      {
        jdField_a_of_type_AndroidWidgetImageView.setEnabled(true);
        jdField_a_of_type_AndroidWidgetImageView.setClickable(true);
        jdField_b_of_type_AndroidWidgetImageView.setEnabled(true);
        jdField_b_of_type_AndroidWidgetImageView.setClickable(true);
        return;
      }
      if (i1 == 2)
      {
        if (jdField_a_of_type_JavaUtilArrayList.size() > 1)
        {
          jdField_a_of_type_AndroidWidgetImageView.setEnabled(false);
          jdField_a_of_type_AndroidWidgetImageView.setClickable(false);
          jdField_b_of_type_AndroidWidgetImageView.setEnabled(false);
          jdField_b_of_type_AndroidWidgetImageView.setClickable(false);
          return;
        }
        jdField_a_of_type_AndroidWidgetImageView.setEnabled(true);
        jdField_a_of_type_AndroidWidgetImageView.setClickable(true);
        jdField_b_of_type_AndroidWidgetImageView.setEnabled(false);
        jdField_b_of_type_AndroidWidgetImageView.setClickable(false);
        return;
      }
      jdField_a_of_type_AndroidWidgetImageView.setEnabled(false);
      jdField_a_of_type_AndroidWidgetImageView.setClickable(false);
      jdField_b_of_type_AndroidWidgetImageView.setEnabled(false);
      jdField_b_of_type_AndroidWidgetImageView.setClickable(false);
      return;
    }
    jdField_b_of_type_AndroidWidgetTextView.setText(2131370490);
    jdField_a_of_type_AndroidViewView.setVisibility(8);
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((GalleryImage)localIterator.next()).a(2);
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.notifyDataSetChanged();
  }
}
