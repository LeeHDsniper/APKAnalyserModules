package com.tencent.mobileqq.activity.aio;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.media.AudioManager;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import com.tencent.av.audio.AudioSettingManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.item.ItemBuilderFactory;
import com.tencent.mobileqq.activity.aio.item.ShortVideoPTVItemBuilder;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotchat.PttMsgAdapter;
import com.tencent.mobileqq.hotchat.ui.PttTimeLineItemInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.HorizontalListView;
import com.tencent.widget.XBaseAdapter;
import com.tencent.widget.XListView;
import kqk;
import kql;
import kqm;
import kqn;
import kqo;
import kqp;
import mqq.manager.Manager;

public class MediaPlayerManager
  extends BroadcastReceiver
  implements SensorEventListener, AudioPlayer.AudioPlayerListener, Runnable, Manager
{
  private static final String jdField_a_of_type_JavaLangString = MediaPlayerManager.class.getSimpleName();
  public float a;
  private Sensor jdField_a_of_type_AndroidHardwareSensor;
  private SensorManager jdField_a_of_type_AndroidHardwareSensorManager;
  private MediaPlayer.OnCompletionListener jdField_a_of_type_AndroidMediaMediaPlayer$OnCompletionListener = new kqm(this);
  private Handler jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
  private AudioPlayer jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer;
  private MediaPlayerManager.Callback jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Callback;
  private MediaPlayerManager.Listener jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener;
  private MediaPlayerManager.PttShowCallback jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private ChatMessage jdField_a_of_type_ComTencentMobileqqDataChatMessage;
  private PttMsgAdapter jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter;
  private HorizontalListView jdField_a_of_type_ComTencentWidgetHorizontalListView;
  private XBaseAdapter jdField_a_of_type_ComTencentWidgetXBaseAdapter;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private kqp jdField_a_of_type_Kqp;
  public boolean a;
  public float b;
  private Sensor jdField_b_of_type_AndroidHardwareSensor;
  boolean jdField_b_of_type_Boolean = true;
  public float c;
  boolean c = false;
  private float jdField_d_of_type_Float;
  private boolean jdField_d_of_type_Boolean;
  private boolean e;
  private boolean f;
  private boolean g = false;
  private boolean h;
  private boolean i;
  private boolean j = false;
  private boolean k;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public MediaPlayerManager(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_Boolean = true;
    BaseApplication localBaseApplication = paramQQAppInterface.a();
    jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer = new AudioPlayer(localBaseApplication, this);
    jdField_a_of_type_AndroidHardwareSensorManager = ((SensorManager)localBaseApplication.getSystemService("sensor"));
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.HEADSET_PLUG");
    localIntentFilter.addAction("tencent.av.v2q.StartVideoChat");
    localIntentFilter.addAction("android.media.RINGER_MODE_CHANGED");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    if (Build.VERSION.SDK_INT >= 11)
    {
      localIntentFilter.addAction("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED");
      localIntentFilter.addAction("android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED");
    }
    localBaseApplication.registerReceiver(this, localIntentFilter);
    a(paramQQAppInterface);
  }
  
  private float a(Sensor paramSensor)
  {
    String str = Build.MODEL;
    float f1;
    if ((str.equals("ZTE U880s")) || (str.equals("ZTE U807"))) {
      f1 = 97.0F;
    }
    do
    {
      return f1;
      if ((str.equals("Coolpad 5890")) || (str.equals("Coolpad 5891")) || (str.equals("Coolpad 8720L")) || (str.equals("Coolpad 5879")) || (str.equals("Coolpad 5891Q"))) {
        return 5.0F;
      }
      if ((str.equals("HUAWEI Y320-T00")) || (str.equals("Lenovo A658t")) || (str.equals("Lenovo A788t"))) {
        return 10.0F;
      }
      if (str.equals("ME860")) {
        return 99.0F;
      }
      if ((str.equals("ZTE U930HD")) || (str.equals("ZTE-T U960s"))) {
        return 100.0F;
      }
      f1 = 0.0F;
    } while (paramSensor == null);
    return paramSensor.getMaximumRange();
  }
  
  private int a(ChatMessage paramChatMessage, PttMsgAdapter paramPttMsgAdapter)
  {
    if (paramPttMsgAdapter != null)
    {
      int m = 0;
      if (m < paramPttMsgAdapter.getCount())
      {
        Object localObject = paramPttMsgAdapter.getItem(m);
        if ((localObject == null) || (!(localObject instanceof PttTimeLineItemInfo))) {}
        do
        {
          do
          {
            m += 1;
            break;
            localObject = a;
          } while (localObject == null);
          localObject = (MessageForPtt)localObject;
        } while ((localObject.getClass() != paramChatMessage.getClass()) || (uniseq != uniseq));
        return m;
      }
    }
    return -1;
  }
  
  private int a(ChatMessage paramChatMessage, XBaseAdapter paramXBaseAdapter)
  {
    if (paramXBaseAdapter != null)
    {
      int m = 0;
      while (m < paramXBaseAdapter.getCount())
      {
        Object localObject = paramXBaseAdapter.getItem(m);
        if (localObject != null) {
          if ((localObject instanceof ChatMessage))
          {
            if (uniseq != uniseq) {}
          }
          else {
            do
            {
              return m;
              if (!(localObject instanceof RecentBaseData)) {
                break;
              }
              localObject = (RecentBaseData)localObject;
            } while ((frienduin.equals(((RecentBaseData)localObject).a())) && (istroop == ((RecentBaseData)localObject).a()));
          }
        }
        m += 1;
      }
    }
    return -1;
  }
  
  private int a(boolean paramBoolean)
  {
    if (g) {}
    for (int m = a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter);; m = a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentWidgetXBaseAdapter))
    {
      if (m >= 0)
      {
        if (!g) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback.a(jdField_a_of_type_ComTencentWidgetHorizontalListView, m, jdField_a_of_type_ComTencentMobileqqDataChatMessage, paramBoolean);
      }
      return m;
    }
    View localView = AIOUtils.a(jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_ComTencentWidgetXListView.m() + m);
    a(jdField_a_of_type_ComTencentMobileqqDataChatMessage).a(jdField_a_of_type_ComTencentWidgetXListView, m, localView, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
    return m;
  }
  
  private MediaPlayerManager.Callback a(ChatMessage paramChatMessage)
  {
    if ((jdField_a_of_type_ComTencentWidgetXBaseAdapter instanceof ChatAdapter1)) {
      return (MediaPlayerManager.Callback)jdField_a_of_type_ComTencentWidgetXBaseAdapter).a.a(paramChatMessage, jdField_a_of_type_ComTencentWidgetXBaseAdapter);
    }
    return jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Callback;
  }
  
  public static MediaPlayerManager a(QQAppInterface paramQQAppInterface)
  {
    try
    {
      paramQQAppInterface = (MediaPlayerManager)paramQQAppInterface.getManager(23);
      return paramQQAppInterface;
    }
    finally
    {
      paramQQAppInterface = finally;
      throw paramQQAppInterface;
    }
  }
  
  private ChatMessage a(int paramInt)
  {
    if (g) {}
    for (Object localObject = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.getItem(paramInt); (localObject != null) && ((localObject instanceof ChatMessage)); localObject = jdField_a_of_type_ComTencentWidgetXBaseAdapter.getItem(paramInt)) {
      return (ChatMessage)localObject;
    }
    return null;
  }
  
  private void a(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "$bindApp, app = " + paramQQAppInterface);
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == paramQQAppInterface) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      a();
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public static boolean a()
  {
    return Build.MODEL.equals("ZTE U930");
  }
  
  private boolean a(boolean paramBoolean)
  {
    Object localObject;
    if (paramBoolean)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.c();
      if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null) {
        if (!g) {
          break label47;
        }
      }
      label47:
      for (localObject = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter;; localObject = jdField_a_of_type_ComTencentWidgetXBaseAdapter)
      {
        if (localObject != null) {
          a(paramBoolean);
        }
        jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
        return true;
      }
    }
    if (g)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter;
      label67:
      if ((localObject == null) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage == null)) {
        break label133;
      }
      if (!g) {
        break label135;
      }
    }
    label133:
    label135:
    for (boolean bool = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);; bool = a(jdField_a_of_type_ComTencentMobileqqDataChatMessage).b(jdField_a_of_type_ComTencentMobileqqDataChatMessage))
    {
      if (!bool) {
        break label156;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.c();
      a(paramBoolean);
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
      break;
      localObject = jdField_a_of_type_ComTencentWidgetXBaseAdapter;
      break label67;
      break;
    }
    label156:
    return false;
  }
  
  private boolean c()
  {
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null)
    {
      Object localObject1;
      int m;
      label45:
      int n;
      if (g)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter;
        if (localObject1 == null) {
          break label382;
        }
        if (!g) {
          break label114;
        }
        m = a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter);
        if (!g) {
          break label130;
        }
        n = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.getCount();
      }
      for (;;)
      {
        if (m <= n)
        {
          if (g)
          {
            if (m >= 0) {
              jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback.a(jdField_a_of_type_ComTencentWidgetHorizontalListView, m, jdField_a_of_type_ComTencentMobileqqDataChatMessage, false);
            }
            jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
            return false;
            localObject1 = jdField_a_of_type_ComTencentWidgetXBaseAdapter;
            break;
            label114:
            m = a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentWidgetXBaseAdapter);
            break label45;
            label130:
            n = jdField_a_of_type_ComTencentWidgetXBaseAdapter.getCount();
            continue;
          }
          Object localObject2 = AIOUtils.a(jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_ComTencentWidgetXListView.m() + m);
          if (m >= 0) {
            a(jdField_a_of_type_ComTencentMobileqqDataChatMessage).a(jdField_a_of_type_ComTencentWidgetXListView, m, (View)localObject2, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
          }
          if (jdField_d_of_type_Boolean) {
            while (m < n - 1)
            {
              int i2 = m + 1;
              ChatMessage localChatMessage = a(i2);
              localObject1 = localObject2;
              if ((localChatMessage instanceof MediaPlayerManager.Media))
              {
                if ((k) && (localObject2 != null)) {
                  m = 1;
                }
                for (;;)
                {
                  localObject2 = AIOUtils.a(jdField_a_of_type_ComTencentWidgetXListView, i2);
                  try
                  {
                    localObject1 = a(localChatMessage);
                    if ((((MediaPlayerManager.Callback)localObject1).a(jdField_a_of_type_ComTencentWidgetXListView, i2, (View)localObject2, localChatMessage)) && (((MediaPlayerManager.Callback)localObject1).a(jdField_a_of_type_ComTencentWidgetXListView, i2, (View)localObject2, localChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer))) {}
                    for (int i1 = 1;; i1 = 0)
                    {
                      localObject1 = localObject2;
                      if (i1 == 0) {
                        break label372;
                      }
                      jdField_a_of_type_ComTencentMobileqqDataChatMessage = localChatMessage;
                      if (m != 0) {
                        jdField_a_of_type_ComTencentWidgetXListView.e(i2);
                      }
                      return true;
                      m = 0;
                      break;
                    }
                    m = i2;
                  }
                  catch (Exception localException)
                  {
                    localObject1 = localObject2;
                    if (QLog.isColorLevel())
                    {
                      QLog.e(jdField_a_of_type_JavaLangString, 2, "playNext", localException);
                      localObject1 = localObject2;
                    }
                  }
                }
              }
              label372:
              localObject2 = localObject1;
            }
          }
        }
      }
    }
    label382:
    jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
    return false;
  }
  
  private void e()
  {
    float f2 = 0.0F;
    Object localObject = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.qq_audio_play.name(), null);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "MediaPlayerManager.initSensors | dpcConfig = " + (String)localObject);
    }
    if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).length() > 1)) {}
    for (;;)
    {
      try
      {
        localObject = ((String)localObject).split("\\|");
        boolean bool = "1".equals(localObject[0]);
        if (!bool) {
          m = 1;
        }
        int n;
        int m = 1;
      }
      catch (Exception localException2)
      {
        try
        {
          f1 = Float.parseFloat(localObject[1]);
          localObject = DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.qq_audio_play_fix.name(), null);
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "DPC config to UIN | dpcConfig = " + (String)localObject);
          }
          if ((TextUtils.isEmpty((CharSequence)localObject)) || (((String)localObject).length() <= 1)) {
            break label408;
          }
        }
        catch (Exception localException4)
        {
          n = m;
          continue;
          continue;
          n = m;
          continue;
        }
        try
        {
          localObject = ((String)localObject).split("\\|");
          if (!"-1".equals(localObject[4]))
          {
            f2 = Float.parseFloat(localObject[4]);
            f1 = f2;
          }
        }
        catch (Exception localException2)
        {
          try
          {
            bool = "1".equals(localObject[5]);
            if (!bool)
            {
              m = 1;
              n = m;
              if (n != 0)
              {
                jdField_b_of_type_AndroidHardwareSensor = jdField_a_of_type_AndroidHardwareSensorManager.getDefaultSensor(1);
                jdField_a_of_type_Kqp = new kqp(this);
              }
              jdField_a_of_type_AndroidHardwareSensor = jdField_a_of_type_AndroidHardwareSensorManager.getDefaultSensor(8);
              if (f1 <= 0.5F) {
                continue;
              }
              jdField_d_of_type_Float = f1;
              j = true;
              return;
              m = 0;
              continue;
              localException1 = localException1;
              n = 1;
              f1 = f2;
              m = n;
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "parse dpc error", localException1);
              f1 = f2;
              m = n;
              continue;
            }
            m = 0;
            continue;
            localException2 = localException2;
            f2 = f1;
          }
          catch (Exception localException3)
          {
            f2 = f1;
            continue;
          }
          n = m;
          f1 = f2;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "DPC config to UIN error.", localException2);
          n = m;
          f1 = f2;
          continue;
          if (jdField_a_of_type_AndroidHardwareSensor == null) {
            continue;
          }
          jdField_d_of_type_Float = a(jdField_a_of_type_AndroidHardwareSensor);
          continue;
        }
      }
      label408:
      float f1 = f2;
    }
  }
  
  public ChatMessage a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataChatMessage;
  }
  
  public void a()
  {
    try
    {
      a(true);
      a(jdField_a_of_type_ComTencentWidgetXListView);
      a(jdField_a_of_type_ComTencentWidgetHorizontalListView);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().unregisterReceiver(this);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "$unBindApp");
      }
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e(jdField_a_of_type_JavaLangString, 2, "", localException);
    }
  }
  
  public void a(AudioPlayer paramAudioPlayer)
  {
    ThreadManager.a(new kql(this), null, false);
  }
  
  public void a(AudioPlayer paramAudioPlayer, int paramInt)
  {
    if (Looper.getMainLooper() == Looper.myLooper())
    {
      if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null) {
        a(true);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.b(paramInt);
      }
      return;
    }
    jdField_a_of_type_AndroidOsHandler.post(new kqn(this, paramAudioPlayer, paramInt));
  }
  
  public void a(HorizontalListView paramHorizontalListView)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "unBindPttShowUI");
    }
    g = false;
    if ((jdField_a_of_type_ComTencentWidgetHorizontalListView != null) && (jdField_a_of_type_ComTencentWidgetHorizontalListView == paramHorizontalListView))
    {
      jdField_a_of_type_ComTencentWidgetHorizontalListView = null;
      jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter = null;
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback = null;
      e = false;
      f = false;
    }
  }
  
  public void a(HorizontalListView paramHorizontalListView, PttMsgAdapter paramPttMsgAdapter, MediaPlayerManager.PttShowCallback paramPttShowCallback, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "bindPttShowUI, mPttShowListView = " + jdField_a_of_type_ComTencentWidgetHorizontalListView + " ,hlistView = " + paramHorizontalListView + " ,pttAdapter = " + paramPttMsgAdapter);
    }
    jdField_a_of_type_ComTencentWidgetHorizontalListView = paramHorizontalListView;
    jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter = paramPttMsgAdapter;
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback = paramPttShowCallback;
    e = paramBoolean1;
    f = paramBoolean2;
  }
  
  public void a(XListView paramXListView)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "unBindUI");
    }
    if ((jdField_a_of_type_ComTencentWidgetXListView != null) && (jdField_a_of_type_ComTencentWidgetXListView == paramXListView))
    {
      jdField_a_of_type_ComTencentWidgetXListView = null;
      jdField_a_of_type_ComTencentWidgetXBaseAdapter = null;
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener = null;
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Callback = null;
      jdField_d_of_type_Boolean = false;
      k = false;
    }
  }
  
  public void a(XListView paramXListView, XBaseAdapter paramXBaseAdapter, MediaPlayerManager.Listener paramListener)
  {
    a(paramXListView, paramXBaseAdapter, paramListener, null, true, true);
  }
  
  public void a(XListView paramXListView, XBaseAdapter paramXBaseAdapter, MediaPlayerManager.Listener paramListener, MediaPlayerManager.Callback paramCallback, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "bindUI, mListView = " + jdField_a_of_type_ComTencentWidgetXListView + " ,listView = " + paramXListView + " ,adapter = " + paramXBaseAdapter + ", listener = " + paramListener);
    }
    jdField_a_of_type_ComTencentWidgetXListView = paramXListView;
    jdField_a_of_type_ComTencentWidgetXBaseAdapter = paramXBaseAdapter;
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener = paramListener;
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Callback = paramCallback;
    jdField_d_of_type_Boolean = paramBoolean1;
    k = paramBoolean2;
  }
  
  public void a(boolean paramBoolean)
  {
    if (Thread.currentThread() == Looper.getMainLooper().getThread())
    {
      if (a(paramBoolean)) {
        c();
      }
      return;
    }
    jdField_a_of_type_AndroidOsHandler.post(new kqk(this, paramBoolean));
  }
  
  public boolean a(ChatMessage paramChatMessage)
  {
    return a(paramChatMessage, false);
  }
  
  public boolean a(ChatMessage paramChatMessage, boolean paramBoolean)
  {
    if (!j) {
      e();
    }
    ShortVideoPTVItemBuilder.a(jdField_a_of_type_ComTencentWidgetXListView);
    Object localObject;
    label63:
    boolean bool2;
    boolean bool3;
    int m;
    if (paramBoolean)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter;
      if ((localObject == null) || (paramChatMessage == null) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null)) {
        break label338;
      }
      if (!a(false)) {
        break label319;
      }
      if (!AIOUtils.b()) {
        break label229;
      }
      h = true;
      bool2 = AudioSettingManager.a(BaseApplicationImpl.getContext());
      bool3 = AudioHelper.a(BaseApplicationImpl.getContext());
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(h);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(bool2);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.b(bool3);
      if (!paramBoolean) {
        break label243;
      }
      m = a(paramChatMessage, jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter);
      label123:
      if (!paramBoolean) {
        break label256;
      }
    }
    for (boolean bool1 = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback.a(jdField_a_of_type_ComTencentWidgetHorizontalListView, m, paramChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer);; bool1 = a(paramChatMessage).a(jdField_a_of_type_ComTencentWidgetXListView, m, (View)localObject, paramChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer))
    {
      if (!bool1) {
        break label301;
      }
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = paramChatMessage;
      g = paramBoolean;
      c = false;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.M();
        jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.a(bool2, bool3, h, false);
      }
      i = false;
      ThreadManager.a(this, 8, null, false);
      return true;
      localObject = jdField_a_of_type_ComTencentWidgetXBaseAdapter;
      break;
      label229:
      h = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.t();
      break label63;
      label243:
      m = a(paramChatMessage, jdField_a_of_type_ComTencentWidgetXBaseAdapter);
      break label123;
      label256:
      localObject = AIOUtils.a(jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_ComTencentWidgetXListView.m() + m);
    }
    label301:
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "builder play failed.");
    }
    for (;;)
    {
      return false;
      label319:
      if (QLog.isColorLevel())
      {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "doStop failed.");
        continue;
        label338:
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "request play failed, mAdapter = " + jdField_a_of_type_ComTencentWidgetXBaseAdapter + ", msg = " + paramChatMessage + ", app = " + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        }
      }
    }
  }
  
  public boolean a(ChatMessage paramChatMessage, boolean paramBoolean, int paramInt)
  {
    boolean bool;
    if (paramBoolean)
    {
      bool = jdField_a_of_type_ComTencentMobileqqHotchatPttMsgAdapter.jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$PttShowCallback.a(jdField_a_of_type_ComTencentWidgetHorizontalListView, paramInt, paramChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer);
      paramBoolean = bool;
      if (bool)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.M();
        }
        ThreadManager.a(this, 8, null, false);
      }
    }
    for (paramBoolean = bool;; paramBoolean = false)
    {
      if (paramBoolean) {
        jdField_a_of_type_ComTencentMobileqqDataChatMessage = paramChatMessage;
      }
      return paramBoolean;
    }
  }
  
  public void b()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.t();
    if ((bool != h) && (b()))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(bool);
      if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.a(AudioSettingManager.a(BaseApplicationImpl.getContext()), AudioHelper.a(BaseApplicationImpl.getContext()), bool, false);
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "$updateSpeakPhone| speakerOn=" + bool);
      }
    }
    h = bool;
  }
  
  public void b(AudioPlayer paramAudioPlayer, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.c(paramInt);
    }
  }
  
  public void b(boolean paramBoolean)
  {
    if ((paramBoolean) && (b())) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      k = paramBoolean;
      return;
    }
  }
  
  public boolean b()
  {
    return jdField_a_of_type_ComTencentMobileqqDataChatMessage != null;
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "$onStop");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.N();
    }
    ThreadManager.a(this);
    jdField_a_of_type_AndroidHardwareSensorManager.unregisterListener(jdField_a_of_type_Kqp);
    jdField_a_of_type_AndroidHardwareSensorManager.unregisterListener(this);
  }
  
  public void c(AudioPlayer paramAudioPlayer, int paramInt)
  {
    jdField_a_of_type_AndroidOsHandler.post(new kqo(this, paramInt));
  }
  
  public void d()
  {
    if (!AudioPlayer.jdField_a_of_type_Boolean) {}
    AudioManager localAudioManager;
    do
    {
      return;
      localAudioManager = (AudioManager)BaseApplicationImpl.getContext().getSystemService("audio");
    } while ((localAudioManager == null) || (!localAudioManager.isBluetoothScoOn()));
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "stop sco");
    }
    localAudioManager.stopBluetoothSco();
    localAudioManager.setBluetoothScoOn(false);
  }
  
  public void onAccuracyChanged(Sensor paramSensor, int paramInt) {}
  
  public void onDestroy()
  {
    d();
    a();
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    String str = paramIntent.getAction();
    if ((str != null) && (str.equals("android.intent.action.HEADSET_PLUG"))) {
      if (paramIntent.hasExtra("state"))
      {
        if (paramIntent.getIntExtra("state", 0) != 1) {
          break label98;
        }
        bool1 = true;
        if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(bool1);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.a(bool1, AudioHelper.a(BaseApplicationImpl.getContext()), h, true);
        }
      }
    }
    label98:
    label302:
    int m;
    label440:
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
              bool1 = false;
              break;
              if ((str != null) && (str.equals("tencent.av.v2q.StartVideoChat")))
              {
                bool1 = paramIntent.getBooleanExtra("updateTime", false);
                bool2 = paramIntent.getBooleanExtra("showTime", false);
                if (QLog.isColorLevel()) {
                  QLog.d(jdField_a_of_type_JavaLangString, 2, "receive action_recv_video_request. update:" + bool1 + ", show:" + bool2);
                }
                if ((bool1) && (bool2)) {
                  ChatActivityUtils.a();
                }
                a(true);
                return;
              }
              if (!"android.media.RINGER_MODE_CHANGED".equals(str)) {
                break label302;
              }
            } while (((AudioManager)paramContext.getSystemService("audio")).getRingerMode() == 2);
            h = false;
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.e(h);
            }
          } while ((!jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a()) || (!jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(h)) || (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener == null));
          jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.b(i, h);
          return;
          if ("android.intent.action.SCREEN_OFF".equals(str))
          {
            a(false);
            ShortVideoPTVItemBuilder.a(jdField_a_of_type_ComTencentWidgetXListView);
            return;
          }
          if (!"android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED".equals(str)) {
            break label440;
          }
          m = paramIntent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
        } while ((m != 2) && (m != 0));
        paramContext = jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer;
        if (m == 2) {}
        for (;;)
        {
          paramContext.d(bool1);
          if (b())
          {
            bool1 = AudioHelper.a(BaseApplicationImpl.getContext());
            jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.b(bool1);
            if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
              jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.a(AudioSettingManager.a(BaseApplicationImpl.getContext()), bool1, h, false);
            }
          }
          if (m != 0) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.d();
          return;
          bool1 = false;
        }
      } while (!"android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED".equals(str));
      m = paramIntent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
    } while ((m != 2) && (m != 0));
    paramContext = jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer;
    if (m == 2) {}
    for (bool1 = bool2;; bool1 = false)
    {
      paramContext.c(bool1);
      if (b())
      {
        bool1 = AudioHelper.a(BaseApplicationImpl.getContext());
        jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.b(bool1);
        if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener != null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.a(AudioSettingManager.a(BaseApplicationImpl.getContext()), bool1, h, false);
        }
      }
      if (m != 2) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.d();
      return;
    }
  }
  
  public void onSensorChanged(SensorEvent paramSensorEvent)
  {
    if ((AudioSettingManager.a(BaseApplicationImpl.getContext())) || (AIOUtils.b())) {}
    label222:
    label224:
    do
    {
      do
      {
        do
        {
          for (;;)
          {
            return;
            if (values[0] < jdField_d_of_type_Float) {}
            for (boolean bool1 = true;; bool1 = false)
            {
              if (((!AudioHelper.a()) && (bool1) && (!jdField_a_of_type_Boolean)) || (i == bool1) || (!b())) {
                break label222;
              }
              boolean bool2 = AudioSettingManager.a(BaseApplicationImpl.getContext());
              boolean bool3 = AudioHelper.a(BaseApplicationImpl.getContext());
              i = bool1;
              if (QLog.isColorLevel()) {
                QLog.d(jdField_a_of_type_JavaLangString, 2, "ProximityEventListener$onSensorChanged | currentSpeaker = " + h + " | mNearToEar = " + i + " | wiredHeadsetConnected = " + bool2 + " | btHeadsetConnect = " + bool3);
              }
              if ((bool2) || (bool3)) {
                break;
              }
              if ((!i) || (!h)) {
                break label224;
              }
              h = false;
              jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(h);
              if (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener == null) {
                break;
              }
              jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.b(i, h);
              return;
            }
          }
          if (!i) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(h, true);
        } while (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener == null);
        jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.b(i, h);
        return;
      } while ((i) || (h));
      h = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.t();
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer.a(h);
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener == null);
    jdField_a_of_type_ComTencentMobileqqActivityAioMediaPlayerManager$Listener.b(i, h);
  }
  
  public void run()
  {
    if ((jdField_b_of_type_AndroidHardwareSensor != null) && (jdField_a_of_type_AndroidHardwareSensor != null))
    {
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_AndroidHardwareSensorManager.registerListener(jdField_a_of_type_Kqp, jdField_b_of_type_AndroidHardwareSensor, 3);
    }
    if (jdField_a_of_type_AndroidHardwareSensor != null) {
      jdField_a_of_type_AndroidHardwareSensorManager.registerListener(this, jdField_a_of_type_AndroidHardwareSensor, 3);
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "$requestPlay| mAccelerationSensro=" + jdField_b_of_type_AndroidHardwareSensor + " | mProximitySensor = " + jdField_a_of_type_AndroidHardwareSensor);
    }
  }
}
