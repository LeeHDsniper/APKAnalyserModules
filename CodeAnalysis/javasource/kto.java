import android.animation.AnimatorSet;
import android.animation.AnimatorSet.Builder;
import android.animation.ObjectAnimator;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenChangeVoicePanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToChangeVoicePanel;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.preop.PttPreSendManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;

public class kto
  implements Runnable
{
  public kto(PressToChangeVoicePanel paramPressToChangeVoicePanel, String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("changevoice", 2, "recored end callback , pie is null !!");
      }
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    Object localObject = (ListenChangeVoicePanel)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.f.findViewById(2131299331);
    ((ListenChangeVoicePanel)localObject).e();
    ((ListenChangeVoicePanel)localObject).setVisibility(0);
    ((ListenChangeVoicePanel)localObject).setAudioPath(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_Double, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(4);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.setClickable(true);
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005850", "0X8005850", 0, 0, "", "", Double.toString(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.jdField_a_of_type_Double), "");
    }
    localObject = (ViewGroup)((ListenChangeVoicePanel)localObject).findViewById(2131300854);
    if (VersionUtils.e())
    {
      ObjectAnimator localObjectAnimator1 = ObjectAnimator.ofFloat(localObject, "scaleX", new float[] { 0.4F, 1.0F });
      ObjectAnimator localObjectAnimator2 = ObjectAnimator.ofFloat(localObject, "scaleY", new float[] { 0.4F, 1.0F });
      ObjectAnimator localObjectAnimator3 = ObjectAnimator.ofFloat(localObject, "alpha", new float[] { 0.4F, 1.0F });
      AnimatorSet localAnimatorSet = new AnimatorSet();
      localAnimatorSet.play(localObjectAnimator1).with(localObjectAnimator2).with(localObjectAnimator3);
      localAnimatorSet.setDuration(300L);
      localAnimatorSet.addListener(new ktp(this, (ViewGroup)localObject));
      localAnimatorSet.start();
      return;
    }
    ((ViewGroup)localObject).setVisibility(0);
  }
}
