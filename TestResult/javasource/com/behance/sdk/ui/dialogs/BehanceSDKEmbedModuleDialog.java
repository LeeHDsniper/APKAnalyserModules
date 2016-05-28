package com.behance.sdk.ui.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.Toast;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.managers.BehanceSDKProjectPublishWFManager;
import com.behance.sdk.project.modules.EmbedModule;

public class BehanceSDKEmbedModuleDialog
  extends Dialog
  implements View.OnClickListener
{
  public BehanceSDKEmbedModuleDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  public static BehanceSDKEmbedModuleDialog getInstance(Context paramContext)
  {
    return new BehanceSDKEmbedModuleDialog(paramContext);
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.bsdkAddProjectEmbedContentDialogNotOKBtn) {
      dismiss();
    }
    while (i != R.id.bsdkAddProjectEmbedContentDialogOKBtn) {
      return;
    }
    paramView = ((EditText)findViewById(R.id.bsdkAddProjectEmbedContentDialogContentTxt)).getText().toString();
    if ((paramView.length() < 5) || (!paramView.contains("<")) || (!paramView.contains(">")))
    {
      Toast.makeText(getContext(), getContext().getResources().getString(R.string.bsdk_add_project_embed_content_error), 0).show();
      return;
    }
    BehanceSDKProjectPublishWFManager.getInstance().addModuleToCurrentProject(new EmbedModule(paramView));
    dismiss();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(R.layout.bsdk_dialog_fragment_publish_project_embed_content);
    setCancelable(true);
    findViewById(R.id.bsdkAddProjectEmbedContentDialogNotOKBtn).setOnClickListener(this);
    findViewById(R.id.bsdkAddProjectEmbedContentDialogOKBtn).setOnClickListener(this);
  }
}
