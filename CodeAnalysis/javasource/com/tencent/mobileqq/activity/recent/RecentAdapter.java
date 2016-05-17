package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextUtils;
import android.util.Pair;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.RecentItemEcShop;
import com.tencent.biz.pubaccount.subscript.SubscriptRecommendController;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.IDragViewProvider;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.activity.recent.cur.DragTextView;
import com.tencent.mobileqq.activity.recent.data.RecentCallItem;
import com.tencent.mobileqq.activity.recent.data.RecentItemEcShopAssitant;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopBarAssitant;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentMsgBoxItem;
import com.tencent.mobileqq.activity.recent.data.RecentPubAccountAssistantItem;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloBoxItem;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloListItem;
import com.tencent.mobileqq.activity.recent.data.RecentTroopAssistantItem;
import com.tencent.mobileqq.activity.recent.data.RecentUserBaseData;
import com.tencent.mobileqq.activity.recent.data.SendBlessRecentItemData;
import com.tencent.mobileqq.app.FrameHelperActivity;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.QCallCardInfo;
import com.tencent.mobileqq.qcall.QCallCardManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;
import com.tencent.widget.BubblePopupWindow;
import com.tencent.widget.FixSizeImageView;
import com.tencent.widget.SwipListView;
import com.tencent.widget.SwipListView.SwipListListener;
import com.tencent.widget.XListView;
import cooperation.huangye.HYEntranceManager;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import mgb;
import mgc;
import mgd;
import org.json.JSONObject;

