import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.AutoRemarkActivity;
import com.tencent.mobileqq.activity.contact.newfriend.BaseNewFriendView.INewFriendContext;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class lsx
  extends MessageObserver
{
  public lsx(SystemMsgListView paramSystemMsgListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a())
    {
      paramString = SystemMsgListView.a(a).getResources().getString(2131367163);
      QQToast.a(SystemMsgListView.a(a), 1, paramString, 0).b(a.a());
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.d("Q.newfriendSystemMsgListView", 2, "onSendSystemMsgActionError");
  }
  
  protected void a(boolean paramBoolean, String paramString1, int paramInt1, String paramString2, int paramInt2, int paramInt3, String paramString3, String paramString4, int paramInt4)
  {
    long l1 = FriendSystemMsgController.a().b();
    if (!TextUtils.isEmpty(paramString1)) {}
    for (;;)
    {
      try
      {
        l2 = Long.parseLong(paramString1);
        l1 = l2;
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1012);
        paramString1 = FriendSystemMsgController.a().a(Long.valueOf(l1));
        if (a.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a()) {
          break label89;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.newfriendSystemMsgListView", 2, "onSendSystemMsgActionFin");
        }
        return;
      }
      catch (Exception paramString1)
      {
        paramString1.printStackTrace();
      }
      continue;
      label89:
      if (!paramBoolean)
      {
        if (!TextUtils.isEmpty(paramString3)) {}
        for (;;)
        {
          QQToast.a(SystemMsgListView.a(a), 1, paramString3, 0).b(a.a());
          SystemMsgUtils.a(paramString1, paramInt3, paramString2, paramString4);
          return;
          paramString3 = SystemMsgListView.a(a).getResources().getString(2131368369);
        }
      }
      paramString3 = SystemMsgListView.a(a).getResources().getString(2131367047);
      QQToast.a(SystemMsgListView.a(a), 2, paramString3, 0).b(a.a());
      long l2 = FriendSystemMsgController.a().a();
      SystemMsgUtils.a(paramString1, paramInt1, paramString2, paramInt2);
      if ((l2 != 0L) && (paramString1 != null)) {}
      try
      {
        a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(AppConstants.au, 0, l2, paramString1.toByteArray());
        if ((paramInt1 != 0) || (paramString1 == null)) {
          continue;
        }
        FriendSystemMsgController.a().e();
        AutoRemarkActivity.a(a.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity(), 0, String.valueOf(req_uin.get()), l1);
        return;
      }
      catch (Exception paramString2)
      {
        for (;;)
        {
          paramString2.printStackTrace();
          if (QLog.isColorLevel()) {
            QLog.i("Q.newfriendSystemMsgListView", 2, "onSendSystemMsgActionFin Exception!");
          }
        }
      }
    }
  }
  
  /* Error */
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    // Byte code:
    //   0: invokestatic 64	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +11 -> 14
    //   6: ldc 66
    //   8: iconst_2
    //   9: ldc -69
    //   11: invokestatic 184	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   14: aload_0
    //   15: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   18: invokestatic 34	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Landroid/content/Context;
    //   21: checkcast 189	android/app/Activity
    //   24: invokevirtual 192	android/app/Activity:isFinishing	()Z
    //   27: ifeq +4 -> 31
    //   30: return
    //   31: iload_1
    //   32: ifeq +192 -> 224
    //   35: invokestatic 64	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   38: ifeq +11 -> 49
    //   41: ldc 66
    //   43: iconst_2
    //   44: ldc -62
    //   46: invokestatic 184	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   49: aload_0
    //   50: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   53: invokestatic 197	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Ljava/lang/Object;
    //   56: astore_3
    //   57: aload_3
    //   58: monitorenter
    //   59: aload_0
    //   60: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   63: aload_0
    //   64: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   67: getfield 131	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   70: invokevirtual 136	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   73: getstatic 142	com/tencent/mobileqq/app/AppConstants:au	Ljava/lang/String;
    //   76: iconst_0
    //   77: invokevirtual 200	com/tencent/mobileqq/app/message/QQMessageFacade:b	(Ljava/lang/String;I)Ljava/util/List;
    //   80: invokestatic 203	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;Ljava/util/List;)Ljava/util/List;
    //   83: pop
    //   84: aload_0
    //   85: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   88: invokestatic 206	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Lcom/tencent/mobileqq/adapter/SystemMsgListAdapter;
    //   91: ifnull +115 -> 206
    //   94: aload_0
    //   95: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   98: invokestatic 206	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Lcom/tencent/mobileqq/adapter/SystemMsgListAdapter;
    //   101: aload_0
    //   102: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   105: invokestatic 209	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Ljava/util/List;
    //   108: invokevirtual 214	com/tencent/mobileqq/adapter/SystemMsgListAdapter:a	(Ljava/util/List;)V
    //   111: aload_0
    //   112: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   115: invokestatic 217	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:b	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Z
    //   118: ifeq +71 -> 189
    //   121: aload_0
    //   122: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   125: getfield 131	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   128: bipush 33
    //   130: invokevirtual 221	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   133: checkcast 223	com/tencent/mobileqq/app/NewFriendManager
    //   136: new 225	com/tencent/mobileqq/newfriend/NewFriendMessage
    //   139: dup
    //   140: iconst_1
    //   141: iconst_0
    //   142: iconst_0
    //   143: invokespecial 228	com/tencent/mobileqq/newfriend/NewFriendMessage:<init>	(IIZ)V
    //   146: invokevirtual 231	com/tencent/mobileqq/app/NewFriendManager:a	(Lcom/tencent/mobileqq/newfriend/NewFriendMessage;)V
    //   149: invokestatic 80	com/tencent/mobileqq/systemmsg/FriendSystemMsgController:a	()Lcom/tencent/mobileqq/systemmsg/FriendSystemMsgController;
    //   152: aload_0
    //   153: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   156: getfield 131	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   159: iconst_0
    //   160: invokevirtual 234	com/tencent/mobileqq/systemmsg/FriendSystemMsgController:a	(Lcom/tencent/mobileqq/app/QQAppInterface;I)V
    //   163: aload_0
    //   164: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   167: getfield 131	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   170: invokevirtual 237	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/MessageHandler;
    //   173: invokevirtual 242	com/tencent/mobileqq/app/MessageHandler:a	()Lcom/tencent/mobileqq/app/message/SystemMessageProcessor;
    //   176: invokevirtual 246	com/tencent/mobileqq/app/message/SystemMessageProcessor:b	()V
    //   179: aload_0
    //   180: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   183: getfield 131	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   186: invokestatic 249	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:b	(Lcom/tencent/mobileqq/app/QQAppInterface;)V
    //   189: aload_0
    //   190: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   193: invokevirtual 252	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:j	()V
    //   196: aload_3
    //   197: monitorexit
    //   198: aload_0
    //   199: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   202: invokestatic 254	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)V
    //   205: return
    //   206: aload_3
    //   207: monitorexit
    //   208: return
    //   209: astore 4
    //   211: aload_3
    //   212: monitorexit
    //   213: aload 4
    //   215: athrow
    //   216: astore_3
    //   217: aload_3
    //   218: invokevirtual 116	java/lang/Exception:printStackTrace	()V
    //   221: goto -23 -> 198
    //   224: iload_2
    //   225: ifeq -27 -> 198
    //   228: aload_0
    //   229: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   232: invokestatic 256	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Z
    //   235: ifeq -37 -> 198
    //   238: aload_0
    //   239: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   242: invokestatic 34	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Landroid/content/Context;
    //   245: invokevirtual 40	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   248: ldc_w 257
    //   251: invokevirtual 47	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   254: astore_3
    //   255: aload_0
    //   256: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   259: invokestatic 34	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	(Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;)Landroid/content/Context;
    //   262: iconst_1
    //   263: aload_3
    //   264: iconst_0
    //   265: invokestatic 52	com/tencent/mobileqq/widget/QQToast:a	(Landroid/content/Context;ILjava/lang/CharSequence;I)Lcom/tencent/mobileqq/widget/QQToast;
    //   268: aload_0
    //   269: getfield 10	lsx:a	Lcom/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView;
    //   272: invokevirtual 55	com/tencent/mobileqq/activity/contact/newfriend/SystemMsgListView:a	()I
    //   275: invokevirtual 59	com/tencent/mobileqq/widget/QQToast:b	(I)Landroid/widget/Toast;
    //   278: pop
    //   279: goto -81 -> 198
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	282	0	this	lsx
    //   0	282	1	paramBoolean1	boolean
    //   0	282	2	paramBoolean2	boolean
    //   216	2	3	localException	Exception
    //   254	10	3	str	String
    //   209	5	4	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   59	189	209	finally
    //   189	198	209	finally
    //   206	208	209	finally
    //   211	213	209	finally
    //   49	59	216	java/lang/Exception
    //   213	216	216	java/lang/Exception
  }
  
  protected void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.newfriendSystemMsgListView", 2, "onGetDelSystemMsgFin.bengin");
    }
    if (paramBoolean1)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.newfriendSystemMsgListView", 2, "onGetDelSystemMsgFin.success");
      }
      a.k();
      a.j();
    }
    while ((!paramBoolean2) || (!SystemMsgListView.a(a))) {
      return;
    }
    a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1016);
  }
}
