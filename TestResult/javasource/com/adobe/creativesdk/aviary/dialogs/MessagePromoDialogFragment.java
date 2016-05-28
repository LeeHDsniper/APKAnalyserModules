package com.adobe.creativesdk.aviary.dialogs;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.util.Linkify;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.events.MessageUserActionEvent;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import java.io.File;

public class MessagePromoDialogFragment
  extends DialogFragment
  implements View.OnClickListener
{
  View mBottomBar;
  Button mButtonNo;
  Button mButtonYes;
  private String mContentIdentifier;
  TextView mDescription;
  ImageView mHeaderImage;
  private long mMessageContentId;
  private long mMessageId;
  View mTextContainer;
  TextView mTitle;
  
  public MessagePromoDialogFragment() {}
  
  private void displayMessage(int paramInt1, int paramInt2)
  {
    Log.i("MessageFragment", "dialog size: " + paramInt1 + "x" + paramInt2);
    Object localObject = getArguments();
    String str1 = ((Bundle)localObject).getString("header_file");
    mMessageId = ((Bundle)localObject).getLong("message_id");
    mMessageContentId = ((Bundle)localObject).getLong("message_content_id");
    mContentIdentifier = ((Bundle)localObject).getString("uri");
    paramInt2 = ((Bundle)localObject).getInt("message_bitmap_width");
    int j = ((Bundle)localObject).getInt("message_bitmap_height");
    String str2 = ((Bundle)localObject).getString("android.intent.extra.TITLE");
    String str3 = ((Bundle)localObject).getString("android.intent.extra.TEXT");
    String str4 = ((Bundle)localObject).getString("dismiss_button");
    String str5 = ((Bundle)localObject).getString("action_button");
    boolean bool = ((Bundle)localObject).getBoolean("show_new_banner", true);
    Log.v("MessageFragment", "title: " + str2);
    Log.v("MessageFragment", "text: " + str3);
    Log.v("MessageFragment", "dismissButtonText: " + str4);
    Log.v("MessageFragment", "actionButtonText: " + str5);
    localObject = getResources().getDisplayMetrics();
    int i = heightPixels / 2;
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inScaled = true;
    inTargetDensity = densityDpi;
    inDensity = 240;
    double d = paramInt2 / j;
    int k = Math.max(paramInt1, paramInt2);
    j = (int)(k / d);
    paramInt2 = k;
    if (k > paramInt1) {
      paramInt2 = paramInt1;
    }
    paramInt1 = j;
    if (j > i) {
      paramInt1 = i;
    }
    Log.v("MessageFragment", "final bitmap size: " + paramInt2 + "x" + paramInt1);
    localObject = mHeaderImage.getLayoutParams();
    width = paramInt2;
    height = paramInt1;
    mHeaderImage.setLayoutParams((ViewGroup.LayoutParams)localObject);
    Picasso.with(getActivity()).load(new File(str1)).skipMemoryCache().resize(paramInt2, paramInt1).centerCrop().noFade().config(Bitmap.Config.RGB_565).into(mHeaderImage);
    mTitle.setText(str2);
    mDescription.setText(str3);
    Linkify.addLinks(mDescription, 15);
    mButtonNo.setText(str4);
    if (str5 != null) {
      mButtonYes.setText(str5);
    }
    for (;;)
    {
      if (!bool) {}
      mButtonYes.setOnClickListener(this);
      mButtonNo.setOnClickListener(this);
      flagMessageAsRead(mMessageContentId);
      return;
      mButtonYes.setVisibility(8);
    }
  }
  
  private void flagMessageAsRead(long paramLong)
  {
    getActivity().getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(getActivity(), "message/content/id/" + paramLong + "/markasread/1"), new ContentValues(), null, null);
  }
  
  private void onOkClicked()
  {
    Bundle localBundle = new Bundle();
    Cds.PackType localPackType = null;
    Object localObject3 = null;
    long l1 = -1L;
    long l2 = l1;
    Object localObject1 = localPackType;
    Cursor localCursor;
    if (mContentIdentifier != null)
    {
      localCursor = getActivity().getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getActivity(), "pack/identifier/" + mContentIdentifier), new String[] { "pack_id", "pack_type" }, null, null, null);
      l2 = l1;
      localObject1 = localPackType;
      if (localCursor != null) {
        localObject1 = localObject3;
      }
    }
    for (;;)
    {
      try
      {
        if (localCursor.moveToFirst())
        {
          localObject1 = PacksColumns.PackCursorWrapper.create(localCursor);
          l1 = ((PacksColumns.PackCursorWrapper)localObject1).getId();
          localObject1 = ((PacksColumns.PackCursorWrapper)localObject1).getPackType();
        }
        IOUtils.closeSilently(localCursor);
        l2 = l1;
        if (localObject1 != null)
        {
          localObject3 = null;
          localPackType = Cds.PackType.fromString((String)localObject1);
          localObject1 = localObject3;
          if (localPackType == null) {}
        }
        switch (2.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType[localPackType.ordinal()])
        {
        default: 
          localObject1 = localObject3;
          if (localObject1 != null) {
            localBundle.putString("extra-in-quick-tool", ((ToolLoaderFactory.Tools)localObject1).name());
          }
          localObject1 = new Bundle();
          ((Bundle)localObject1).putLong("quick-packId", l2);
          localBundle.putBundle("extra-in-quick-tool-options", (Bundle)localObject1);
          localObject1 = new MessageUserActionEvent(-1, localBundle, mMessageId, mMessageContentId, mContentIdentifier);
          EventBusUtils.getInstance().post(localObject1);
          return;
        }
      }
      finally
      {
        IOUtils.closeSilently(localCursor);
      }
      ToolLoaderFactory.Tools localTools = ToolLoaderFactory.Tools.EFFECTS;
      continue;
      localTools = ToolLoaderFactory.Tools.FRAMES;
      continue;
      localTools = ToolLoaderFactory.Tools.STICKERS;
      continue;
      localTools = ToolLoaderFactory.Tools.OVERLAYS;
    }
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    getView().getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
    {
      public void onGlobalLayout()
      {
        Log.e("MessageFragment", "dialog size: " + getView().getWidth() + "x" + getView().getHeight());
        getView().getViewTreeObserver().removeOnGlobalLayoutListener(this);
        MessagePromoDialogFragment.this.displayMessage(getView().getWidth(), getView().getHeight());
      }
    });
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.button1)
    {
      onOkClicked();
      dismiss();
      return;
    }
    dismiss();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(1, 0);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_promo_message_dialog, paramViewGroup, false);
  }
  
  public void onResume()
  {
    super.onResume();
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    mButtonNo = ((Button)paramView.findViewById(R.id.button2));
    mButtonYes = ((Button)paramView.findViewById(R.id.button1));
    mTitle = ((TextView)paramView.findViewById(R.id.title));
    mDescription = ((TextView)paramView.findViewById(R.id.text));
    mHeaderImage = ((ImageView)paramView.findViewById(R.id.image));
    mTextContainer = paramView.findViewById(R.id.text_container);
    mBottomBar = paramView.findViewById(R.id.layout01);
  }
}
