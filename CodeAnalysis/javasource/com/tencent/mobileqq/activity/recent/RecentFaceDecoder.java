package com.tencent.mobileqq.activity.recent;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.Pair;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil.PublicAccountConfigFolder;
import com.tencent.device.DeviceHeadMgr;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.recent.data.RecentCallItem;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;

public class RecentFaceDecoder
{
  public static final int a = 1000;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private FaceDecoder.DecodeTaskCompletionListener jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder$DecodeTaskCompletionListener;
  public FaceDecoder a;
  private boolean jdField_a_of_type_Boolean;
  private boolean b = false;
  private boolean c = false;
  
  public RecentFaceDecoder(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public RecentFaceDecoder(QQAppInterface paramQQAppInterface, FaceDecoder.DecodeTaskCompletionListener paramDecodeTaskCompletionListener)
  {
    this(paramQQAppInterface, paramDecodeTaskCompletionListener, false);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public RecentFaceDecoder(QQAppInterface paramQQAppInterface, FaceDecoder.DecodeTaskCompletionListener paramDecodeTaskCompletionListener, boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(BaseApplication.getContext(), paramQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramDecodeTaskCompletionListener);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder$DecodeTaskCompletionListener = paramDecodeTaskCompletionListener;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    b = paramBoolean;
  }
  
  private Drawable a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return null;
    case 1: 
      return ImageUtil.b();
    case 4: 
      return ImageUtil.c();
    case 101: 
    case 1001: 
      return ImageUtil.d();
    case 11: 
      return ImageUtil.b();
    case 102: 
      return ImageUtil.a(102);
    case 107: 
      return ImageUtil.a(107);
    case 103: 
      return ImageUtil.e();
    }
    return ImageUtil.b();
  }
  
  public static Pair a(QQAppInterface paramQQAppInterface, int paramInt, String paramString)
  {
    int k = Integer.MIN_VALUE;
    int m = 2130838458;
    int i = m;
    int j = k;
    switch (paramInt)
    {
    default: 
      i = Integer.MIN_VALUE;
      j = k;
    }
    for (;;)
    {
      return Pair.create(Integer.valueOf(j), Integer.valueOf(i));
      i = m;
      j = k;
      if (!String.valueOf(AppConstants.ap).equals(paramString))
      {
        i = m;
        j = k;
        if (!String.valueOf(AppConstants.ar).equals(paramString)) {
          if (String.valueOf(AppConstants.af).equals(paramString))
          {
            i = 2130838461;
            j = k;
          }
          else if (AppConstants.an.equals(paramString))
          {
            i = 2130838511;
            j = k;
          }
          else if (AppConstants.aX.equals(paramString))
          {
            j = 110;
            i = Integer.MIN_VALUE;
          }
          else
          {
            j = 1;
            i = Integer.MIN_VALUE;
            continue;
            if (String.valueOf(AppConstants.aq).equals(paramString))
            {
              i = 2130838452;
              j = k;
            }
            else if (String.valueOf(AppConstants.aG).equals(paramString))
            {
              i = 2130840366;
              j = k;
            }
            else
            {
              j = 32;
              i = Integer.MIN_VALUE;
              continue;
              j = 102;
              i = 2130839766;
              continue;
              j = 107;
              i = 2130839764;
              continue;
              i = Integer.MIN_VALUE;
              j = 104;
              continue;
              j = 11;
              i = Integer.MIN_VALUE;
              continue;
              j = 101;
              i = Integer.MIN_VALUE;
              continue;
              j = 1001;
              i = Integer.MIN_VALUE;
              continue;
              HotChatManager localHotChatManager = paramQQAppInterface.a(false);
              if ((localHotChatManager != null) && (localHotChatManager.b(paramString)))
              {
                i = HotChatManager.a(paramString, paramQQAppInterface);
                j = k;
              }
              else
              {
                j = 4;
                i = Integer.MIN_VALUE;
                continue;
                i = 2130838451;
                j = k;
                continue;
                i = 2130840205;
                j = k;
                continue;
                i = 2130838459;
                j = k;
                continue;
                if (AppConstants.ag.equals(paramString))
                {
                  i = 2130838457;
                  j = k;
                }
                else
                {
                  j = 103;
                  i = Integer.MIN_VALUE;
                  continue;
                  i = 2130838455;
                  j = k;
                  continue;
                  i = 2130838310;
                  j = 104;
                  continue;
                  i = 2130841282;
                  j = k;
                  continue;
                  j = 108;
                  i = Integer.MIN_VALUE;
                  continue;
                  j = 105;
                  i = Integer.MIN_VALUE;
                  continue;
                  j = 106;
                  i = 2130841072;
                  continue;
                  i = 2130838456;
                  j = k;
                  continue;
                  i = 2130838342;
                  j = k;
                  continue;
                  i = 2130840997;
                  j = k;
                }
              }
            }
          }
        }
      }
    }
  }
  
  public Drawable a(int paramInt, String paramString)
  {
    return a(paramInt, paramString, true);
  }
  
