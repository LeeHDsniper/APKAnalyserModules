package com.tencent.mobileqq.activity.specialcare;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.app.CheckPttListener;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.widget.QQToastNotifier;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import mqb;
import mqc;
import mqd;
import mqe;
import mqf;
import mqg;
import mqh;
import mqi;
import org.json.JSONObject;

public class QvipSpecialSoundActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener
{
  private static final int jdField_a_of_type_Int = 0;
  public static final String a = "friendUin";
  private static final int jdField_b_of_type_Int = 1;
  private static final long jdField_b_of_type_Long = 90000L;
  private static final String jdField_b_of_type_JavaLangString = "SpecialSoundActivity";
  private static final int jdField_c_of_type_Int = 2;
  private static final String d = "mvip.gongneng.mobileqq.tiexintixing.ringandroid";
  private static final String e = "mvip.gongneng.mobileqq.tiexintixing.listandroid";
  private long jdField_a_of_type_Long;
  private Intent jdField_a_of_type_AndroidContentIntent;
  private MediaPlayer jdField_a_of_type_AndroidMediaMediaPlayer;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private QvipSpecialSoundActivity.SpecialSoundAdapter jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity$SpecialSoundAdapter;
  private QvipSpecialSoundManager jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager;
  private QvipSpecialCareObserver jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver;
  private QQToastNotifier jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  public List a;
  private boolean jdField_a_of_type_Boolean;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private String jdField_c_of_type_JavaLangString;
  
