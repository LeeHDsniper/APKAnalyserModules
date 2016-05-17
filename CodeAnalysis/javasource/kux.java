import android.content.Context;
import android.util.Log;
import com.tencent.ark.ark.ArgumentsWrapper;
import com.tencent.ark.ark.ModuleCallbackWrapper;
import com.tencent.ark.ark.VariantConstWrapper;
import com.tencent.ark.ark.VariantWrapper;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import mqq.manager.TicketManager;

public class kux
  implements ark.ModuleCallbackWrapper
{
  public kux(ArkContainerWrapper paramArkContainerWrapper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public String GetTypeName()
  {
    return ArkContainerWrapper.a();
  }
  
  public boolean HasMenthod(String paramString)
  {
    if (paramString.equals("Log")) {}
    while ((paramString.equals("GetSkey")) || (paramString.equals("Navigate")) || (paramString.equals("GetUIN")) || (paramString.equals("ReportClickEvent")) || (paramString.equals("GetPlatformVersion")) || (paramString.equals("GetEngineVersion"))) {
      return true;
    }
    return false;
  }
  
  public boolean Invoke(String paramString, ark.ArgumentsWrapper paramArgumentsWrapper, ark.VariantWrapper paramVariantWrapper)
  {
    if (paramString.equals("Log"))
    {
      if (paramArgumentsWrapper.GetCount() == 1L)
      {
        paramString = paramArgumentsWrapper.GetArgument(0L).GetString();
        if ((paramString != null) && (paramString.length() > 0)) {
          Log.d("ark.Log", paramString);
        }
      }
      return true;
    }
    if (paramString.equals("GetSkey"))
    {
      paramArgumentsWrapper = "";
      paramString = paramArgumentsWrapper;
      if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference != null)
      {
        paramString = paramArgumentsWrapper;
        if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get() != null) {
          paramString = ((TicketManager)((QQAppInterface)ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get()).getManager(2)).getSkey(((QQAppInterface)ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get()).a());
        }
      }
      paramVariantWrapper.SetString(paramString);
      if (paramString != null) {
        Log.d("ark.GetSkey ", paramString);
      }
      return true;
    }
    if (paramString.equals("Navigate"))
    {
      if ((ArkContainerWrapper.b != null) && (ArkContainerWrapper.b.get() != null) && (paramArgumentsWrapper.GetCount() == 1L))
      {
        paramString = paramArgumentsWrapper.GetArgument(0L).GetString();
        if ((paramString != null) && (paramString.length() > 0))
        {
          ArkContainerWrapper.a((Context)ArkContainerWrapper.b.get(), paramString, true, 0L);
          Log.d("ark.Navigate ", paramString);
        }
      }
      return true;
    }
    if (paramString.equals("GetUIN"))
    {
      paramArgumentsWrapper = "";
      paramString = paramArgumentsWrapper;
      if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference != null)
      {
        paramString = paramArgumentsWrapper;
        if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get() != null) {
          paramString = ((QQAppInterface)ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get()).a();
        }
      }
      paramVariantWrapper.SetString(paramString);
      if (paramString != null) {
        Log.d("ark.GetUIN ", paramString);
      }
      return true;
    }
    if (paramString.equals("ReportClickEvent"))
    {
      if ((paramArgumentsWrapper.GetCount() == 3L) && (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference != null) && (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get() != null) && (ArkContainerWrapper.jdField_a_of_type_JavaUtilArrayList != null))
      {
        paramVariantWrapper = paramArgumentsWrapper.GetArgument(0L).GetString();
        int i = (int)Math.round(paramArgumentsWrapper.GetArgument(1L).GetDouble());
        String str = paramArgumentsWrapper.GetArgument(2L).GetString();
        if ((paramVariantWrapper != null) && (str != null))
        {
          paramArgumentsWrapper = "";
          paramString = paramArgumentsWrapper;
          if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference != null)
          {
            paramString = paramArgumentsWrapper;
            if (ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get() != null) {
              paramString = ((QQAppInterface)ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get()).a();
            }
          }
          QLog.d("ArkApp", 4, String.format("ark ReportClickEvent  msgid: %s", new Object[] { paramVariantWrapper }));
          long l = NetConnInfoCenter.getServerTime();
          ReportController.b((QQAppInterface)ArkContainerWrapper.jdField_a_of_type_JavaLangRefWeakReference.get(), "CliOper", "", paramString, "0X8005FFE", "0X8005FFE", i, 0, Long.toString(l), paramVariantWrapper, str, "");
        }
      }
      return true;
    }
    if (paramString.equals("GetPlatformVersion"))
    {
      paramVariantWrapper.SetString("6.3.3");
      return true;
    }
    if (paramString.equals("GetEngineVersion"))
    {
      paramVariantWrapper.SetInt(2);
      return true;
    }
    return false;
  }
}
