package android.support.v7.internal.text;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.text.method.TransformationMethod;
import android.view.View;
import java.util.Locale;

public class AllCapsTransformationMethod
  implements TransformationMethod
{
  private Locale mLocale;
  
  public AllCapsTransformationMethod(Context paramContext)
  {
    mLocale = getResourcesgetConfigurationlocale;
  }
  
  public CharSequence getTransformation(CharSequence paramCharSequence, View paramView)
  {
    if (paramCharSequence != null) {
      return paramCharSequence.toString().toUpperCase(mLocale);
    }
    return null;
  }
  
  public void onFocusChanged(View paramView, CharSequence paramCharSequence, boolean paramBoolean, int paramInt, Rect paramRect) {}
}
