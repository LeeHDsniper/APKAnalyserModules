package com.dumplingsandwich.pencilsketch.activities;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;
import com.dumplingsandwich.pencilsketch.utils.BitmapUtils;
import java.io.File;

public class MainActivity
  extends Activity
{
  private Uri mImageCaptureUri;
  private Bundle savedInstanceState;
  
  public MainActivity() {}
  
  private Bitmap decodeCapturedImage(String paramString)
  {
    Object localObject = getWindowManager().getDefaultDisplay();
    Point localPoint = new Point();
    ((Display)localObject).getSize(localPoint);
    int i = x;
    int j = y;
    localObject = null;
    if (paramString != null) {
      localObject = BitmapUtils.scaleBitmap(BitmapUtils.decodeBitmapFile(this, paramString, i, j), i, j);
    }
    return localObject;
  }
  
  private Bitmap decodeSelectedImage(Intent paramIntent)
  {
    Object localObject1 = getWindowManager().getDefaultDisplay();
    Object localObject2 = new Point();
    ((Display)localObject1).getSize((Point)localObject2);
    int i = x;
    int j = y;
    localObject2 = BitmapUtils.scaleBitmap(BitmapUtils.decodeBitmapStream(this, paramIntent, i, j), i, j);
    localObject1 = localObject2;
    if (localObject2 != null) {}
    try
    {
      mImageCaptureUri = paramIntent.getData();
      localObject1 = getRealPathFromURI(mImageCaptureUri);
      paramIntent = (Intent)localObject1;
      if (localObject1 == null) {
        paramIntent = mImageCaptureUri.getPath();
      }
      localObject1 = localObject2;
      if (paramIntent != null)
      {
        i = BitmapUtils.necessaryRotation(paramIntent);
        localObject1 = localObject2;
        if (i != 0)
        {
          paramIntent = new Matrix();
          paramIntent.postRotate(i);
          localObject1 = Bitmap.createBitmap((Bitmap)localObject2, 0, 0, ((Bitmap)localObject2).getWidth(), ((Bitmap)localObject2).getHeight(), paramIntent, true);
        }
      }
      return localObject1;
    }
    catch (Exception paramIntent)
    {
      paramIntent.printStackTrace();
    }
    return localObject2;
  }
  
  public String getRealPathFromURI(Uri paramUri)
  {
    paramUri = getContentResolver().query(paramUri, new String[] { "_data" }, null, null, null);
    if (paramUri == null) {
      return null;
    }
    int i = paramUri.getColumnIndexOrThrow("_data");
    paramUri.moveToFirst();
    return paramUri.getString(i);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt2 != -1) {
      return;
    }
    Object localObject = null;
    if (paramInt1 == 1) {
      paramIntent = decodeSelectedImage(paramIntent);
    }
    while (paramIntent == null)
    {
      Toast.makeText(this, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected.", 1).show();
      return;
      paramIntent = localObject;
      if (paramInt1 == 2)
      {
        if (mImageCaptureUri != null) {}
        for (paramIntent = mImageCaptureUri.getPath();; paramIntent = savedInstanceState.getString("PATH"))
        {
          paramIntent = decodeCapturedImage(paramIntent);
          break;
        }
      }
    }
    try
    {
      ImagePreprocessActivity.current = paramIntent;
      startActivity(new Intent(this, ImagePreprocessActivity.class));
      return;
    }
    catch (Exception paramIntent)
    {
      Toast.makeText(this, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected.", 1).show();
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131689669: 
      paramView = new Intent();
      paramView.setType("image/*");
      paramView.setAction("android.intent.action.GET_CONTENT");
      paramView.addCategory("android.intent.category.OPENABLE");
      startActivityForResult(Intent.createChooser(paramView, "Complete action using"), 1);
      return;
    case 2131689670: 
      paramView = new Intent("android.media.action.IMAGE_CAPTURE");
      mImageCaptureUri = Uri.fromFile(new File(Environment.getExternalStorageDirectory(), "capture_" + String.valueOf(System.currentTimeMillis()) + ".jpg"));
      try
      {
        paramView.putExtra("output", mImageCaptureUri);
        paramView.putExtra("return-data", true);
        startActivityForResult(paramView, 2);
        return;
      }
      catch (Exception paramView)
      {
        paramView.printStackTrace();
        return;
      }
    case 2131689671: 
      startActivity(new Intent(this, CanvasActivity.class));
      return;
    }
    startActivity(new Intent(this, InfoActivity.class));
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(2130903076);
  }
  
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    savedInstanceState = paramBundle;
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    if (mImageCaptureUri != null) {
      paramBundle.putString("PATH", mImageCaptureUri.getPath());
    }
    super.onSaveInstanceState(paramBundle);
  }
}
