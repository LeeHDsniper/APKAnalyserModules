package com.dumplingsandwich.pencilsketch.activities;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Toast;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.AdobeImageIntent.Builder;
import com.adobe.creativesdk.aviary.internal.headless.utils.MegaPixels;
import com.dumplingsandwich.pencilsketch.ads.AdmobInterstitialUtils;
import com.dumplingsandwich.pencilsketch.ads.FacebookInterstitialUtils;
import com.dumplingsandwich.pencilsketch.model.HsvPixel;
import com.dumplingsandwich.pencilsketch.processor.ColorImageProcessor;
import com.dumplingsandwich.pencilsketch.processor.GrayscaleImageProcessor;
import com.dumplingsandwich.pencilsketch.utils.BitmapUtils;
import com.dumplingsandwich.pencilsketch.utils.UIUtils;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdRequest.Builder;
import com.google.android.gms.ads.AdView;
import java.io.File;
import java.util.ArrayList;

public class ImageEditingActivity
  extends Activity
{
  public static Bitmap original;
  private ImageView bitmapView;
  private ArrayList<File> files_to_delete;
  private Bitmap grayscaleBaseLayer;
  private HsvPixel[] hsvPixelsOriginal;
  private ProgressDialog progress_dialog;
  private RadioGroup sketch_option;
  
  public ImageEditingActivity() {}
  
  private void initializeAdmobBanner()
  {
    final AdView localAdView = (AdView)findViewById(2131689651);
    localAdView.setAdListener(new AdListener()
    {
      public void onAdFailedToLoad(int paramAnonymousInt)
      {
        super.onAdFailedToLoad(paramAnonymousInt);
        localAdView.setVisibility(8);
      }
    });
    localAdView.loadAd(new AdRequest.Builder().build());
  }
  
  private void initializeAviaryEditor()
  {
    startService(AdobeImageIntent.createCdsInitIntent(getBaseContext(), "init"));
  }
  
  private void launchAviarySDK(Uri paramUri)
  {
    File localFile = new File(new File(Environment.getExternalStorageDirectory().getAbsolutePath(), "Pencil_Sketch"), "pencil_sketch_" + System.currentTimeMillis() + ".jpg");
    startActivityForResult(new AdobeImageIntent.Builder(this).setData(paramUri).withOutput(Uri.parse("file://" + localFile.getAbsolutePath())).withOutputFormat(Bitmap.CompressFormat.JPEG).withOutputSize(MegaPixels.Mp5).withNoExitConfirmation(true).saveWithNoChanges(true).withAutoColorEnabled(true).withOutputQuality(100).withVibrationEnabled(true).build(), 100);
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt2 == -1) {}
    switch (paramInt1)
    {
    default: 
      return;
    }
    MediaScannerConnection.scanFile(this, new String[] { paramIntent.getData().getPath() }, new String[] { "image/jpeg" }, null);
    Toast.makeText(getBaseContext(), "Image Saved in \"Pencil_Sketch\" Folder!", 0).show();
  }
  
  public void onBackPressed()
  {
    int i = 0;
    while (i < files_to_delete.size())
    {
      ((File)files_to_delete.get(i)).delete();
      i += 1;
    }
    if (grayscaleBaseLayer != null) {
      grayscaleBaseLayer.recycle();
    }
    hsvPixelsOriginal = null;
    super.onBackPressed();
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    do
    {
      do
      {
        do
        {
          return;
          PhotoFrameActivity.original = ((BitmapDrawable)bitmapView.getDrawable()).getBitmap();
          startActivity(new Intent(this, PhotoFrameActivity.class));
          return;
          progress_dialog.setMessage("Black-White Sketching...");
          if (sketch_option.getCheckedRadioButtonId() == 2131689648) {
            paramView = new GrayscaleSketchTask(null);
          }
          for (;;)
          {
            paramView.execute(new Void[0]);
            return;
            if (sketch_option.getCheckedRadioButtonId() == 2131689649) {
              paramView = new GrayscaleDoodleTask(null);
            } else {
              paramView = new GrayscaleCrossHatchTask(null);
            }
          }
          progress_dialog.setMessage("Color Sketching...");
          if (sketch_option.getCheckedRadioButtonId() == 2131689648) {
            paramView = new ColorSketchTask(null);
          }
          for (;;)
          {
            paramView.execute(new Void[0]);
            return;
            if (sketch_option.getCheckedRadioButtonId() == 2131689649) {
              paramView = new ColorDoodleTask(null);
            } else {
              paramView = new ColorCrossHatchTask(null);
            }
          }
          paramView = BitmapUtils.saveImageOnPhone(this, ((BitmapDrawable)bitmapView.getDrawable()).getBitmap(), false);
        } while (paramView == null);
        files_to_delete.add(paramView);
        launchAviarySDK(Uri.fromFile(paramView));
        return;
      } while (BitmapUtils.saveImageOnPhone(this, ((BitmapDrawable)bitmapView.getDrawable()).getBitmap(), true) == null);
      Toast.makeText(getBaseContext(), "Image Saved in \"Pencil_Sketch\" Folder!", 0).show();
      return;
      paramView = BitmapUtils.shareImage(this, ((BitmapDrawable)bitmapView.getDrawable()).getBitmap());
    } while (paramView == null);
    files_to_delete.add(paramView);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(2130903073);
    if (original == null)
    {
      Toast.makeText(this, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected.", 1).show();
      finish();
    }
    do
    {
      return;
      initializeAdmobBanner();
      initializeAviaryEditor();
      files_to_delete = new ArrayList();
      sketch_option = ((RadioGroup)findViewById(2131689647));
      progress_dialog = UIUtils.getLoadingIndicator(this, "Sketching...", false);
      bitmapView = ((ImageView)findViewById(2131689652));
      bitmapView.setImageBitmap(original);
      if (AdmobInterstitialUtils.isAdmobInterstitialReady())
      {
        AdmobInterstitialUtils.displayAdmobInterstitial();
        return;
      }
    } while (!FacebookInterstitialUtils.isFacebookInterstitialReady());
    FacebookInterstitialUtils.displayFacebookInterstitialAd();
  }
  
  protected void onResume()
  {
    super.onResume();
    if (original == null)
    {
      Toast.makeText(this, "Please pick a photo", 0).show();
      finish();
    }
  }
  
  private class BaseAsyncTask
    extends AsyncTask<Void, Integer, Bitmap>
  {
    private BaseAsyncTask() {}
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      return null;
    }
    
    protected void onPostExecute(Bitmap paramBitmap)
    {
      super.onPostExecute(paramBitmap);
      if (progress_dialog.isShowing()) {
        progress_dialog.dismiss();
      }
      bitmapView.setImageBitmap(paramBitmap);
    }
    
    protected void onPreExecute()
    {
      super.onPreExecute();
      if (!progress_dialog.isShowing()) {
        progress_dialog.show();
      }
    }
  }
  
  private class ColorCrossHatchTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private ColorCrossHatchTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      paramVarArgs = getWindowManager().getDefaultDisplay();
      Object localObject = new Point();
      paramVarArgs.getSize((Point)localObject);
      int i = x;
      int j = y;
      paramVarArgs = BitmapUtils.decodeResource(getResources(), 2130837888, i, j);
      localObject = GrayscaleImageProcessor.grayscaleCrossHatchSketch(ImageEditingActivity.original, paramVarArgs, 0.7F);
      paramVarArgs.recycle();
      if (hsvPixelsOriginal == null) {
        ImageEditingActivity.access$1002(ImageEditingActivity.this, ColorImageProcessor.getHsvData(ImageEditingActivity.original));
      }
      return ColorImageProcessor.replaceIlluminationLayer(hsvPixelsOriginal, (Bitmap)localObject);
    }
  }
  
  private class ColorDoodleTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private ColorDoodleTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      if (grayscaleBaseLayer == null) {
        ImageEditingActivity.access$902(ImageEditingActivity.this, GrayscaleImageProcessor.grayscaleBaseSketch(ImageEditingActivity.original));
      }
      if (hsvPixelsOriginal == null) {
        ImageEditingActivity.access$1002(ImageEditingActivity.this, ColorImageProcessor.getHsvData(ImageEditingActivity.original));
      }
      paramVarArgs = GrayscaleImageProcessor.grayscaleEdgeSketch(grayscaleBaseLayer);
      return ColorImageProcessor.replaceIlluminationLayer(hsvPixelsOriginal, paramVarArgs);
    }
  }
  
  private class ColorSketchTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private ColorSketchTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      if (grayscaleBaseLayer == null) {
        ImageEditingActivity.access$902(ImageEditingActivity.this, GrayscaleImageProcessor.grayscaleBaseSketch(ImageEditingActivity.original));
      }
      if (hsvPixelsOriginal == null) {
        ImageEditingActivity.access$1002(ImageEditingActivity.this, ColorImageProcessor.getHsvData(ImageEditingActivity.original));
      }
      return ColorImageProcessor.replaceIlluminationLayer(hsvPixelsOriginal, grayscaleBaseLayer);
    }
  }
  
  private class GrayscaleCrossHatchTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private GrayscaleCrossHatchTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      paramVarArgs = getWindowManager().getDefaultDisplay();
      Point localPoint = new Point();
      paramVarArgs.getSize(localPoint);
      int i = x;
      int j = y;
      paramVarArgs = BitmapUtils.decodeResource(getResources(), 2130837888, i, j);
      return GrayscaleImageProcessor.grayscaleCrossHatchSketch(ImageEditingActivity.original, paramVarArgs, 0.75F);
    }
  }
  
  private class GrayscaleDoodleTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private GrayscaleDoodleTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      if (grayscaleBaseLayer == null) {
        ImageEditingActivity.access$902(ImageEditingActivity.this, GrayscaleImageProcessor.grayscaleBaseSketch(ImageEditingActivity.original));
      }
      return GrayscaleImageProcessor.grayscaleEdgeSketch(grayscaleBaseLayer);
    }
  }
  
  private class GrayscaleSketchTask
    extends ImageEditingActivity.BaseAsyncTask
  {
    private GrayscaleSketchTask()
    {
      super(null);
    }
    
    protected Bitmap doInBackground(Void... paramVarArgs)
    {
      if (grayscaleBaseLayer == null) {
        ImageEditingActivity.access$902(ImageEditingActivity.this, GrayscaleImageProcessor.grayscaleBaseSketch(ImageEditingActivity.original));
      }
      return grayscaleBaseLayer;
    }
  }
}