  public QvipSpecialSoundActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = null;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new mqc(this);
    jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver = new mqg(this);
  }
  
  private void a()
  {
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131302755));
    setLeftViewName(2131367694);
    View localView = LayoutInflater.from(this).inflate(2130904474, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131302757));
    b = ((TextView)localView.findViewById(2131302758));
    jdField_a_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131302761));
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localView.findViewById(2131302756));
    jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(this);
  }
  
  private void a(int paramInt)
  {
    mqi localMqi = (mqi)QvipSpecialSoundManager.b.get(String.valueOf(paramInt));
    if (localMqi != null) {
      if (c == 0) {
        b(getString(2131370675));
      }
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.i("SpecialSoundActivity", 2, "用户设置的铃音没有包含在铃音配置文件中，有问题（素材管理系统出问题了）");
  }
  
  private void a(Uri paramUri)
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer == null) {
      jdField_a_of_type_AndroidMediaMediaPlayer = new MediaPlayer();
    }
    try
    {
      if (jdField_a_of_type_AndroidMediaMediaPlayer == null) {
        return;
      }
      jdField_a_of_type_AndroidMediaMediaPlayer.reset();
      jdField_a_of_type_AndroidMediaMediaPlayer.setDataSource(this, paramUri);
      jdField_a_of_type_AndroidMediaMediaPlayer.setAudioStreamType(3);
      jdField_a_of_type_AndroidMediaMediaPlayer.prepare();
      jdField_a_of_type_AndroidMediaMediaPlayer.start();
      jdField_a_of_type_AndroidMediaMediaPlayer.setLooping(false);
      return;
    }
    catch (Exception paramUri)
    {
      paramUri.printStackTrace();
    }
  }
  
  private void a(String paramString, int paramInt)
  {
    if (!NetworkUtil.e(this))
    {
      b(getString(2131368515));
      return;
    }
    startTitleProgress();
    jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(Message.obtain(jdField_a_of_type_AndroidOsHandler, 2), 90000L);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString);
    paramString = new ArrayList();
    paramString.add(String.valueOf(paramInt));
    if (paramInt == 1)
    {
      QvipSpecialCareManager.a(localArrayList, 2, paramString, app);
      return;
    }
    QvipSpecialCareManager.a(localArrayList, 3, paramString, app);
  }
  
  private boolean a()
  {
    return (!app.k()) && (!app.l()) && (app.m()) && ((app.a() == null) || (!app.a().e()));
  }
  
  private boolean a(long paramLong1, long paramLong2)
  {
    return Math.abs(paramLong2 - paramLong1) > 300L;
  }
  
  private void b()
  {
    jdField_a_of_type_AndroidContentIntent = getIntent();
    c = jdField_a_of_type_AndroidContentIntent.getStringExtra("friendUin");
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager = new QvipSpecialSoundManager(this, app);
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity$SpecialSoundAdapter = new QvipSpecialSoundActivity.SpecialSoundAdapter(this);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity$SpecialSoundAdapter);
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    app.a(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
    if (VipUtils.a(app))
    {
      jdField_a_of_type_AndroidWidgetButton.setText(getString(2131370660));
      return;
    }
    jdField_a_of_type_AndroidWidgetButton.setText(getString(2131370659));
  }
  
  private void b(String paramString)
  {
    if (!isFinishing())
    {
      if (jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier == null) {
        jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier = new QQToastNotifier(this);
      }
      jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier.a(paramString, getTitleBarHeight(), 0, 0);
    }
  }
  
  private void c()
  {
    String str = "key_special_sound_list" + app.a();
    if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a())
    {
      startTitleProgress();
      jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(new mqb(this, str));
      return;
    }
    jdField_a_of_type_JavaUtilList = ((List)QvipSpecialSoundManager.jdField_a_of_type_JavaUtilHashMap.get(str));
  }
  
  private void c(String paramString)
  {
    DialogUtil.a(this, 230, getString(2131367267), paramString, 2131366996, 2131370668, new mqe(this), new mqf(this)).show();
  }
  
  private void d()
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundActivity$SpecialSoundAdapter.a(jdField_a_of_type_JavaUtilList);
    int i = QvipSpecialCareManager.a(c, app);
    if (i == 1)
    {
      f();
      return;
    }
    a(i);
  }
  
  private void e()
  {
    a(c, 1);
    if (a())
    {
      h();
      a(Uri.parse("android.resource://" + getApplicationContext().getPackageName() + "/" + 2131165205));
    }
  }
  
  private void f()
  {
    jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302759).setVisibility(0);
    b.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  private void g()
  {
    jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302759).setVisibility(8);
    b.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
  }
  
  private void h()
  {
    if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (jdField_a_of_type_AndroidMediaMediaPlayer.isPlaying())) {
      jdField_a_of_type_AndroidMediaMediaPlayer.stop();
    }
  }
  
  public void a(View paramView)
  {
    long l = System.currentTimeMillis();
    if (!a(jdField_a_of_type_Long, l)) {}
    Object localObject;
    label214:
    do
    {
      int i;
      do
      {
        for (;;)
        {
          return;
          jdField_a_of_type_Long = l;
          localObject = (mqh)paramView.getTag();
          if (localObject != null)
          {
            i = jdField_a_of_type_Int;
            if (VipUtils.a(app)) {
              a(c, jdField_a_of_type_Int);
            }
            while (a())
            {
              try
              {
                h();
                if (i != 1) {
                  break label214;
                }
                a(Uri.parse("android.resource://" + getApplicationContext().getPackageName() + "/" + 2131165205));
                return;
              }
              catch (Exception paramView)
              {
                if (QLog.isColorLevel()) {
                  QLog.i("SpecialSoundActivity", 2, "onItemClick play music exception:" + paramView.getMessage());
                }
                paramView.printStackTrace();
                return;
              }
              if (!jdField_a_of_type_Boolean)
              {
                c(String.format(getString(2131370666), new Object[] { Integer.valueOf(QvipSpecialCareManager.b(app)) }));
                jdField_a_of_type_Boolean = true;
              }
            }
          }
        }
      } while (i <= 1);
      paramView = new File(getFilesDir(), jdField_a_of_type_JavaLangString);
      if (paramView.exists())
      {
        a(paramView.getAbsolutePath());
        return;
      }
      if (!NetworkUtil.e(this))
      {
        b(getString(2131368515));
        return;
      }
      localObject = jdField_a_of_type_JavaLangString;
    } while (jdField_a_of_type_JavaUtilHashMap.containsKey(localObject));
    jdField_a_of_type_JavaUtilHashMap.put(localObject, Boolean.valueOf(true));
    startTitleProgress();
    app.a(new mqd(this, (String)localObject, paramView));
  }
  
  public void a(String paramString)
  {
    if (jdField_a_of_type_AndroidMediaMediaPlayer == null) {
      jdField_a_of_type_AndroidMediaMediaPlayer = new MediaPlayer();
    }
    try
    {
      if ((jdField_a_of_type_AndroidMediaMediaPlayer != null) && (paramString != null))
      {
        if (TextUtils.isEmpty(paramString)) {
          return;
        }
        jdField_a_of_type_AndroidMediaMediaPlayer.reset();
        paramString = new FileInputStream(paramString);
      }
      return;
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        try
        {
          jdField_a_of_type_AndroidMediaMediaPlayer.setDataSource(paramString.getFD());
          jdField_a_of_type_AndroidMediaMediaPlayer.setAudioStreamType(3);
          jdField_a_of_type_AndroidMediaMediaPlayer.prepare();
          jdField_a_of_type_AndroidMediaMediaPlayer.start();
          jdField_a_of_type_AndroidMediaMediaPlayer.setLooping(false);
          if (paramString == null) {
            break;
          }
          try
          {
            paramString.close();
            return;
          }
          catch (IOException paramString)
          {
            paramString.printStackTrace();
            return;
          }
          localException1 = localException1;
          paramString = null;
        }
        catch (Exception localException2)
        {
          continue;
        }
        localException1.printStackTrace();
      }
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130904473);
    setTitle(2131370657);
    a();
    b();
    c();
    return true;
  }
  
  protected void doOnDestroy()
  {
    h();
    if (jdField_a_of_type_AndroidMediaMediaPlayer != null)
    {
      jdField_a_of_type_AndroidMediaMediaPlayer.release();
      jdField_a_of_type_AndroidMediaMediaPlayer = null;
    }
    if (app != null) {
      app.b(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
    }
    if (jdField_a_of_type_AndroidOsHandler != null)
    {
      jdField_a_of_type_AndroidOsHandler.removeMessages(0);
      jdField_a_of_type_AndroidOsHandler.removeMessages(1);
      jdField_a_of_type_AndroidOsHandler.removeMessages(2);
    }
    super.doOnDestroy();
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier != null)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier.a();
      jdField_a_of_type_ComTencentMobileqqWidgetQQToastNotifier = null;
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    d();
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt2 != -1) {}
    for (;;)
    {
      return;
      if ((paramInt1 == 4) && (paramIntent != null))
      {
        paramIntent = paramIntent.getStringExtra("result");
        try
        {
          if ((new JSONObject(paramIntent).getInt("resultCode") == 0) && (jdField_a_of_type_AndroidOsHandler != null))
          {
            paramIntent = Message.obtain(jdField_a_of_type_AndroidOsHandler, 1);
            jdField_a_of_type_AndroidOsHandler.sendMessage(paramIntent);
            return;
          }
        }
        catch (Exception paramIntent)
        {
          paramIntent.printStackTrace();
        }
      }
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131302761: 
      VipUtils.b(this, 3, "mvip.gongneng.mobileqq.tiexintixing.listandroid");
      return;
    case 2131302756: 
      e();
      return;
    }
    a(paramView);
  }
}