public class RecentAdapter
  extends BaseAdapter
  implements View.OnClickListener, View.OnLongClickListener, DragFrameLayout.IDragViewProvider, DragFrameLayout.OnDragModeChangedListener, FaceDecoder.DecodeTaskCompletionListener, SwipListView.SwipListListener
{
  protected static final int a = 1;
  public static final int b = 99;
  private long jdField_a_of_type_Long = 0L;
  protected Context a;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new mgd(this);
  private OnRecentUserOpsListener jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = null;
  protected RecentBaseData a;
  protected RecentFaceDecoder a;
  protected RecentItemBuilderFactory a;
  protected DragFrameLayout a;
  public QQAppInterface a;
  protected BubblePopupWindow a;
  protected XListView a;
  private Hashtable jdField_a_of_type_JavaUtilHashtable = new Hashtable();
  protected List a;
  protected List b;
  public int c = -1;
  private int d;
  private int e;
  
  public RecentAdapter(Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, OnRecentUserOpsListener paramOnRecentUserOpsListener, int paramInt)
  {
    this(paramContext, paramQQAppInterface, paramXListView, paramOnRecentUserOpsListener, paramInt, false);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public RecentAdapter(Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, OnRecentUserOpsListener paramOnRecentUserOpsListener, int paramInt, boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentWidgetXListView = null;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentWidgetXListView = paramXListView;
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = paramOnRecentUserOpsListener;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_JavaUtilList = new ArrayList(99);
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory = new RecentItemBuilderFactory(paramInt);
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(this);
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder = new RecentFaceDecoder(paramQQAppInterface, this, paramBoolean);
    if (paramInt == 0) {
      d = 0;
    }
    for (;;)
    {
      e = paramInt;
      return;
      if (paramInt == 1) {
        d = 5;
      } else if (paramInt == 4) {
        d = 7;
      } else if (paramInt == 9) {
        d = 11;
      }
    }
  }
  
  private void b(int paramInt)
  {
    if (4 == jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a())
    {
      if (paramInt == 1) {
        break label118;
      }
      if ((HYEntranceManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) && (!jdField_a_of_type_JavaUtilList.contains(RecentItemBuilderFactory.d))) {
        jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.d);
      }
      if (!jdField_a_of_type_JavaUtilList.contains(RecentItemBuilderFactory.b)) {
        jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.b);
      }
      if (!jdField_a_of_type_JavaUtilList.contains(RecentItemBuilderFactory.e)) {
        jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.e);
      }
    }
    for (;;)
    {
      notifyDataSetChanged();
      return;
      label118:
      if (!jdField_a_of_type_JavaUtilList.contains(RecentItemBuilderFactory.f)) {
        jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.f);
      }
    }
  }
  
  private void f()
  {
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() == 1))
    {
      Object localObject = jdField_a_of_type_JavaUtilList.get(0);
      if ((localObject != null) && (localObject.equals(RecentItemBuilderFactory.a))) {
        jdField_a_of_type_JavaUtilList.remove(localObject);
      }
    }
  }
  
  public int a()
  {
    return e;
  }
  
  public RecentBaseData a(View paramView)
  {
    if ((paramView != null) && ((paramView.getTag(-1) instanceof Integer)))
    {
      paramView = getItem(((Integer)paramView.getTag(-1)).intValue());
      if ((paramView instanceof RecentBaseData)) {
        return (RecentBaseData)paramView;
      }
    }
    return null;
  }
  
  public DragFrameLayout a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout;
  }
  
  public List a()
  {
    if ((b != null) && (b.size() > 0)) {
      return b;
    }
    return null;
  }
  
  public void a()
  {
    try
    {
      PstnManager localPstnManager = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
      if (localPstnManager != null)
      {
        b(localPstnManager.a());
        return;
      }
      if (QLog.isColorLevel())
      {
        QLog.d("RecentAdapter", 2, "refreshHeaderView|PstnManager is null..");
        return;
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      if (QLog.isColorLevel())
      {
        QLog.d("RecentAdapter", 2, "refreshHeaderView|NUllPointerException." + localNullPointerException.getMessage());
        return;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RecentAdapter", 2, "refreshHeaderView|Exception." + localException.getMessage());
      }
    }
  }
  
  public void a(int paramInt)
  {
    d = paramInt;
    if (QLog.isColorLevel()) {
      QLog.d("Q.recent", 2, "setExtraFlag:" + paramInt);
    }
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((jdField_a_of_type_ComTencentWidgetXListView == null) || (TextUtils.isEmpty(paramString))) {
      break label14;
    }
    label14:
    while ((paramBitmap == null) && (paramInt1 > 0)) {
      return;
    }
    if (paramBitmap != null) {
      jdField_a_of_type_JavaUtilHashtable.put(paramInt2 + ":" + paramString, paramBitmap);
    }
    long l = System.currentTimeMillis();
    boolean bool1;
    label93:
    Object localObject1;
    if ((jdField_a_of_type_Long > 0L) && (l - jdField_a_of_type_Long > 300L))
    {
      bool1 = true;
      if (QLog.isColorLevel())
      {
        localObject1 = new StringBuilder().append("RecentAdapter.onDecodeTaskCompleted type=").append(paramInt2).append(", uin=").append(paramString).append(", remainingTasks=").append(paramInt1).append(", isdecodeFaceTimeout=").append(bool1).append(", avatar == null ? | ");
        if (paramBitmap != null) {
          break label233;
        }
      }
    }
    label233:
    for (boolean bool2 = true;; bool2 = false)
    {
      QLog.d("RecentAdapter", 2, bool2 + ",style | " + e);
      if ((paramInt1 > 0) && (!bool1)) {
        break;
      }
      synchronized (jdField_a_of_type_JavaUtilHashtable)
      {
        if (jdField_a_of_type_JavaUtilHashtable.size() != 0) {
          break label239;
        }
        return;
      }
      bool1 = false;
      break label93;
    }
    label239:
    if (paramInt1 == 0) {}
    View localView;
    RecentBaseData localRecentBaseData;
    for (jdField_a_of_type_Long = 0L;; jdField_a_of_type_Long = l)
    {
      bool1 = false;
      int k = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
      paramInt1 = 0;
      if (paramInt1 >= k) {
        break label804;
      }
      localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(paramInt1);
      localRecentBaseData = a(localView);
      if (localRecentBaseData != null) {
        break;
      }
      break label864;
    }
    int j = localRecentBaseData.a();
    int i = j;
    if (a() == 4)
    {
      if (QLog.isColorLevel()) {
        QLog.i("RecentAdapter", 2, "====RecentAdapter onDecodeTaskCompleted === type: " + paramInt2 + ",uin: " + paramString + ",recentUserType: " + j);
      }
    }
    else
    {
      label378:
      i = ((Integer)ajdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i, localRecentBaseData.a()).first).intValue();
      if (i != Integer.MIN_VALUE)
      {
        if ((localRecentBaseData instanceof RecentSayHelloBoxItem))
        {
          paramBitmap = jdField_a_of_type_JavaUtilList;
          if ((paramBitmap == null) || (paramBitmap.size() <= 0)) {
            break label899;
          }
          paramBitmap = new LinkedList(paramBitmap).iterator();
          while (paramBitmap.hasNext())
          {
            localObject1 = (MessageRecord)paramBitmap.next();
            Object localObject2 = i + ":" + senderuin;
            localObject2 = (Bitmap)jdField_a_of_type_JavaUtilHashtable.get(localObject2);
            if (localObject2 != null) {
              a(localView, localRecentBaseData, (MessageRecord)localObject1, new BitmapDrawable(BaseApplication.getContext().getResources(), (Bitmap)localObject2));
            }
          }
        }
        paramBitmap = i + ":" + localRecentBaseData.a();
        paramBitmap = (Bitmap)jdField_a_of_type_JavaUtilHashtable.get(paramBitmap);
        if (paramBitmap != null)
        {
          if (i == 103)
          {
            l = System.currentTimeMillis();
            localObject1 = BaseApplication.getContext().getResources().getDrawable(2130838447);
            if ((localObject1 instanceof SkinnableBitmapDrawable)) {
              ((SkinnableBitmapDrawable)localObject1).setGravity(81);
            }
            if ((localObject1 instanceof BitmapDrawable)) {
              ((BitmapDrawable)localObject1).setGravity(81);
            }
            ((Drawable)localObject1).setBounds(0, 0, ((Drawable)localObject1).getIntrinsicWidth(), ((Drawable)localObject1).getIntrinsicHeight());
            localObject1 = new LayerDrawable(new Drawable[] { new BitmapDrawable(BaseApplication.getContext().getResources(), paramBitmap), localObject1 });
            paramBitmap = (Bitmap)localObject1;
            if (QLog.isDevelopLevel()) {
              QLog.i("Q.recent", 4, "onDecodeTaskCompleted, subaccount cost = " + (System.currentTimeMillis() - l));
            }
          }
          for (paramBitmap = (Bitmap)localObject1;; paramBitmap = new BitmapDrawable(BaseApplication.getContext().getResources(), paramBitmap))
          {
            a(localView, localRecentBaseData, paramBitmap);
            bool1 = true;
            break;
          }
          label804:
          if (QLog.isDevelopLevel()) {
            QLog.i("Q.recent", 4, "decodecomplete|faceCache size = " + jdField_a_of_type_JavaUtilHashtable.size() + ", isNeedUpdateAvatar=" + bool1);
          }
          jdField_a_of_type_JavaUtilHashtable.clear();
          return;
        }
      }
    }
    label864:
    label899:
    for (;;)
    {
      paramInt1 += 1;
      break;
      if (paramInt2 == 1001)
      {
        i = 3002;
        break label378;
      }
      i = j;
      if (paramInt2 != 101) {
        break label378;
      }
    }
  }
  
  public void a(View paramView)
  {
    if (paramView != null)
    {
      paramView = paramView.getTag(-1);
      if (!(paramView instanceof Integer)) {}
    }
    for (int i = ((Integer)paramView).intValue();; i = -1)
    {
      c = i;
      return;
    }
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData)
  {
    a(paramView, paramRecentBaseData, null);
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramRecentBaseData == null)) {
      return;
    }
    Drawable localDrawable = paramDrawable;
    int i;
    if (paramDrawable == null)
    {
      i = paramRecentBaseData.a();
      if ((!(paramRecentBaseData instanceof RecentCallItem)) || (!((RecentCallItem)paramRecentBaseData).b())) {
        break label85;
      }
      i = 3002;
    }
    label85:
    for (;;)
    {
      localDrawable = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a(i, paramRecentBaseData.a());
      paramDrawable = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(paramRecentBaseData);
      if (paramDrawable == null) {
        break;
      }
      paramDrawable.a(paramView, paramRecentBaseData, jdField_a_of_type_AndroidContentContext, localDrawable);
      return;
    }
  }
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, MessageRecord paramMessageRecord, Drawable paramDrawable)
  {
    if ((paramView == null) || (paramMessageRecord == null)) {}
    Drawable localDrawable;
    do
    {
      return;
      if (QLog.isDevelopLevel()) {
        QLog.d("Q.recent", 4, "updateSayHelloBoxItem|uin:" + senderuin);
      }
      localDrawable = paramDrawable;
      if (paramDrawable == null) {
        localDrawable = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a(istroop, senderuin);
      }
      paramDrawable = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(paramRecentBaseData);
    } while ((paramDrawable == null) || (!(paramDrawable instanceof SayHelloBoxItemBuilder)));
    ((SayHelloBoxItemBuilder)paramDrawable).a(paramView, paramRecentBaseData, paramMessageRecord, localDrawable);
  }
  
  public void a(RecentBaseData paramRecentBaseData)
  {
    if ((jdField_a_of_type_ComTencentWidgetXListView == null) || (paramRecentBaseData == null)) {
      return;
    }
    int j = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    int i = 0;
    label22:
    View localView;
    RecentBaseData localRecentBaseData;
    if (i < j)
    {
      localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(i);
      localRecentBaseData = a(localView);
      if (localRecentBaseData != null) {
        break label57;
      }
    }
    label57:
    while (!localRecentBaseData.equals(paramRecentBaseData))
    {
      i += 1;
      break label22;
      break;
    }
    a(localView, localRecentBaseData);
  }
  
  public void a(RecentBaseData paramRecentBaseData, String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener.a(paramRecentBaseData, paramString);
    }
    if (jdField_a_of_type_JavaUtilList != null)
    {
      jdField_a_of_type_JavaUtilList.remove(paramRecentBaseData);
      f();
      notifyDataSetChanged();
    }
  }
  
  public void a(RecentBaseData paramRecentBaseData, String paramString1, String paramString2)
  {
    if (Utils.a(paramString1, jdField_a_of_type_AndroidContentContext.getResources().getString(RecentItemBaseBuilder.a[0])))
    {
      a(paramRecentBaseData, paramString2);
      switch (paramRecentBaseData.a())
      {
      default: 
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "999", paramString2, "", "");
      }
    }
    while (jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener == null)
    {
      do
      {
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "0", "", paramString2, "");
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "1", "", paramString2, "");
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "2", "", paramString2, "");
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "3", "", paramString2, "");
      } while (!(paramRecentBaseData instanceof RecentItemEcShop));
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Shop_DelMsghelper", "Clk_DelshopItem", 0, 0, paramRecentBaseData.a(), "", a, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "4", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "5", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "6", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "7", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "8", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004142", "0X8004142", 0, 0, "9", "", paramString2, "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80050FC", "0X80050FC", 0, 0, "", "", "", "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80050FE", "0X80050FE", 0, 0, "", "", "", "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006353", "0X8006353", 0, 0, "", "", "", "");
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener.a(paramString1, paramRecentBaseData, paramString2);
  }
  
  public void a(DragFrameLayout paramDragFrameLayout)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout = paramDragFrameLayout;
    jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.a(this, true);
    jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.setDragViewProvider(this);
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a(paramQQAppInterface);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != paramQQAppInterface)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
      b(null);
      b = null;
    }
  }
  
  public void a(RecentUser paramRecentUser, StringBuilder paramStringBuilder1, StringBuilder paramStringBuilder2, StringBuilder paramStringBuilder3)
  {
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uin, 1008);
    Object localObject1;
    if (localObject2 != null)
    {
      localObject1 = ((MessageRecord)localObject2).getExtInfoFromExtStr("gdt_msgClick");
      if (!TextUtils.isEmpty((CharSequence)localObject1))
      {
        str = "0";
        localObject2 = ((MessageRecord)localObject2).getExtInfoFromExtStr("pa_msgId");
        paramStringBuilder1.append((String)localObject2 + ",");
      }
    }
    try
    {
      localObject1 = new JSONObject((String)localObject1);
      paramStringBuilder1 = str;
      if (((JSONObject)localObject1).has("ad_id")) {
        paramStringBuilder1 = ((JSONObject)localObject1).getString("ad_id");
      }
    }
    catch (Exception paramStringBuilder1)
    {
      for (;;)
      {
        paramStringBuilder1 = str;
        if (QLog.isColorLevel())
        {
          QLog.i("Q.recent", 2, " parse ad_id error");
          paramStringBuilder1 = str;
        }
      }
    }
    paramStringBuilder2.append(paramStringBuilder1 + ",");
    paramStringBuilder3.append(uin + ",");
  }
  
  public void a(String paramString, int paramInt)
  {
    if ((jdField_a_of_type_ComTencentWidgetXListView == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    int j = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    int i = 0;
    label26:
    View localView;
    RecentBaseData localRecentBaseData;
    if (i < j)
    {
      localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(i);
      localRecentBaseData = a(localView);
      if ((localRecentBaseData != null) && (localRecentBaseData.a() == paramInt)) {
        break label71;
      }
    }
    label71:
    while (!Utils.a(localRecentBaseData.a(), paramString))
    {
      i += 1;
      break label26;
      break;
    }
    a(localView, localRecentBaseData);
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    if ((jdField_a_of_type_ComTencentWidgetXListView == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    int j = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    int i = 1;
    label26:
    View localView;
    RecentBaseData localRecentBaseData;
    if (i < j)
    {
      localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(i);
      localRecentBaseData = a(localView);
      if ((localRecentBaseData != null) && (Utils.a(paramString, localRecentBaseData.a()))) {
        break label74;
      }
    }
    label74:
    int k;
    do
    {
      i += 1;
      break label26;
      break;
      k = localRecentBaseData.a();
      if ((paramBoolean) && (k == 1))
      {
        a(localView, localRecentBaseData);
        return;
      }
    } while ((paramBoolean) || ((k != 0) && (k != 1000) && (k != 1020) && (k != 1003) && (k != 1025) && (k != 1005) && (k != 1004) && (k != 1008) && (k != 1001) && (k != 1009) && (k != 1023) && (k != 1024) && (k != 7000) && (k != 7100) && (k != 1010)));
    a(localView, localRecentBaseData);
  }
  
  public void a(List paramList)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("Q.recent", 4, "setRecommendFriendList list: " + paramList);
    }
    if (b == null) {
      b = new ArrayList(4);
    }
    b.clear();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      Object localObject = paramList.next();
      b.add(localObject);
    }
    notifyDataSetChanged();
  }
  
  public void a(boolean paramBoolean, int paramInt, DragFrameLayout paramDragFrameLayout)
  {
    Object localObject1;
    MessageHandler localMessageHandler;
    StringBuilder localStringBuilder;
    Object localObject3;
    Object localObject2;
    RecentUser localRecentUser;
    if (paramBoolean)
    {
      if (paramInt != 2) {
        break label601;
      }
      paramDragFrameLayout = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
      if ((paramDragFrameLayout != null) && (a))
      {
        a = false;
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        paramDragFrameLayout = (DragFrameLayout)localObject1;
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          paramDragFrameLayout = "noLogin";
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences("ecshop_sp" + paramDragFrameLayout, 0).edit().putBoolean("folder_reddot", false).commit();
      }
      localMessageHandler = (MessageHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0);
      if (localMessageHandler != null) {
        localMessageHandler.e(false);
      }
      paramDragFrameLayout = null;
      localObject1 = null;
      localStringBuilder = null;
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      if (localIterator.hasNext())
      {
        localObject3 = localIterator.next();
        if ((!(localObject3 instanceof RecentBaseData)) || (!(localObject3 instanceof RecentUserBaseData))) {
          break label1359;
        }
        localObject2 = (RecentUserBaseData)localObject3;
        if (H <= 0) {
          break label1359;
        }
        ((RecentUserBaseData)localObject2).c();
        localRecentUser = ((RecentUserBaseData)localObject2).a();
        if (type != 1008) {
          break label1346;
        }
        if (paramDragFrameLayout != null) {
          break label1333;
        }
        localObject1 = new StringBuilder();
        paramDragFrameLayout = new StringBuilder();
        localStringBuilder = new StringBuilder();
        label259:
        a(localRecentUser, (StringBuilder)localObject1, paramDragFrameLayout, localStringBuilder);
        label270:
        if ((localObject3 instanceof RecentItemTroopMsgData))
        {
          paramInt = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(uin);
          if ((paramInt == 2) || (paramInt == 4)) {
            RecentUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localRecentUser, true);
          }
        }
      }
    }
    for (;;)
    {
      localObject2 = localObject1;
      localObject1 = paramDragFrameLayout;
      paramDragFrameLayout = (DragFrameLayout)localObject2;
      break;
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      if (localMessageHandler == null) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        RecentUtil.a((QQAppInterface)localObject2, localRecentUser, paramBoolean);
        break;
      }
      if ((localObject3 instanceof RecentItemTroopBarAssitant))
      {
        TroopBarAssistantManager.a().k(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        SubscriptRecommendController.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        if (localMessageHandler == null) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          RecentUtil.a((QQAppInterface)localObject2, localRecentUser, paramBoolean);
          break;
        }
      }
      if ((localObject3 instanceof SendBlessRecentItemData))
      {
        ((BlessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(137)).b(true);
      }
      else
      {
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        if (localMessageHandler == null) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          RecentUtil.a((QQAppInterface)localObject2, localRecentUser, paramBoolean);
          break;
        }
        if (e == 0)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800419D", "0X800419D", 0, 0, "", "", "", "");
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80041A0", "0X80041A0", 0, 0, "", "", "", "");
          if (!TextUtils.isEmpty(paramDragFrameLayout)) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", String.valueOf(localStringBuilder), "0X8005C37", "0X8005C37", 0, 1, 0, String.valueOf(paramDragFrameLayout), String.valueOf(NetConnInfoCenter.getServerTime() * 1000L), "", String.valueOf(localObject1));
          }
        }
        label601:
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              return;
                              paramDragFrameLayout = paramDragFrameLayout.a();
                            } while (paramDragFrameLayout == null);
                            paramDragFrameLayout = (Integer)paramDragFrameLayout.getTag();
                          } while (paramDragFrameLayout == null);
                          paramDragFrameLayout = getItem(paramDragFrameLayout.intValue());
                          if (QLog.isColorLevel()) {
                            QLog.d("Drag", 2, "onChange:" + paramDragFrameLayout);
                          }
                        } while (!(paramDragFrameLayout instanceof RecentBaseData));
                        if ((paramDragFrameLayout instanceof RecentItemTroopBarAssitant))
                        {
                          paramDragFrameLayout = (RecentItemTroopBarAssitant)paramDragFrameLayout;
                          paramDragFrameLayout.c();
                          TroopBarAssistantManager.a().k(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
                          return;
                        }
                        if (!(paramDragFrameLayout instanceof RecentItemEcShopAssitant)) {
                          break;
                        }
                        paramDragFrameLayout = (RecentItemEcShopAssitant)paramDragFrameLayout;
                        paramDragFrameLayout.c();
                        RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
                        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
                        paramDragFrameLayout = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramDragFrameLayout.a(), 1008);
                      } while (paramDragFrameLayout == null);
                      localObject1 = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
                    } while (localObject1 == null);
                    ((EcShopAssistantManager)localObject1).a(time);
                    return;
                    if (!(paramDragFrameLayout instanceof RecentUserBaseData)) {
                      break;
                    }
                    localObject1 = (RecentUserBaseData)paramDragFrameLayout;
                    ((RecentUserBaseData)localObject1).c();
                    localObject1 = ((RecentUserBaseData)localObject1).a();
                    RecentUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (RecentUser)localObject1, true);
                    if (e == 0) {
                      RecentUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (RecentUser)localObject1);
                    }
                  } while (!(paramDragFrameLayout instanceof SendBlessRecentItemData));
                  ((BlessManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(137)).b(true);
                  return;
                  if (!(paramDragFrameLayout instanceof RecentTroopAssistantItem)) {
                    break;
                  }
                  paramDragFrameLayout = (RecentTroopAssistantItem)paramDragFrameLayout;
                  paramDragFrameLayout.c();
                  RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
                  paramDragFrameLayout = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramDragFrameLayout.a(), 1);
                } while (paramDragFrameLayout == null);
                TroopAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, time);
                return;
                if (!(paramDragFrameLayout instanceof RecentItemEcShop)) {
                  break;
                }
                paramDragFrameLayout = (RecentItemEcShop)paramDragFrameLayout;
                paramDragFrameLayout.c();
                RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
                paramDragFrameLayout = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramDragFrameLayout.a(), 1008);
              } while (paramDragFrameLayout == null);
              localObject1 = (EcShopAssistantManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(87);
            } while (localObject1 == null);
            ((EcShopAssistantManager)localObject1).a(time);
            return;
            if (!(paramDragFrameLayout instanceof RecentPubAccountAssistantItem)) {
              break;
            }
            paramDragFrameLayout = (RecentPubAccountAssistantItem)paramDragFrameLayout;
            paramDragFrameLayout.c();
            RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
            paramDragFrameLayout = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramDragFrameLayout.a(), paramDragFrameLayout.a());
          } while (paramDragFrameLayout == null);
          PubAccountAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, time);
          return;
          if ((paramDragFrameLayout instanceof RecentMsgBoxItem))
          {
            paramDragFrameLayout = (RecentMsgBoxItem)paramDragFrameLayout;
            paramDragFrameLayout.c();
            if (MsgProxyUtils.c(paramDragFrameLayout.a()))
            {
              ThreadManager.a(new mgc(this, paramDragFrameLayout.a(), paramDragFrameLayout.a()), 8, null, false);
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005298", "0X8005298", 0, 0, "", "", "", "");
              return;
            }
            RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
            return;
          }
        } while (!(paramDragFrameLayout instanceof RecentSayHelloListItem));
        paramDragFrameLayout = (RecentSayHelloListItem)paramDragFrameLayout;
        paramDragFrameLayout.c();
        RecentUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramDragFrameLayout.a(), paramDragFrameLayout.a());
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramDragFrameLayout.a(), paramDragFrameLayout.a());
        return;
        label1333:
        localObject2 = paramDragFrameLayout;
        paramDragFrameLayout = (DragFrameLayout)localObject1;
        localObject1 = localObject2;
        break label259;
        label1346:
        localObject2 = paramDragFrameLayout;
        paramDragFrameLayout = (DragFrameLayout)localObject1;
        localObject1 = localObject2;
        break label270;
        label1359:
        localObject2 = paramDragFrameLayout;
        paramDragFrameLayout = (DragFrameLayout)localObject1;
        localObject1 = localObject2;
      }
    }
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentWidgetXListView instanceof SwipListView);
  }
  
  public List b()
  {
    ArrayList localArrayList = new ArrayList();
    int j = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    int i = 0;
    while (i < j)
    {
      View localView = jdField_a_of_type_ComTencentWidgetXListView.getChildAt(i);
      if (localView != null)
      {
        localView = localView.findViewById(2131301975);
        if ((localView != null) && ((localView instanceof DragTextView)))
        {
          DragTextView localDragTextView = (DragTextView)localView;
          if ((localView.getVisibility() == 0) && (localDragTextView.a() != -1)) {
            localArrayList.add(localView);
          }
        }
      }
      i += 1;
    }
    return localArrayList;
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public void b(RecentBaseData paramRecentBaseData)
  {
    if ((paramRecentBaseData != null) && (paramRecentBaseData.a() == 8) && (N == 25))
    {
      localObject = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
      if (localObject == null) {
        break label97;
      }
    }
    label97:
    for (Object localObject = ((PhoneContactManager)localObject).c(h);; localObject = null)
    {
      if (localObject != null) {
        a = name;
      }
      do
      {
        return;
        localObject = ((QCallCardManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(139)).a(paramRecentBaseData.a());
      } while (localObject == null);
      a = nickname;
      return;
    }
  }
  
  public void b(List paramList)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) {
      return;
    }
    d();
    Object localObject3;
    if ((jdField_a_of_type_ComTencentWidgetXListView instanceof SwipListView))
    {
      localObject3 = (SwipListView)jdField_a_of_type_ComTencentWidgetXListView;
      localObject1 = localObject2;
      if (c >= 0)
      {
        localObject1 = localObject2;
        if (c < jdField_a_of_type_JavaUtilList.size()) {
          localObject1 = jdField_a_of_type_JavaUtilList.get(c);
        }
      }
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent", 4, "setDataList findsel, [" + c + "," + localObject1 + "]");
      }
      c = -1;
    }
    for (localObject2 = localObject3;; localObject2 = null)
    {
      jdField_a_of_type_JavaUtilList.clear();
      int k = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a();
      localObject3 = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
      if (localObject3 != null) {}
      for (int i = ((PstnManager)localObject3).a();; i = 0)
      {
        label263:
        boolean bool;
        label327:
        label334:
        int j;
        if (4 == k)
        {
          if (i != 1)
          {
            if (HYEntranceManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
              jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.d);
            }
            jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.b);
            jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.e);
          }
        }
        else
        {
          if (paramList != null)
          {
            try
            {
              localObject3 = paramList.iterator();
              while (((Iterator)localObject3).hasNext())
              {
                RecentBaseData localRecentBaseData = (RecentBaseData)((Iterator)localObject3).next();
                if (localRecentBaseData == null) {
                  break label539;
                }
                jdField_a_of_type_JavaUtilList.add(localRecentBaseData);
              }
              if (localObject2 == null) {
                break label334;
              }
            }
            catch (Exception localException) {}
            if (jdField_a_of_type_JavaUtilList.size() != 0) {
              break label557;
            }
            bool = false;
            localObject2.setDragEnable(bool);
            if ((localObject1 instanceof RecentBaseData))
            {
              localObject1 = (RecentBaseData)localObject1;
              j = Math.max(localObject2.s(), 0);
              int m = Math.min(localObject2.t() + 1, jdField_a_of_type_JavaUtilList.size());
              label380:
              if (j < m)
              {
                if (!((RecentBaseData)localObject1).equals(jdField_a_of_type_JavaUtilList.get(j))) {
                  break label563;
                }
                c = j;
                if (QLog.isDevelopLevel()) {
                  QLog.i("Q.recent", 4, "setDataList getsel, [" + j + "," + jdField_a_of_type_JavaUtilList.get(j) + "]");
                }
              }
            }
          }
          if ((paramList == null) || (paramList.size() <= 0)) {
            break label586;
          }
          switch (k)
          {
          }
        }
        label539:
        label557:
        label563:
        label586:
        while (4 != k) {
          for (;;)
          {
            if ((localObject2 != null) && (c == -1)) {
              localObject2.N();
            }
            notifyDataSetChanged();
            return;
            jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.f);
            break;
            if (!QLog.isColorLevel()) {
              break label263;
            }
            QLog.i("Q.recent", 2, "setDataList, [item is null]");
            break label263;
            bool = true;
            break label327;
            j += 1;
            break label380;
            jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.a);
          }
        }
        if (i == 0) {
          jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.c);
        }
        for (;;)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004F84", "0X8004F84", 0, 0, "", "", "", "");
          break;
          jdField_a_of_type_JavaUtilList.add(RecentItemBuilderFactory.g);
        }
      }
    }
  }
  
  public void b(boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a == null) {
      return;
    }
    if (paramBoolean)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a.a();
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a.c();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a.b()) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a.b();
    }
    jdField_a_of_type_Long = System.currentTimeMillis();
    int j = jdField_a_of_type_ComTencentWidgetXListView.getChildCount();
    int i = 0;
    label76:
    RecentBaseData localRecentBaseData;
    if (i < j)
    {
      localRecentBaseData = a(jdField_a_of_type_ComTencentWidgetXListView.getChildAt(i));
      if (localRecentBaseData != null) {
        break label107;
      }
    }
    for (;;)
    {
      i += 1;
      break label76;
      break;
      label107:
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.a(localRecentBaseData.a(), localRecentBaseData.a(), false);
    }
  }
  
  public boolean b()
  {
    return (c()) || (jdField_a_of_type_JavaUtilList.size() == 0);
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder.b();
    }
  }
  
  protected boolean c()
  {
    return (d == 3) || (d == 8) || (d == 13);
  }
  
  public void d()
  {
    if (jdField_a_of_type_ComTencentWidgetBubblePopupWindow != null)
    {
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow.b();
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow = null;
    }
  }
  
  public void d(boolean paramBoolean)
  {
    if (!paramBoolean) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      FrameHelperActivity.d(paramBoolean);
      return;
    }
  }
  
  public void e()
  {
    if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.size() == 0)) {}
    for (;;)
    {
      return;
      int j = jdField_a_of_type_JavaUtilList.size();
      int i = 0;
      while (i < j)
      {
        Object localObject = jdField_a_of_type_JavaUtilList.get(i);
        if ((localObject instanceof RecentUserBaseData))
        {
          localObject = (RecentUserBaseData)localObject;
          if ((((RecentUserBaseData)localObject).a() == 1008) && ("2720152058".equals(((RecentUserBaseData)localObject).a())) && (((RecentUserBaseData)localObject).b() > 0))
          {
            ((RecentUserBaseData)localObject).c();
            localObject = ((RecentUserBaseData)localObject).a();
            RecentUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (RecentUser)localObject, true);
            notifyDataSetChanged();
            return;
          }
        }
        i += 1;
      }
    }
  }
  
  public int getCount()
  {
    if ((c()) || (jdField_a_of_type_JavaUtilList.size() == 0)) {
      return 1;
    }
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    try
    {
      if ((c()) || (jdField_a_of_type_JavaUtilList.size() == 0)) {
        return Integer.valueOf(d);
      }
      if ((paramInt >= 0) && (paramInt < jdField_a_of_type_JavaUtilList.size()))
      {
        Object localObject = jdField_a_of_type_JavaUtilList.get(paramInt);
        return localObject;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, localException.toString());
      }
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    Object localObject = getItem(paramInt);
    return jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(localObject);
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject2 = getItem(paramInt);
    RecentItemBaseBuilder localRecentItemBaseBuilder = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(localObject2);
    Object localObject1;
    if ((localObject2 instanceof RecentBaseData))
    {
      localObject1 = (RecentBaseData)localObject2;
      b((RecentBaseData)localObject1);
      paramView = localRecentItemBaseBuilder.a(paramInt, localObject1, jdField_a_of_type_ComTencentMobileqqActivityRecentRecentFaceDecoder, paramView, paramViewGroup, jdField_a_of_type_AndroidContentContext, this, this, this);
    }
    do
    {
      return paramView;
      if ((localObject2 instanceof Integer)) {
        return localRecentItemBaseBuilder.a(paramInt, localObject2, null, paramView, paramViewGroup, jdField_a_of_type_AndroidContentContext, this, this, this);
      }
      if ((localObject2 instanceof String)) {
        return localRecentItemBaseBuilder.a(paramInt, localObject2, null, paramView, paramViewGroup, jdField_a_of_type_AndroidContentContext, null, null, null);
      }
      if (!(localObject2 instanceof Long)) {
        break;
      }
      localObject1 = localRecentItemBaseBuilder.a(paramInt, localObject2, null, paramView, paramViewGroup, jdField_a_of_type_AndroidContentContext, this, this, this);
      if ((Long)localObject2 == RecentItemBuilderFactory.c) {
        return ((RecentCallHoldItemBuilder)localRecentItemBaseBuilder).a((View)localObject1, b, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
      paramView = (View)localObject1;
    } while (localObject2 != RecentItemBuilderFactory.g);
    return localRecentItemBaseBuilder.a(paramInt, localObject2, null, (View)localObject1, paramViewGroup, jdField_a_of_type_AndroidContentContext, this, this, this);
    return localRecentItemBaseBuilder.a(paramInt, localObject2, null, paramView, paramViewGroup, jdField_a_of_type_AndroidContentContext, null, null, null);
  }
  
  public int getViewTypeCount()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.b();
  }
  
  public void onClick(View paramView)
  {
    if (paramView == null) {
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent", 4, "RecentAdpater onClick v is null");
      }
    }
    label373:
    do
    {
      do
      {
        for (;;)
        {
          return;
          if (Utils.a("tag_swip_icon_menu_item", paramView.getTag()))
          {
            localObject = paramView.getTag(-1);
            paramView = paramView.getTag(-2);
            if ((!(localObject instanceof Integer)) || (!(paramView instanceof Integer)))
            {
              if (!QLog.isDevelopLevel()) {
                continue;
              }
              QLog.i("Q.recent", 4, "RecentAdpater onClick tag is not int");
              return;
            }
            i = ((Integer)localObject).intValue();
            int j = ((Integer)paramView).intValue();
            try
            {
              paramView = jdField_a_of_type_AndroidContentContext.getResources().getString(j);
              localObject = getItem(i);
              if (QLog.isDevelopLevel()) {
                QLog.i("Q.recent", 4, "onClick|obj = " + localObject + ", " + paramView);
              }
              if ((paramView != null) && ((localObject instanceof RecentBaseData)))
              {
                a((RecentBaseData)localObject, paramView, "2");
                return;
              }
            }
            catch (Exception paramView)
            {
              for (;;)
              {
                if (QLog.isDevelopLevel()) {
                  QLog.i("Q.recent", 4, paramView.toString());
                }
                paramView = null;
              }
            }
          }
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener == null) {
          break label373;
        }
        localObject = paramView.getTag(-1);
        if ((localObject instanceof Integer)) {
          break;
        }
      } while (!QLog.isDevelopLevel());
      QLog.i("Q.recent", 4, "RecentAdpater onClick tag is not int");
      return;
      int i = ((Integer)localObject).intValue();
      Object localObject = getItem(i);
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent", 4, "onClick|obj = " + localObject);
      }
      if ((localObject instanceof RecentBaseData))
      {
        if (((paramView instanceof FixSizeImageView)) && ((localObject instanceof RecentItemEcShop)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener.a(paramView, localObject);
          return;
        }
        localObject = (RecentBaseData)localObject;
        Q = i;
        jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener.a(paramView, (RecentBaseData)localObject, a, true);
        return;
      }
      jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener.a(paramView, localObject);
      return;
    } while (!QLog.isDevelopLevel());
    QLog.i("Q.recent", 4, "onClick|mRecentLis is null");
  }
  
  public boolean onLongClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory != null) {}
    for (int i = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(); ((i == 0) || (i == 4)) && (FrameHelperActivity.a()); i = 0) {
      return false;
    }
    if (paramView == null)
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent", 4, "RecentAdpater onLongClick v is null");
      }
      return false;
    }
    Object localObject1 = paramView.getTag(-1);
    if (!(localObject1 instanceof Integer))
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("Q.recent", 4, "RecentAdpater onLongClick tag is not int");
      }
      return false;
    }
    int j = ((Integer)localObject1).intValue();
    localObject1 = getItem(j);
    if ((localObject1 instanceof RecentBaseData)) {}
    for (localObject1 = (RecentBaseData)localObject1;; localObject1 = null)
    {
      if (localObject1 == null)
      {
        if (QLog.isDevelopLevel()) {
          QLog.i("Q.recent", 4, "RecentAdpater onLongClick item is null, pos = " + j);
        }
        return false;
      }
      Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentItemBuilderFactory.a(localObject1);
      if (((RecentBaseData)localObject1).a() == 1)
      {
        i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(((RecentBaseData)localObject1).a());
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "right", 0, 0, ((RecentBaseData)localObject1).a(), String.valueOf(i - 1), "", "");
      }
      paramView.setSelected(true);
      if (localObject2 != null) {}
      for (localObject1 = ((RecentItemBaseBuilder)localObject2).a((RecentBaseData)localObject1, jdField_a_of_type_AndroidContentContext);; localObject1 = null)
      {
        if ((localObject1 != null) && (((List)localObject1).size() > 0))
        {
          localObject2 = new QQCustomMenu();
          i = 0;
          while (i < ((List)localObject1).size())
          {
            ((QQCustomMenu)localObject2).a(j, (String)((List)localObject1).get(i));
            i += 1;
          }
          jdField_a_of_type_ComTencentWidgetBubblePopupWindow = BubbleContextMenu.a(paramView, (QQCustomMenu)localObject2, jdField_a_of_type_AndroidViewView$OnClickListener, new mgb(this, paramView));
          return true;
        }
        if (QLog.isDevelopLevel()) {
          QLog.i("Q.recent", 4, "RecentAdpater onLongClick no menu, builder = " + localObject2);
        }
        return false;
      }
    }
  }
}
