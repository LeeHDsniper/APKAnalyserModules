package com.tencent.mobileqq.activity.activateFriend;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.AttributeSet;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.data.ActivateFriendItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import kox;
import koy;

public class ActivateFriendGrid
  extends FrameLayout
  implements FaceDecoder.DecodeTaskCompletionListener
{
  private static int jdField_a_of_type_Int = 15;
  private static Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private static int jdField_b_of_type_Int = 14;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new kox(this);
  private ActivateFriendGrid.GridCallBack jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack = null;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new koy(this);
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  private ArrayList jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  private Hashtable jdField_a_of_type_JavaUtilHashtable = new Hashtable();
  private boolean jdField_a_of_type_Boolean = true;
  private ArrayList jdField_b_of_type_JavaUtilArrayList = new ArrayList();
  private boolean jdField_b_of_type_Boolean = false;
  private int jdField_c_of_type_Int = 0;
  private boolean jdField_c_of_type_Boolean = true;
  private int d;
  private int e;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsBitmap = null;
  }
  
  public ActivateFriendGrid(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  private int a(int paramInt)
  {
    paramInt = 0;
    if (jdField_b_of_type_JavaUtilArrayList.size() > 0) {
      paramInt = ((ActivateFriendGridItem)jdField_b_of_type_JavaUtilArrayList.get(0)).getMeasuredHeight();
    }
    return paramInt * 2 + DisplayUtil.a(getContext(), jdField_a_of_type_Int) * 1;
  }
  
  private int a(int paramInt1, int paramInt2)
  {
    if (paramInt2 < 3) {
      return paramInt2;
    }
    if (paramInt1 < 3) {
      return 3;
    }
    return paramInt2 - 3;
  }
  
  private Bitmap a(String paramString)
  {
    Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, paramString);
    if (localBitmap != null) {
      return localBitmap;
    }
    if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(paramString, 1, true, (byte)0);
    }
    return jdField_a_of_type_AndroidGraphicsBitmap;
  }
  
  public ActivateFriendGridItem a()
  {
    ActivateFriendGridItem localActivateFriendGridItem = new ActivateFriendGridItem(getContext(), jdField_b_of_type_Boolean, jdField_c_of_type_Boolean);
    addView(localActivateFriendGridItem, new FrameLayout.LayoutParams(-2, -2));
    return localActivateFriendGridItem;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = null;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
    {
      if (paramBitmap != null) {
        jdField_a_of_type_JavaUtilHashtable.put(paramString, paramBitmap);
      }
      if (paramInt1 <= 0)
      {
        paramInt2 = jdField_b_of_type_JavaUtilArrayList.size();
        paramInt1 = 0;
        while (paramInt1 < paramInt2)
        {
          long l = jdField_a_of_type_JavaUtilArrayList.get(paramInt1)).uin;
          paramString = (Bitmap)jdField_a_of_type_JavaUtilHashtable.get(String.valueOf(l));
          if (paramString != null) {
            ((ActivateFriendGridItem)jdField_b_of_type_JavaUtilArrayList.get(paramInt1)).setHead(paramString);
          }
          paramInt1 += 1;
        }
        jdField_a_of_type_JavaUtilHashtable.clear();
      }
    }
  }
  
  public long[] a()
  {
    long[] arrayOfLong = new long[jdField_c_of_type_Int];
    int i = 0;
    int k;
    for (int j = 0; i < jdField_b_of_type_JavaUtilArrayList.size(); j = k)
    {
      k = j;
      if (jdField_b_of_type_JavaUtilArrayList.get(i)).jdField_a_of_type_Boolean)
      {
        arrayOfLong[j] = jdField_a_of_type_JavaUtilArrayList.get(i)).uin;
        k = j + 1;
      }
      i += 1;
    }
    return arrayOfLong;
  }
  
  public String[] a()
  {
    String[] arrayOfString = new String[jdField_c_of_type_Int];
    int i = 0;
    int j = 0;
    if (i < jdField_b_of_type_JavaUtilArrayList.size())
    {
      int k = j;
      int m;
      int n;
      int i1;
      if (jdField_b_of_type_JavaUtilArrayList.get(i)).jdField_a_of_type_Boolean)
      {
        long l = jdField_a_of_type_JavaUtilArrayList.get(i)).birthSendTime;
        Time localTime = new Time();
        localTime.set(l * 1000L);
        k = month;
        m = monthDay;
        localTime.setToNow();
        n = year;
        i1 = month;
        if ((k != 0) || (i1 != 11)) {
          break label177;
        }
        arrayOfString[j] = (n + 1 + "-" + (k + 1) + "-" + m);
      }
      for (;;)
      {
        k = j + 1;
        i += 1;
        j = k;
        break;
        label177:
        if ((k == 11) && (i1 == 0)) {
          arrayOfString[j] = (n - 1 + "-" + (k + 1) + "-" + m);
        } else {
          arrayOfString[j] = (n + "-" + (k + 1) + "-" + m);
        }
      }
    }
    return arrayOfString;
  }
  
  public long[] b()
  {
    long[] arrayOfLong = new long[jdField_c_of_type_Int];
    int i = 0;
    int k;
    for (int j = 0; i < jdField_b_of_type_JavaUtilArrayList.size(); j = k)
    {
      k = j;
      if (jdField_b_of_type_JavaUtilArrayList.get(i)).jdField_a_of_type_Boolean)
      {
        arrayOfLong[j] = jdField_a_of_type_JavaUtilArrayList.get(i)).birthSendTime;
        k = j + 1;
      }
      i += 1;
    }
    return arrayOfLong;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt1 = 0;
    int i = jdField_b_of_type_JavaUtilArrayList.size();
    label22:
    int n;
    ActivateFriendGridItem localActivateFriendGridItem;
    int j;
    int k;
    int m;
    if (i > 3)
    {
      paramInt2 = 2;
      paramInt3 = 0;
      if (paramInt3 >= i) {
        break label290;
      }
      n = a(paramInt3, i);
      localActivateFriendGridItem = (ActivateFriendGridItem)jdField_b_of_type_JavaUtilArrayList.get(paramInt3);
      j = localActivateFriendGridItem.getMeasuredHeight();
      k = localActivateFriendGridItem.getMeasuredWidth();
      paramInt4 = paramInt3 / 3;
      m = paramInt3 % 3;
      if (m != 0) {
        break label291;
      }
      paramInt1 = 0;
      if (jdField_b_of_type_JavaUtilArrayList.size() > 0) {
        paramInt1 = ((ActivateFriendGridItem)jdField_b_of_type_JavaUtilArrayList.get(0)).getMeasuredWidth();
      }
      if (paramInt1 * n + DisplayUtil.a(getContext(), jdField_b_of_type_Int) * (n - 1) <= d) {
        break label242;
      }
      paramInt1 = (d - paramInt1 * n) / (n + 2);
      jdField_b_of_type_Int = paramInt1;
    }
    label158:
    label242:
    label290:
    label291:
    for (;;)
    {
      if (paramInt2 > 1) {}
      for (paramInt4 = paramInt4 * j + paramInt4 * DisplayUtil.a(getContext(), jdField_a_of_type_Int);; paramInt4 = e / 2 - j / 2)
      {
        m = m * k + paramInt1 + m * DisplayUtil.a(getContext(), jdField_b_of_type_Int);
        localActivateFriendGridItem.layout(m, paramInt4, k + m, j + paramInt4);
        paramInt3 += 1;
        break label22;
        paramInt2 = 1;
        break;
        paramInt1 = (d - paramInt1 * n - (n - 1) * DisplayUtil.a(getContext(), jdField_b_of_type_Int)) / 2;
        break label158;
      }
      return;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    d = getMeasuredWidth();
    e = a(paramInt2);
    setMeasuredDimension(getMeasuredWidth(), e);
  }
  
  public void setCheckAbilityEnable(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void setData(QQAppInterface paramQQAppInterface, ArrayList paramArrayList)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
      jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
    paramQQAppInterface = jdField_b_of_type_JavaUtilArrayList.iterator();
    while (paramQQAppInterface.hasNext()) {
      removeView((ActivateFriendGridItem)paramQQAppInterface.next());
    }
    jdField_b_of_type_JavaUtilArrayList.clear();
    jdField_a_of_type_JavaUtilArrayList.addAll(paramArrayList);
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder == null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    paramQQAppInterface = (ActivateFriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(84);
    jdField_c_of_type_Int = 0;
    int j = jdField_a_of_type_JavaUtilArrayList.size();
    int i = 0;
    if (i < j)
    {
      paramArrayList = a();
      paramArrayList.setBirthday(jdField_a_of_type_JavaUtilArrayList.get(i)).birthdayDesc);
      String str = String.valueOf(jdField_a_of_type_JavaUtilArrayList.get(i)).uin);
      if (!TextUtils.isEmpty(jdField_a_of_type_JavaUtilArrayList.get(i)).nickName))
      {
        paramArrayList.setNickName(jdField_a_of_type_JavaUtilArrayList.get(i)).nickName);
        label233:
        paramArrayList.setHead(a(str));
        if (jdField_a_of_type_Boolean) {
          paramArrayList.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        }
        if (jdField_a_of_type_Boolean)
        {
          if (!getResources().getString(2131371051).equals(jdField_a_of_type_JavaUtilArrayList.get(i)).birthdayDesc)) {
            break label333;
          }
          paramArrayList.setChecked(false);
        }
      }
      for (;;)
      {
        jdField_b_of_type_JavaUtilArrayList.add(paramArrayList);
        i += 1;
        break;
        paramArrayList.setNickName(ContactUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str, true));
        break label233;
        label333:
        if (paramQQAppInterface.a(jdField_a_of_type_JavaUtilArrayList.get(i)).uin, jdField_a_of_type_JavaUtilArrayList.get(i)).type))
        {
          paramArrayList.setChecked(false);
        }
        else
        {
          jdField_c_of_type_Int += 1;
          paramArrayList.setChecked(true);
        }
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack != null) {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack.a(jdField_c_of_type_Int);
    }
  }
  
  public void setGridCallBack(ActivateFriendGrid.GridCallBack paramGridCallBack)
  {
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack = paramGridCallBack;
  }
  
  public void setSkinable(boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
  }
  
  public void setTextScrolling(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
}
