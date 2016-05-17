import android.content.Context;
import android.os.SystemClock;
import com.rookery.translate.model.TransDiskCache;
import com.rookery.translate.model.TransMemCache;
import com.rookery.translate.model.TranslateCache;
import com.rookery.translate.type.Language;
import com.rookery.translate.type.TranslateCallback;
import com.rookery.translate.type.TranslateError;
import com.tencent.mobileqq.activity.aio.item.TextTranslationItemBuilder;
import com.tencent.mobileqq.activity.aio.item.TextTranslationItemBuilder.Holder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.QLog;

public class lbr
  implements TranslateCallback
{
  public lbr(TextTranslationItemBuilder paramTextTranslationItemBuilder, TextTranslationItemBuilder.Holder paramHolder, Context paramContext, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(long paramLong, String paramString1, Language paramLanguage, String paramString2, TextTranslationItemBuilder.Holder paramHolder)
  {
    TextTranslationItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder, jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder);
    if (paramHolder != null) {
      TranslateCache.a(jdField_a_of_type_AndroidContentContext).a(jdField_a_of_type_JavaLangString, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, Boolean.valueOf(false));
    }
    String str;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder != null)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Translator", 2, "[ChatAdapter]holder id:" + jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.jdField_a_of_type_Long + "request id:" + paramLong);
      }
      if ((!paramString1.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.jdField_a_of_type_JavaLangString)) || (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.jdField_a_of_type_Long != paramLong) || (paramHolder == null) || (jdField_b_of_type_AndroidViewView == null) || (jdField_a_of_type_AndroidContentContext == null)) {
        break label481;
      }
      if (!paramLanguage.toString().equalsIgnoreCase(jdField_a_of_type_JavaLangString)) {
        break label317;
      }
      TextTranslationItemBuilder.l += 1;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e != 0) {
        break label389;
      }
      str = "0";
      label180:
      StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_AndroidContentContext).a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "", "Translate_external", "Translate_external", 0, 1, 0, String.valueOf(SystemClock.uptimeMillis() - jdField_b_of_type_Long), str, paramLanguage.toString(), jdField_a_of_type_JavaLangString);
      if ((paramLanguage.toString().equalsIgnoreCase(jdField_a_of_type_JavaLangString)) || (paramString2.equalsIgnoreCase(paramString1))) {
        break label434;
      }
      paramLanguage = TranslateCache.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_AndroidContentContext.getApplicationContext());
      if (paramLanguage != null) {
        paramLanguage.a(paramString1, paramString2, paramLong, Boolean.valueOf(true), jdField_a_of_type_JavaLangString);
      }
      f = 1;
      jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a();
    }
    label317:
    label389:
    label434:
    label481:
    do
    {
      return;
      if ((paramLanguage.toString().equalsIgnoreCase("zh-CHS")) && (jdField_a_of_type_JavaLangString.equalsIgnoreCase("zh-CN")))
      {
        TextTranslationItemBuilder.l += 1;
        break;
      }
      if ((!paramLanguage.toString().equalsIgnoreCase("zh-CHT")) || (!jdField_a_of_type_JavaLangString.equalsIgnoreCase("zh-TW"))) {
        break;
      }
      TextTranslationItemBuilder.l += 1;
      break;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e == 1)
      {
        str = "1";
        break label180;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e == 3000)
      {
        str = "2";
        break label180;
      }
      str = "";
      break label180;
      paramLanguage = TranslateCache.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_AndroidContentContext.getApplicationContext());
      if (paramLanguage != null) {
        paramLanguage.a(paramString1, paramString2, paramLong, Boolean.valueOf(false), jdField_a_of_type_JavaLangString);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a(2131370241);
      return;
      if ((!paramLanguage.toString().equalsIgnoreCase(jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_AndroidContentContext != null))
      {
        TranslateCache.a(jdField_a_of_type_AndroidContentContext).a(paramString1, paramString2, paramLong, Boolean.valueOf(true), jdField_a_of_type_JavaLangString);
        return;
      }
    } while (jdField_a_of_type_AndroidContentContext == null);
    TranslateCache.a(jdField_a_of_type_AndroidContentContext).a(paramString1, paramString2, paramLong, Boolean.valueOf(false), jdField_a_of_type_JavaLangString);
  }
  
  public void a(long paramLong, String paramString, TranslateError paramTranslateError, TextTranslationItemBuilder.Holder paramHolder)
  {
    TextTranslationItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder, jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder);
    if (paramHolder != null) {
      TranslateCache.a(jdField_a_of_type_AndroidContentContext).a(jdField_a_of_type_JavaLangString, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, Boolean.valueOf(false));
    }
    if ((paramHolder != null) && (jdField_b_of_type_AndroidViewView != null) && (paramTranslateError != null)) {
      if ((paramTranslateError.getMessage() != null) && (paramTranslateError.getMessage().length() > 0)) {
        if ((paramTranslateError.getMessage().indexOf("Unable to resolve host") >= 0) || (paramTranslateError.getMessage().indexOf("can't resolve host") >= 0))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a(2131370242);
          if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e != 0) {
            break label232;
          }
          paramString = "0";
          StatisticCollector.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_AndroidContentContext).a(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "", "Translate_external", "Translate_external", 0, 1, 1, "", paramString, "", "");
          if (QLog.isColorLevel()) {
            QLog.e("Translator", 2, "onFailed:" + paramTranslateError);
          }
        }
      }
    }
    label232:
    while (!QLog.isColorLevel()) {
      for (;;)
      {
        return;
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a(2131370240);
        continue;
        jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a(2131370243);
        continue;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e == 1) {
          paramString = "1";
        } else if (jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.e == 3000) {
          paramString = "2";
        } else {
          paramString = "";
        }
      }
    }
    QLog.e("Translator", 2, "onFailed:e is null");
  }
}
