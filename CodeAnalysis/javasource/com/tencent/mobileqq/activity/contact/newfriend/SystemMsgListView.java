package com.tencent.mobileqq.activity.contact.newfriend;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Handler;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.AddRequestActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter.ViewHolder;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BusinessObserver;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.SlideDetectListView;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import lsm;
import lsn;
import lso;
import lsp;
import lsq;
import lsr;
import lss;
import lst;
import lsu;
import lsv;
import lsw;
import lsx;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgAction;

public class SystemMsgListView
  extends BaseNewFriendView
  implements BaseSystemMsgInterface, OnSystemMsgOpsListener, SystemMsgSwipListView.OnScrollToTopListener, SystemMsgSwipListView.OnSlideListener, FaceDecoder.DecodeTaskCompletionListener, Observer
{
  static final int jdField_a_of_type_Int = 60;
  private static final String jdField_a_of_type_JavaLangString = "Q.newfriendSystemMsgListView";
  public static final int b = 1012;
  public static final int c = 1013;
  public static final int d = 1014;
  public static final int e = 1015;
  public static final int f = 1016;
  public static final int g = 998;
  public static final int h = 999;
  public static final int i = 1000;
  public static final int j = 1100;
  public static final int k = 1001;
  public static final int l = 1002;
  public static final int m = 1003;
  public static final int n = 1004;
  public static final int o = 1012;
  public final long a;
  private Context jdField_a_of_type_AndroidContentContext;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  public Handler a;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private View.OnTouchListener jdField_a_of_type_AndroidViewView$OnTouchListener;
  private SystemMsgSwipListView.OnScrollToTopListener jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener;
  private SystemMsgSwipListView jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView;
  private SystemMsgListAdapter jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  MessageObserver jdField_a_of_type_ComTencentMobileqqAppMessageObserver;
  TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  private Object jdField_a_of_type_JavaLangObject;
  private List jdField_a_of_type_JavaUtilList;
  public final long b;
  private View.OnClickListener jdField_b_of_type_AndroidViewView$OnClickListener;
  private boolean jdField_b_of_type_Boolean;
  private View.OnClickListener jdField_c_of_type_AndroidViewView$OnClickListener;
  private boolean jdField_c_of_type_Boolean;
  public View d;
  private boolean d;
  public View e;
  private boolean e;
  private View jdField_f_of_type_AndroidViewView;
  private boolean jdField_f_of_type_Boolean;
  private int p;
  private int q;
  private final int r;
  private int s;
  
  public SystemMsgListView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_Long = 1000L;
    jdField_b_of_type_Long = 500L;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    p = 0;
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_AndroidOsHandler = new lsm(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new lss(this);
    jdField_b_of_type_AndroidViewView$OnClickListener = new lst(this);
    jdField_c_of_type_AndroidViewView$OnClickListener = new lsu(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lsv(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new lsw(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lsx(this);
    r = 0;
    jdField_a_of_type_AndroidViewView$OnTouchListener = new lsn(this);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener = new lso(this);
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  public static void a(QQAppInterface paramQQAppInterface)
  {
    c(paramQQAppInterface);
    paramQQAppInterface.y();
    FriendSystemMsgController.a().a(paramQQAppInterface);
    ((NewFriendManager)paramQQAppInterface.getManager(33)).e();
  }
  
  private void a(XListView paramXListView, String paramString, Bitmap paramBitmap)
  {
    int i2;
    int i1;
    if (p == 0)
    {
      i2 = paramXListView.getChildCount();
      i1 = 0;
    }
    for (;;)
    {
      if (i1 < i2)
      {
        if ((paramXListView instanceof SystemMsgSwipListView))
        {
          SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder localSystemMsgItemBaseHolder = (SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)paramXListView.getChildAt(i1).getTag();
          if ((localSystemMsgItemBaseHolder != null) && (paramString.equals(jdField_a_of_type_JavaLangString))) {
            jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
          }
        }
      }
      else {
        return;
      }
      i1 += 1;
    }
  }
  
  private void a(structmsg.StructMsg paramStructMsg, long paramLong)
  {
    if (paramStructMsg != null)
    {
      long l1 = getmsg_seq.get() + getmsg_type.get();
      FriendSystemMsgController.a().a(Long.valueOf(l1), (structmsg.StructMsg)paramStructMsg.get());
      FriendSystemMsgController.a().b(l1);
      FriendSystemMsgController.a().a(paramLong);
    }
  }
  
  private void b(SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder)
  {
    if ((paramSystemMsgItemBaseHolder == null) || (jdField_a_of_type_AndroidWidgetImageView == null)) {
      return;
    }
    Object localObject1 = jdField_a_of_type_JavaLangString;
    if ((TextUtils.isEmpty((CharSequence)localObject1)) && (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg != null)) {
      localObject1 = Long.toString(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.req_uin.get());
    }
    for (;;)
    {
      if (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg != null) {}
      for (int i1 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.src_id.get();; i1 = 0)
      {
        Object localObject2;
        if ((i1 == 3007) || (i1 == 3019) || (i1 == 2007) || (i1 == 2019))
        {
          localObject2 = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          if ((localObject2 != null) && (((FriendsManager)localObject2).b((String)localObject1))) {
            i1 = 0;
          }
        }
        for (;;)
        {
          if (i1 != 0)
          {
            localObject2 = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(32, jdField_a_of_type_JavaLangString, 200);
            localObject1 = localObject2;
            if (localObject2 == null)
            {
              localObject1 = localObject2;
              if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
              {
                jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, 200, true, false);
                localObject1 = localObject2;
              }
            }
          }
          for (;;)
          {
            localObject2 = localObject1;
            if (localObject1 == null)
            {
              if (jdField_a_of_type_AndroidGraphicsBitmap == null) {
                jdField_a_of_type_AndroidGraphicsBitmap = ImageUtil.a();
              }
              localObject2 = jdField_a_of_type_AndroidGraphicsBitmap;
            }
            jdField_a_of_type_AndroidWidgetImageView.setImageBitmap((Bitmap)localObject2);
            return;
            i1 = 1;
            break;
            localObject2 = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, jdField_a_of_type_JavaLangString);
            localObject1 = localObject2;
            if (localObject2 == null)
            {
              localObject1 = localObject2;
              if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
              {
                jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, 1, false);
                localObject1 = localObject2;
              }
            }
          }
          i1 = 0;
        }
      }
    }
  }
  
  private void b(SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.newfriendSystemMsgListView", 2, "jumpToAddRequestActivity!" + jdField_a_of_type_Long + ": dealMsgType = " + paramInt);
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, AddRequestActivity.class);
    localIntent.putExtra("infoid", jdField_a_of_type_Long);
    localIntent.putExtra("infouin", jdField_a_of_type_JavaLangString);
    localIntent.putExtra("infonick", jdField_b_of_type_JavaLangString);
    localIntent.putExtra("infotime", jdField_b_of_type_Long);
    localIntent.putExtra("msg_type", jdField_a_of_type_Int);
    localIntent.putExtra("strNickName", jdField_b_of_type_JavaLangString);
    localIntent.putExtra("verify_msg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_additional.get());
    localIntent.putExtra("msg_source", jdField_d_of_type_JavaLangString);
    localIntent.putExtra("msg_troopuin", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get());
    localIntent.putExtra("system_message_summary", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_decided.get());
    localIntent.putExtra("info_dealwith_msg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_detail.get());
    localIntent.putExtra("msg_title", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_title.get());
    localIntent.putExtra("msg_source_id", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.src_id.get());
    a((structmsg.StructMsg)jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.get(), jdField_c_of_type_Long);
    a(localIntent);
  }
  
  private static void c(QQAppInterface paramQQAppInterface)
  {
    if (paramQQAppInterface != null) {
      paramQQAppInterface.a(new lsp(paramQQAppInterface));
    }
    if (QLog.isColorLevel()) {
      QLog.i("Q.newfriendSystemMsgListView", 2, "sendReadConfirm is end!");
    }
  }
  
  private void d(boolean paramBoolean)
  {
    a(2, paramBoolean);
  }
  
  private void n()
  {
    a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().addObserver(this);
  }
  
  private void o()
  {
    b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    b(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().deleteObserver(this);
  }
  
  private void p()
  {
    a(2130904298);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView = ((SystemMsgSwipListView)findViewById(2131302181));
    jdField_d_of_type_AndroidViewView = findViewById(2131302182);
    jdField_e_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130904299, null);
    jdField_e_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    r();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
  }
  
  private void q()
  {
    q = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter = new SystemMsgListAdapter(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView, this, this, q);
    jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.au, 0);
    if ((jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter);
    }
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0) && (!(jdField_a_of_type_JavaUtilList.get(0) instanceof MessageForSystemMsg)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.newfriendSystemMsgListView", 2, "initListData error");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.z();
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.a(null);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.a(jdField_a_of_type_JavaUtilList);
    j();
  }
  
  private void r()
  {
    if (jdField_f_of_type_AndroidViewView == null) {
      jdField_f_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130904297, null);
    }
    if (jdField_f_of_type_AndroidViewView.getParent() == null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.b(jdField_f_of_type_AndroidViewView);
    }
    jdField_f_of_type_AndroidViewView.setVisibility(8);
  }
  
  private void s()
  {
    if (jdField_f_of_type_Boolean) {}
    do
    {
      do
      {
        return;
        if (!NetworkUtil.e(BaseApplication.getContext()))
        {
          QQToast.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentContext.getResources().getString(2131366990), 0).b(a());
          return;
        }
      } while ((jdField_a_of_type_JavaUtilList.size() < 10) || (FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)));
      jdField_f_of_type_Boolean = true;
      jdField_f_of_type_AndroidViewView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().h();
    } while (!QLog.isColorLevel());
    QLog.i("Q.newfriendSystemMsgListView", 2, "loadNextPage.get next page.");
  }
  
  private void t()
  {
    if (jdField_f_of_type_AndroidViewView != null) {
      jdField_f_of_type_AndroidViewView.setVisibility(8);
    }
    jdField_f_of_type_Boolean = false;
    if (QLog.isColorLevel()) {
      QLog.i("Q.newfriendSystemMsgListView", 2, "stopLoadMore().");
    }
  }
  
  public int a()
  {
    return getResources().getDimensionPixelSize(2131492908);
  }
  
  public void a() {}
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView, paramString, paramBitmap);
  }
  
  public void a(int paramInt, MessageRecord arg2, String paramString)
  {
    if (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext)) {
      QQToast.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentContext.getResources().getString(2131367213), 0).b(a());
    }
    while (!Utils.a(paramString, getResources().getString(SystemMsgItemBaseBuilder.a[0]))) {
      return;
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
        {
          paramString = jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_JavaUtilList.size() - paramInt - 1)).structMsg;
          a(paramInt, paramString);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramString);
          return;
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.newfriendSystemMsgListView", 2, "onMenuItemClick mDataList error!");
      }
    }
  }
  
  public void a(int paramInt, structmsg.StructMsg arg2)
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
        {
          paramInt = jdField_a_of_type_JavaUtilList.size() - paramInt - 1;
          if ((paramInt >= 0) && (paramInt < jdField_a_of_type_JavaUtilList.size()))
          {
            if (jdField_a_of_type_JavaUtilList.size() != 1) {
              break label118;
            }
            jdField_a_of_type_JavaUtilList.clear();
            a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          }
          if (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null)
          {
            jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.a(jdField_a_of_type_JavaUtilList);
            j();
            jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.notifyDataSetChanged();
          }
        }
        return;
      }
      try
      {
        label118:
        if (paramInt == jdField_a_of_type_JavaUtilList.size() - 1) {
          ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).c();
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_JavaUtilList.get(paramInt)).frienduin, jdField_a_of_type_JavaUtilList.get(paramInt)).istroop, jdField_a_of_type_JavaUtilList.get(paramInt)).uniseq);
        jdField_a_of_type_JavaUtilList.remove(paramInt);
        continue;
        localObject = finally;
        throw localObject;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
    }
  }
  
  public void a(Intent paramIntent)
  {
    FriendSystemMsgController.a().e();
    super.a(paramIntent);
  }
  
  protected void a(Intent paramIntent, BaseNewFriendView.INewFriendContext paramINewFriendContext)
  {
    super.a(paramIntent, paramINewFriendContext);
    p();
    q();
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.setOnTouchListener(jdField_a_of_type_AndroidViewView$OnTouchListener);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.setDragEnable(true);
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.setOnScrollToTopListener(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener);
  }
  
  public void a(SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.newfriendSystemMsgListView", 2, "handleBuddySystemMsg! start " + jdField_a_of_type_Long);
    }
    structmsg.StructMsg localStructMsg = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg;
    Intent localIntent;
    switch (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.sub_type.get())
    {
    case 0: 
    case 11: 
    default: 
      return;
    case 1: 
      localIntent = new Intent(jdField_a_of_type_AndroidContentContext, AddRequestActivity.class);
      localIntent.putExtra("infoid", jdField_a_of_type_Long);
      localIntent.putExtra("infouin", jdField_a_of_type_JavaLangString);
      localIntent.putExtra("infonick", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("infotime", jdField_b_of_type_Long);
      localIntent.putExtra("verify_msg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_additional.get());
      localIntent.putExtra("verify_type", 1);
      localIntent.putExtra("msg_source_id", msg.src_id.get());
      localIntent.putExtra("msg_type", jdField_a_of_type_Int);
      localIntent.putExtra("strNickName", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("msg_source", jdField_d_of_type_JavaLangString);
      localIntent.putExtra("system_message_summary", msg.msg_describe.get());
      localIntent.putExtra("msg_troopuin", msg.group_code.get());
      localIntent.putExtra("info_dealwith_msg", msg.msg_detail.get());
      localIntent.putExtra("msg_title", msg.msg_title.get());
      a((structmsg.StructMsg)localStructMsg.get(), jdField_c_of_type_Long);
      a(localIntent);
      return;
    case 2: 
      b(paramSystemMsgItemBaseHolder, 1000);
      return;
    case 3: 
      b(paramSystemMsgItemBaseHolder, 1000);
      return;
    case 4: 
      b(paramSystemMsgItemBaseHolder, 1002);
      return;
    case 5: 
      b(paramSystemMsgItemBaseHolder, 1002);
      return;
    case 6: 
      b(paramSystemMsgItemBaseHolder, 1003);
      return;
    case 7: 
      b(paramSystemMsgItemBaseHolder, 1001);
      return;
    case 8: 
      b(paramSystemMsgItemBaseHolder, 1012);
      return;
    case 9: 
      localIntent = new Intent(jdField_a_of_type_AndroidContentContext, AddRequestActivity.class);
      localIntent.putExtra("infoid", jdField_a_of_type_Long);
      localIntent.putExtra("infouin", jdField_a_of_type_JavaLangString);
      localIntent.putExtra("infonick", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("infotime", jdField_b_of_type_Long);
      localIntent.putExtra("verify_msg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_additional.get());
      localIntent.putExtra("verify_type", 2);
      localIntent.putExtra("msg_type", jdField_a_of_type_Int);
      localIntent.putExtra("msg_source", jdField_d_of_type_JavaLangString);
      localIntent.putExtra("strNickName", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("system_message_summary", msg.msg_describe.get());
      localIntent.putExtra("msg_source_id", msg.src_id.get());
      localIntent.putExtra("msg_troopuin", msg.group_code.get());
      localIntent.putExtra("info_dealwith_msg", msg.msg_detail.get());
      localIntent.putExtra("msg_title", msg.msg_title.get());
      a((structmsg.StructMsg)localStructMsg.get(), jdField_c_of_type_Long);
      a(localIntent);
      return;
    case 10: 
      localIntent = new Intent(jdField_a_of_type_AndroidContentContext, AddRequestActivity.class);
      localIntent.putExtra("infoid", jdField_a_of_type_Long);
      localIntent.putExtra("infouin", jdField_a_of_type_JavaLangString);
      localIntent.putExtra("infonick", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("infotime", jdField_b_of_type_Long);
      localIntent.putExtra("verify_msg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_additional.get());
      localIntent.putExtra("verify_type", 2);
      localIntent.putExtra("msg_type", jdField_a_of_type_Int);
      localIntent.putExtra("msg_source", jdField_d_of_type_JavaLangString);
      localIntent.putExtra("strNickName", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("system_message_summary", msg.msg_describe.get());
      localIntent.putExtra("msg_source_id", msg.src_id.get());
      localIntent.putExtra("msg_troopuin", msg.group_code.get());
      localIntent.putExtra("info_dealwith_msg", msg.msg_detail.get());
      localIntent.putExtra("msg_title", msg.msg_title.get());
      a((structmsg.StructMsg)localStructMsg.get(), jdField_c_of_type_Long);
      a(localIntent);
      return;
    }
    b(paramSystemMsgItemBaseHolder, 1004);
  }
  
  public void a(SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder, int paramInt)
  {
    Object localObject = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg;
    jdField_a_of_type_Long = paramInt;
    jdField_a_of_type_JavaLangString = (req_uin.get() + "");
    jdField_a_of_type_Int = msg.sub_type.get();
    jdField_b_of_type_Long = msg_time.get();
    jdField_b_of_type_JavaLangString = msg.req_uin_nick.get();
    jdField_c_of_type_Int = paramInt;
    if ((jdField_b_of_type_JavaLangString != null) && (!jdField_b_of_type_JavaLangString.equals("")))
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_b_of_type_JavaLangString);
      jdField_d_of_type_JavaLangString = msg.msg_source.get();
      paramInt = msg.src_id.get();
      if ((msg.sub_type.get() != 6) && ((paramInt == 3016) || (paramInt == 2016)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).getBoolean("newfriend_sysmsg_game_add_friends_tips", true)))
      {
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1015);
        setIsShowGameAddFriendsTips(false);
      }
      b(paramSystemMsgItemBaseHolder);
      jdField_a_of_type_AndroidWidgetImageView.setTag(paramSystemMsgItemBaseHolder);
      e.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setSingleLine(true);
      jdField_d_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getResources().getString(2131367158) + " " + jdField_d_of_type_JavaLangString);
      if (TextUtils.isEmpty(jdField_d_of_type_JavaLangString)) {
        break label527;
      }
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      label310:
      if (msg != null)
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(msg.msg_describe.get());
        jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(paramSystemMsgItemBaseHolder);
        jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
        if ((msg.msg_additional.get() == null) || (msg.msg_additional.get().equals(""))) {
          break label575;
        }
        if (TextUtils.isEmpty(msg.msg_qna.get())) {
          break label555;
        }
        jdField_b_of_type_AndroidWidgetTextView.setText(msg.msg_qna.get());
        label418:
        switch (msg.sub_type.get())
        {
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetButton.setTag(paramSystemMsgItemBaseHolder);
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(jdField_c_of_type_AndroidViewView$OnClickListener);
      return;
      jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
      break;
      label527:
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setSingleLine(false);
      jdField_b_of_type_AndroidWidgetTextView.setMaxLines(2);
      break label310;
      label555:
      jdField_b_of_type_AndroidWidgetTextView.setText(msg.msg_additional.get());
      break label418;
      label575:
      jdField_b_of_type_AndroidWidgetTextView.setText(msg.msg_describe.get());
      break label418;
      if ((msg.actions.get() != null) && (msg.actions.get().size() > 0) && (!TextUtils.isEmpty(msg.actions.get().get(0)).name.get())))
      {
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        localObject = msg.actions.get().get(0)).name.get();
        jdField_a_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
      }
      else if ((msg.actions.get() != null) && (msg.actions.get().size() == 0))
      {
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
        localObject = msg.msg_decided.get();
        jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
        localObject = msg.msg_decided.get();
        jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
        localObject = msg.msg_decided.get();
        jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        if ((msg.msg_additional.get() != null) && (!msg.msg_additional.get().equals("")))
        {
          e.setText(msg.msg_additional.get());
          e.setVisibility(0);
          jdField_b_of_type_AndroidWidgetTextView.setSingleLine(true);
          jdField_b_of_type_AndroidWidgetTextView.setText(msg.msg_describe.get());
        }
        for (;;)
        {
          jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
          jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
          break;
          e.setVisibility(8);
          jdField_b_of_type_AndroidWidgetTextView.setSingleLine(false);
          jdField_b_of_type_AndroidWidgetTextView.setMaxLines(2);
        }
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
        localObject = msg.msg_decided.get();
        jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
        localObject = msg.msg_decided.get();
        jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        continue;
        if ((msg.actions.get() != null) && (msg.actions.get().size() > 0) && (!TextUtils.isEmpty(msg.actions.get().get(0)).name.get())))
        {
          e.setVisibility(8);
          jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
          jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
          localObject = msg.actions.get().get(0)).name.get();
          jdField_a_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
        }
        else
        {
          jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
          localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
          localLayoutParams.addRule(11);
          localLayoutParams.addRule(9, 0);
          localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
          localObject = msg.msg_decided.get();
          jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
          jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
          continue;
          if ((msg.actions.get() != null) && (msg.actions.get().size() > 0) && (!TextUtils.isEmpty(msg.actions.get().get(0)).name.get())))
          {
            e.setVisibility(8);
            jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
            jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
            localObject = msg.actions.get().get(0)).name.get();
            jdField_a_of_type_AndroidWidgetButton.setText((CharSequence)localObject);
          }
          else
          {
            jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
            localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
            localLayoutParams.addRule(11);
            localLayoutParams.addRule(9, 0);
            localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
            localObject = msg.msg_decided.get();
            jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
            jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
            continue;
            if ((jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.reqsubtype.has()) && (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.reqsubtype.get() == 1))
            {
              jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
              localLayoutParams = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
              localLayoutParams.addRule(11);
              localLayoutParams.addRule(9, 0);
              localLayoutParams.setMargins(0, 0, (int)(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().density * 14.0F), 0);
              localObject = msg.msg_decided.get();
              jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
              jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
            }
          }
        }
      }
    }
  }
  
  public void a(NotificationAdapter.ViewHolder paramViewHolder, int paramInt) {}
  
  public void a(BusinessObserver paramBusinessObserver)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramBusinessObserver);
    }
  }
  
  public void a(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public boolean a(float paramFloat)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.getChildCount() - jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.m() > 0)
    {
      View localView = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.getChildAt(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.getChildCount() - 1);
      int[] arrayOfInt = new int[2];
      localView.getLocationOnScreen(arrayOfInt);
      int i1 = arrayOfInt[1];
      if (paramFloat > localView.getMeasuredHeight() + i1) {
        return true;
      }
    }
    return false;
  }
  
  public void b(BusinessObserver paramBusinessObserver)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(paramBusinessObserver);
    }
  }
  
  public void b(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt) {}
  
  protected void d()
  {
    super.d();
    a(true);
    d(false);
  }
  
  protected void e()
  {
    super.e();
    n();
    jdField_c_of_type_Boolean = true;
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = true;
    if ((jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null) && (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.getCount() > 0))
    {
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.jdField_a_of_type_Int = FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.notifyDataSetChanged();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lsq(this));
      FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
      FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    j();
    if (jdField_b_of_type_Boolean) {
      jdField_b_of_type_Boolean = false;
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b();
    }
  }
  
  protected void f()
  {
    super.f();
    jdField_c_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  protected void g()
  {
    super.g();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
  }
  
  protected void h()
  {
    super.h();
    o();
    if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).getBoolean("newfriend_sysmsg_game_add_friends_tips", true)) && (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.m() > 0)) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView.a(jdField_e_of_type_AndroidViewView);
    }
    if (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.a();
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter = null;
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(null);
    FriendSystemMsgController.a().b();
    if (jdField_d_of_type_Boolean) {
      FriendSystemMsgController.a().d();
    }
  }
  
  public void i()
  {
    FriendSystemMsgController.a().b();
    if ((jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null) && (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.getCount() > 0)) {
      c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    jdField_d_of_type_Boolean = true;
    super.i();
  }
  
  public void j()
  {
    try
    {
      if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
      {
        jdField_d_of_type_AndroidViewView.setVisibility(8);
        return;
      }
      jdField_d_of_type_AndroidViewView.setVisibility(0);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void k()
  {
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1014);
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0)) {
      jdField_a_of_type_JavaUtilList.clear();
    }
    if (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.a();
      jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.notifyDataSetChanged();
    }
  }
  
  public void l()
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    localIntent.putExtra("title", jdField_a_of_type_AndroidContentContext.getString(2131370596));
    a(localIntent.putExtra("url", "http://ti.qq.com/friendship_auth/index.html?_wv=3&_bid=173#p1"));
  }
  
  public void m() {}
  
  public void setIsShowGameAddFriendsTips(boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).edit().putBoolean("newfriend_sysmsg_game_add_friends_tips", paramBoolean).commit();
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new lsr(this));
  }
}
