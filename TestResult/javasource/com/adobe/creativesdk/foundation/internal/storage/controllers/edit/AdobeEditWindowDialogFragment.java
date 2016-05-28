package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationPublicLinkCallBack;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLongClickBaseDialogFragment;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLongClickMenuItem;
import com.adobe.creativesdk.foundation.internal.utils.IAdobeLongMenuItemClickListener;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AdobeEditWindowDialogFragment
  extends AdobeLongClickBaseDialogFragment
{
  private final int MOVE_FILE_BROWSER_REQUEST = 100;
  private AdobeCloud _cloud;
  protected AlertDialog alertDialog;
  protected View alertNegativeButton;
  protected View alertPositiveButton;
  protected TextView alertText;
  protected AlertDialog.Builder builder;
  public View dialogView;
  private IAdobeEditAssetCallback editCallback;
  private ProgressDialog fetchLinkDialog;
  private boolean isClipboardPresent = false;
  private String newLocation = "";
  
  public AdobeEditWindowDialogFragment(Context paramContext, String paramString)
  {
    super(paramContext, paramString);
    paramContext = generateMenuItemList();
    setStartPriority(5);
    addCustomMenuItems(paramContext);
  }
  
  private AdobeLongClickMenuItem createEraseMenuItem()
  {
    Drawable localDrawable = getDrawableFromResource(R.drawable.ic_delete_black_24dp);
    new AdobeLongClickMenuItem(getStringFromResource(R.string.adobe_asset_view_edit_delete_button), localDrawable, 4, new IAdobeLongMenuItemClickListener()
    {
      public void handleClick()
      {
        AdobeEditWindowDialogFragment.this.showDeleteAlert();
      }
    });
  }
  
  private AdobeLongClickMenuItem createLinkMenuItem()
  {
    Drawable localDrawable = getDrawableFromResource(R.drawable.ic_link_black_24dp);
    new AdobeLongClickMenuItem(getStringFromResource(R.string.adobe_asset_view_send_link_button), localDrawable, 1, new IAdobeLongMenuItemClickListener()
    {
      public void handleClick()
      {
        AdobeEditWindowDialogFragment.this.handlePublicLinkEvent();
      }
    });
  }
  
  private AdobeLongClickMenuItem createMoveMenuItem()
  {
    Drawable localDrawable = getDrawableFromResource(R.drawable.ic_move_black_24dp);
    new AdobeLongClickMenuItem(getStringFromResource(R.string.adobe_asset_view_edit_move_button), localDrawable, 3, new IAdobeLongMenuItemClickListener()
    {
      public void handleClick()
      {
        AdobeEditWindowDialogFragment.this.handleMoveEvent();
      }
    });
  }
  
  private AdobeLongClickMenuItem createRenameMenuItem()
  {
    Drawable localDrawable = getDrawableFromResource(R.drawable.ic_edit_black_24dp);
    new AdobeLongClickMenuItem(getStringFromResource(R.string.adobe_asset_edit_rename_button), localDrawable, 2, new IAdobeLongMenuItemClickListener()
    {
      public void handleClick()
      {
        AdobeEditWindowDialogFragment.this.handleRenameEvent();
      }
    });
  }
  
  private void errorFetchLink()
  {
    if (fetchLinkDialog != null) {
      fetchLinkDialog.dismiss();
    }
    Toast.makeText(getActivity(), getResources().getString(R.string.adobe_asset_view_error_fetch_link), 1).show();
    setEditWindowVisible();
  }
  
  private ArrayList<AdobeLongClickMenuItem> generateMenuItemList()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(createRenameMenuItem());
    localArrayList.add(createLinkMenuItem());
    localArrayList.add(createMoveMenuItem());
    localArrayList.add(createEraseMenuItem());
    return localArrayList;
  }
  
  private Drawable getDrawableFromResource(int paramInt)
  {
    return getContext().getResources().getDrawable(paramInt);
  }
  
  private String getStringFromResource(int paramInt)
  {
    return getContext().getResources().getString(paramInt);
  }
  
  private void handleEraseEvent()
  {
    startEditSession(AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE);
  }
  
  private void handleMoveEvent()
  {
    Intent localIntent = new Intent(getActivity(), AdobeAssetEditActivity.class);
    ((AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(0)).getHref().toString();
    Bundle localBundle1 = new Bundle();
    Bundle localBundle2 = new Bundle();
    localBundle2.putSerializable("EDIT_ACTIVITY_OPERATION_MODE", AdobeAssetViewEditActivityOperationMode.ADOBE_ASSET_VIEW_EDIT_ACTIVITY_OPERATION_MODE_MOVE);
    localBundle2.putSerializable(AdobeAssetViewEditActivityConfiguration.ADOBE_CLOUD_KEY, _cloud);
    localBundle1.putBundle("EDIT_ACTIVITY_CONFIGURATION", localBundle2);
    localIntent.putExtras(localBundle1);
    startActivityForResult(localIntent, 100);
    endDialogFragment();
  }
  
  private void handlePublicLinkEvent()
  {
    setEditWindowGone();
    fetchLinkDialog = ProgressDialog.show(getActivity(), null, getString(R.string.adobe_asset_view_dialog_fetch_link));
    final AdobeAsset localAdobeAsset = (AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(0);
    final AdobeCollaborationSession localAdobeCollaborationSession = AdobeCollaborationSession.getSharedSession();
    if ((localAdobeAsset instanceof AdobeAssetFolder)) {}
    for (final String str = "application/vnd.adobe.directory+json";; str = ((AdobeAssetFile)localAdobeAsset).getType())
    {
      IAdobeCollaborationPublicLinkCallBack local5 = new IAdobeCollaborationPublicLinkCallBack()
      {
        public void onComplete(String paramAnonymousString)
        {
          AdobeEditWindowDialogFragment.this.openShareChooser(paramAnonymousString);
        }
        
        public void onError(int paramAnonymousInt)
        {
          if (paramAnonymousInt == 404)
          {
            IAdobeCollaborationPublicLinkCallBack local1 = new IAdobeCollaborationPublicLinkCallBack()
            {
              public void onComplete(String paramAnonymous2String)
              {
                AdobeEditWindowDialogFragment.this.openShareChooser(paramAnonymous2String);
              }
              
              public void onError(int paramAnonymous2Int)
              {
                AdobeEditWindowDialogFragment.this.errorFetchLink();
              }
            };
            localAdobeCollaborationSession.createNewLink(localAdobeAsset.getHref().toString(), str, localAdobeAsset.getName(), true, true, local1);
            return;
          }
          AdobeEditWindowDialogFragment.this.errorFetchLink();
        }
      };
      localAdobeCollaborationSession.retrieveLink(localAdobeAsset.getHref().toString(), str, local5);
      return;
    }
  }
  
  private void handleRenameEvent()
  {
    setEditWindowGone();
    startEditSession(AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME);
  }
  
  private void openShareChooser(String paramString)
  {
    if (fetchLinkDialog != null) {
      fetchLinkDialog.dismiss();
    }
    Object localObject1 = new Intent("android.intent.action.SEND");
    ((Intent)localObject1).setType("text/plain");
    Object localObject2 = getActivity().getPackageManager().queryIntentActivities((Intent)localObject1, 0);
    Object localObject3 = ((List)localObject2).iterator();
    while (((Iterator)localObject3).hasNext()) {
      if (nextactivityInfo.name.equals("com.google.android.apps.docs.app.SendTextToClipboardActivity")) {
        isClipboardPresent = true;
      }
    }
    if (isClipboardPresent)
    {
      localObject1 = new ArrayList();
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Object localObject4 = (ResolveInfo)((Iterator)localObject2).next();
        localObject3 = activityInfo.packageName;
        localObject4 = activityInfo.name;
        if (!((String)localObject4).equals("com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity"))
        {
          Intent localIntent = new Intent("android.intent.action.SEND");
          localIntent.setType("text/plain");
          localIntent.putExtra("android.intent.extra.TEXT", paramString);
          localIntent.setPackage((String)localObject3);
          localIntent.setClassName((String)localObject3, (String)localObject4);
          ((List)localObject1).add(localIntent);
        }
      }
      paramString = Intent.createChooser((Intent)((List)localObject1).remove(0), null);
      paramString.putExtra("android.intent.extra.INITIAL_INTENTS", (Parcelable[])((List)localObject1).toArray(new Parcelable[0]));
      startActivity(paramString);
    }
    for (;;)
    {
      endDialogFragment();
      return;
      ((Intent)localObject1).putExtra("android.intent.extra.TEXT", paramString);
      startActivity(Intent.createChooser((Intent)localObject1, null));
    }
  }
  
  private void setEditWindowGone()
  {
    if (getView() != null) {
      getView().setVisibility(4);
    }
  }
  
  private void setEditWindowVisible()
  {
    if (getView() != null) {
      getView().setVisibility(0);
    }
  }
  
  private void showDeleteAlert()
  {
    setEditWindowGone();
    if (dialogView == null)
    {
      dialogView = getLayoutInflater(null).inflate(R.layout.adobe_alert_dialog_view, null);
      builder = new AlertDialog.Builder(getDialog().getContext());
      builder.setView(dialogView);
      alertText = ((TextView)dialogView.findViewById(R.id.alert_dialog_box_title_text));
      alertPositiveButton = dialogView.findViewById(R.id.alert_dialog_box_positive_button);
      alertNegativeButton = dialogView.findViewById(R.id.alert_dialog_box_negative_button);
      alertDialog = builder.create();
    }
    ((TextView)alertPositiveButton).setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_positive_button));
    ((TextView)alertNegativeButton).setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_negative_button));
    if ((AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(0) instanceof AdobeAssetFile)) {
      alertText.setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_message_file));
    }
    for (;;)
    {
      alertPositiveButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          alertDialog.dismiss();
          AdobeEditWindowDialogFragment.this.handleEraseEvent();
        }
      });
      alertNegativeButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          alertDialog.dismiss();
          AdobeEditWindowDialogFragment.this.setEditWindowVisible();
        }
      });
      alertDialog.setOnDismissListener(new DialogInterface.OnDismissListener()
      {
        public void onDismiss(DialogInterface paramAnonymousDialogInterface)
        {
          AdobeEditWindowDialogFragment.this.setEditWindowVisible();
        }
      });
      alertDialog.show();
      return;
      alertText.setText(getResources().getString(R.string.adobe_asset_view_edit_delete_dialog_message_folder));
    }
  }
  
  private void startEditSession(AdobeCCFilesEditOperation paramAdobeCCFilesEditOperation)
  {
    FragmentManager localFragmentManager = getFragmentManager();
    if (paramAdobeCCFilesEditOperation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE)
    {
      AdobeCCFilesEditManager.createSession(newLocation, localFragmentManager, paramAdobeCCFilesEditOperation, editCallback, _cloud).startEditSession();
      endDialogFragment();
      return;
    }
    if (paramAdobeCCFilesEditOperation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME)
    {
      AdobeCCFilesEditManager.createSession(newLocation, localFragmentManager, paramAdobeCCFilesEditOperation, editCallback, _cloud).startEditSession(new IAdobeCCFilesRenameDialogDismissController()
      {
        public void dialogClosed()
        {
          if (AdobeCCFilesEditManager.isEditInProgress())
          {
            endDialogFragment();
            return;
          }
          AdobeEditWindowDialogFragment.this.setEditWindowVisible();
        }
      });
      return;
    }
    AdobeCCFilesEditManager.createSession(localFragmentManager, paramAdobeCCFilesEditOperation, editCallback, _cloud).startEditSession();
    endDialogFragment();
  }
  
  protected void handleExportClick() {}
  
  public void handleNoNetwork()
  {
    if (alertDialog != null) {
      alertDialog.dismiss();
    }
    if (fetchLinkDialog != null) {
      fetchLinkDialog.dismiss();
    }
    endDialogFragment();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if (alertDialog != null) {
      alertDialog.dismiss();
    }
    super.onDismiss(paramDialogInterface);
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    _cloud = paramAdobeCloud;
  }
  
  public void setEditCallback(IAdobeEditAssetCallback paramIAdobeEditAssetCallback)
  {
    editCallback = paramIAdobeEditAssetCallback;
  }
}