  public Drawable a(int paramInt, String paramString, boolean paramBoolean)
  {
    Pair localPair = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramInt, paramString);
    paramInt = ((Integer)first).intValue();
    int i = ((Integer)second).intValue();
    if (i == Integer.MAX_VALUE) {}
    try
    {
      return a(paramInt, paramString);
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
    if (paramInt != Integer.MIN_VALUE) {
      return a(paramString, paramInt);
    }
    if ((i != Integer.MIN_VALUE) && (paramBoolean))
    {
      paramString = BaseApplication.getContext().getResources().getDrawable(i);
      return paramString;
    }
    return null;
  }
  
  public Drawable a(RecentBaseData paramRecentBaseData)
  {
    int i = paramRecentBaseData.a();
    if (paramRecentBaseData.a() == 8)
    {
      i = N;
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, "getFaceDrawable type = " + i);
      }
      if (i != 0) {
        if (i == 25)
        {
          localObject = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
          if (localObject == null) {
            break label224;
          }
        }
      }
    }
    label224:
    for (Object localObject = ((PhoneContactManager)localObject).c(h);; localObject = null)
    {
      if (localObject != null) {}
      for (paramRecentBaseData = ((BitmapDrawable)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(h, (byte)3)).getBitmap(); paramRecentBaseData == null; paramRecentBaseData = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(16, paramRecentBaseData.a(), (byte)3, true, 16)) {
        return ImageUtil.b();
      }
      return new BitmapDrawable(paramRecentBaseData);
      paramRecentBaseData = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramRecentBaseData.a(), (byte)3, true);
      if (paramRecentBaseData == null) {
        return ImageUtil.b();
      }
      return new BitmapDrawable(paramRecentBaseData);
      return a(i, paramRecentBaseData.a());
      if (((paramRecentBaseData instanceof RecentCallItem)) && (((RecentCallItem)paramRecentBaseData).b())) {
        i = 3002;
      }
      for (;;)
      {
        return a(i, paramRecentBaseData.a());
      }
    }
  }
  
  public Drawable a(String paramString, int paramInt)
  {
    if (paramInt == 104) {
      return DeviceHeadMgr.a().a(paramString);
    }
    if (paramInt == 105)
    {
      paramString = PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplication.getContext(), 1);
      if ((paramString != null) && (paramString.a() != null)) {
        return paramString.a();
      }
      return PublicAccountConfigUtil.a(BaseApplication.getContext(), 1);
    }
    if (paramInt == 106) {
      return EcShopAssistantManager.a(BaseApplication.getContext());
    }
    if (paramInt == 108) {
      return ((BlessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(137)).a();
    }
    if (paramInt == 110)
    {
      paramString = PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplication.getContext(), 2);
      if ((paramString != null) && (paramString.a() != null)) {
        return paramString.a();
      }
      return PublicAccountConfigUtil.a(BaseApplication.getContext(), 2);
    }
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt, paramString, false, 0);
      return null;
    }
    if ((b) && (!c)) {
      return a(paramInt);
    }
    if (paramInt == 103) {}
    for (int i = 1;; i = paramInt)
    {
      Bitmap localBitmap;
      if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
        if (paramInt == 32) {
          localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(i, paramString, 200);
        }
      }
      for (;;)
      {
        if ((QLog.isDevelopLevel()) && (paramInt == 101)) {
          QLog.i("Q.recent", 4, "requestDecodeFace| [" + paramString + "," + paramInt + "," + localBitmap + "], isPausing=" + jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b());
        }
        if (localBitmap == null)
        {
          if ((jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) && (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()))
          {
            if (i != 32) {
              break label347;
            }
            jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramString, 200, true, false);
          }
          for (;;)
          {
            return a(paramInt);
            localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(i, paramString);
            break;
            label347:
            jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramString, i, true, (byte)0);
          }
        }
        if (paramInt == 103)
        {
          paramString = BaseApplication.getContext().getResources().getDrawable(2130838447);
          if ((paramString instanceof SkinnableBitmapDrawable)) {
            ((SkinnableBitmapDrawable)paramString).setGravity(81);
          }
          if ((paramString instanceof BitmapDrawable)) {
            ((BitmapDrawable)paramString).setGravity(81);
          }
          paramString.setBounds(0, 0, paramString.getIntrinsicWidth(), paramString.getIntrinsicHeight());
          return new LayerDrawable(new Drawable[] { new BitmapDrawable(BaseApplication.getContext().getResources(), localBitmap), paramString });
        }
        return new BitmapDrawable(BaseApplication.getContext().getResources(), localBitmap);
        localBitmap = null;
      }
    }
  }
  
  public URLDrawable a(int paramInt, String paramString)
  {
    switch (paramInt)
    {
    default: 
      return null;
    }
    paramString = ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(paramString);
    Drawable localDrawable = ImageUtil.c();
    return URLDrawable.getDrawable(iconUrl, localDrawable, localDrawable);
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = null;
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder$DecodeTaskCompletionListener = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder$DecodeTaskCompletionListener);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public void b()
  {
    c = true;
  }
}
