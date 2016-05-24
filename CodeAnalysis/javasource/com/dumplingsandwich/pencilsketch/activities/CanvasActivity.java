package com.dumplingsandwich.pencilsketch.activities;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Point;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.util.LruCache;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.support.v7.app.AppCompatActivity;
import android.view.Display;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Toast;
import com.adobe.creativesdk.aviary.AdobeImageIntent.Builder;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.utils.MegaPixels;
import com.dumplingsandwich.pencilsketch.ads.AdmobInterstitialUtils;
import com.dumplingsandwich.pencilsketch.ads.FacebookInterstitialUtils;
import com.dumplingsandwich.pencilsketch.fragment.CanvasFragment;
import com.dumplingsandwich.pencilsketch.utils.BitmapUtils;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class CanvasActivity
  extends AppCompatActivity
{
  public static final Integer[] imageResIds = { Integer.valueOf(2130837703), Integer.valueOf(2130837710), Integer.valueOf(2130837711), Integer.valueOf(2130837712), Integer.valueOf(2130837713), Integer.valueOf(2130837714), Integer.valueOf(2130837715), Integer.valueOf(2130837716), Integer.valueOf(2130837717), Integer.valueOf(2130837704), Integer.valueOf(2130837705), Integer.valueOf(2130837706), Integer.valueOf(2130837707), Integer.valueOf(2130837708), Integer.valueOf(2130837709) };
  private final int ACTION_REQUEST_DOODLE_BOARD = 100;
  private ArrayList<File> files_to_delete;
  private CanvasAdapter mAdapter;
  private LruCache<String, Bitmap> mMemoryCache;
  private ViewPager mPager;
  private RadioGroup radioGroup;
  
  public CanvasActivity() {}
  
  private void displayProperResult(boolean paramBoolean)
  {
    if (AdmobInterstitialUtils.isAdmobInterstitialReady()) {
      AdmobInterstitialUtils.displayAdmobInterstitial();
    }
    do
    {
      return;
      if (FacebookInterstitialUtils.isFacebookInterstitialReady())
      {
        FacebookInterstitialUtils.displayFacebookInterstitialAd();
        return;
      }
    } while (!paramBoolean);
    Toast.makeText(getBaseContext(), "Image Saved in \"Pencil_Sketch\" Folder!", 0).show();
  }
  
  private void initializeMemCache()
  {
    mMemoryCache = new LruCache((int)(Runtime.getRuntime().maxMemory() / 1024L) / 8)
    {
      protected int sizeOf(String paramAnonymousString, Bitmap paramAnonymousBitmap)
      {
        return paramAnonymousBitmap.getByteCount() / 1024;
      }
    };
  }
  
  private void initializePager()
  {
    mAdapter = new CanvasAdapter(getSupportFragmentManager(), imageResIds.length);
    mPager = ((ViewPager)findViewById(2131689619));
    radioGroup = ((RadioGroup)findViewById(2131689620));
    mPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener()
    {
      public void onPageScrollStateChanged(int paramAnonymousInt) {}
      
      public void onPageScrolled(int paramAnonymousInt1, float paramAnonymousFloat, int paramAnonymousInt2) {}
      
      public void onPageSelected(int paramAnonymousInt)
      {
        switch (paramAnonymousInt / 4)
        {
        default: 
          return;
        case 0: 
          radioGroup.check(2131689621);
          return;
        case 1: 
          radioGroup.check(2131689622);
          return;
        case 2: 
          radioGroup.check(2131689623);
          return;
        }
        radioGroup.check(2131689624);
      }
    });
    mPager.setAdapter(mAdapter);
  }
  
  private void launchDoodleBoard(Uri paramUri)
  {
    File localFile = new File(new File(Environment.getExternalStorageDirectory().getAbsolutePath(), "Pencil_Sketch"), "Pencil_Sketch" + System.currentTimeMillis() + ".jpg");
    ToolLoaderFactory.Tools localTools1 = ToolLoaderFactory.Tools.DRAW;
    ToolLoaderFactory.Tools localTools2 = ToolLoaderFactory.Tools.TEXT;
    ToolLoaderFactory.Tools localTools3 = ToolLoaderFactory.Tools.MEME;
    ToolLoaderFactory.Tools localTools4 = ToolLoaderFactory.Tools.ORIENTATION;
    ToolLoaderFactory.Tools localTools5 = ToolLoaderFactory.Tools.LIGHTING;
    paramUri = new AdobeImageIntent.Builder(this).setData(paramUri).withOutput(Uri.parse("file://" + localFile.getAbsolutePath())).withOutputFormat(Bitmap.CompressFormat.JPEG).withOutputSize(MegaPixels.Mp5).withNoExitConfirmation(false).saveWithNoChanges(false).withAutoColorEnabled(true).withOutputQuality(100).withVibrationEnabled(true).withToolList(new ToolLoaderFactory.Tools[] { localTools1, localTools2, localTools3, localTools4, localTools5 }).build();
    getClass();
    startActivityForResult(paramUri, 100);
  }
  
  public void addBitmapToMemoryCache(String paramString, Bitmap paramBitmap)
  {
    if (getBitmapFromMemCache(paramString) == null) {
      mMemoryCache.put(paramString, paramBitmap);
    }
  }
  
  public Bitmap getBitmapFromMemCache(String paramString)
  {
    return (Bitmap)mMemoryCache.get(paramString);
  }
  
  public void loadBitmap(int paramInt, ImageView paramImageView)
  {
    Bitmap localBitmap = (Bitmap)mMemoryCache.get(String.valueOf(paramInt));
    if (localBitmap != null)
    {
      paramImageView.setImageBitmap(localBitmap);
      return;
    }
    new BitmapWorkerTask(paramImageView).execute(new Integer[] { Integer.valueOf(paramInt) });
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default: 
      return;
    }
    if (paramInt2 == -1) {}
    for (boolean bool = true;; bool = false)
    {
      if (bool) {
        MediaScannerConnection.scanFile(this, new String[] { paramIntent.getData().getPath() }, new String[] { "image/jpeg" }, null);
      }
      displayProperResult(bool);
      return;
    }
  }
  
  public void onBackPressed()
  {
    int i = 0;
    while (i < files_to_delete.size())
    {
      ((File)files_to_delete.get(i)).delete();
      i += 1;
    }
    mMemoryCache.evictAll();
    super.onBackPressed();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903069);
    files_to_delete = new ArrayList();
    initializePager();
    initializeMemCache();
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755020, paramMenu);
    return true;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    }
    for (;;)
    {
      return super.onOptionsItemSelected(paramMenuItem);
      int i = mPager.getCurrentItem();
      i = imageResIds[i].intValue();
      Object localObject2 = (Bitmap)mMemoryCache.get(String.valueOf(i));
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = getWindowManager().getDefaultDisplay();
        localObject2 = new Point();
        ((Display)localObject1).getSize((Point)localObject2);
        localObject1 = BitmapUtils.decodeResource(getResources(), i, x, y);
      }
      localObject1 = BitmapUtils.saveImageOnPhone(this, (Bitmap)localObject1, false);
      files_to_delete.add(localObject1);
      launchDoodleBoard(Uri.fromFile((File)localObject1));
    }
  }
  
  private class BitmapWorkerTask
    extends AsyncTask<Integer, Void, Bitmap>
  {
    private int data = 0;
    private final WeakReference<ImageView> imageViewReference;
    
    public BitmapWorkerTask(ImageView paramImageView)
    {
      imageViewReference = new WeakReference(paramImageView);
    }
    
    protected Bitmap doInBackground(Integer... paramVarArgs)
    {
      data = paramVarArgs[0].intValue();
      paramVarArgs = getWindowManager().getDefaultDisplay();
      Point localPoint = new Point();
      paramVarArgs.getSize(localPoint);
      return BitmapUtils.decodeResource(getResources(), data, x, y);
    }
    
    protected void onPostExecute(Bitmap paramBitmap)
    {
      if (paramBitmap != null)
      {
        ImageView localImageView = (ImageView)imageViewReference.get();
        if (localImageView != null)
        {
          localImageView.setImageBitmap(paramBitmap);
          addBitmapToMemoryCache(String.valueOf(data), paramBitmap);
        }
      }
    }
  }
  
  private class CanvasAdapter
    extends FragmentStatePagerAdapter
  {
    private final int mSize;
    
    public CanvasAdapter(FragmentManager paramFragmentManager, int paramInt)
    {
      super();
      mSize = paramInt;
    }
    
    public int getCount()
    {
      return mSize;
    }
    
    public Fragment getItem(int paramInt)
    {
      return CanvasFragment.newInstance(paramInt);
    }
  }
}
