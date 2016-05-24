package com.dumplingsandwich.pencilsketch.activities;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Display;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.Toast;
import com.dumplingsandwich.pencilsketch.processor.ColorImageProcessor;
import com.dumplingsandwich.pencilsketch.utils.BitmapUtils;
import com.dumplingsandwich.pencilsketch.utils.UIUtils;
import java.io.File;
import java.util.ArrayList;

public class PhotoFrameActivity
  extends AppCompatActivity
{
  public static Bitmap original;
  private ArrayList<File> files_to_delete;
  private ImageView mImageView;
  private ProgressDialog progress_dialog;
  
  public PhotoFrameActivity() {}
  
  public void onBackPressed()
  {
    int i = 0;
    while (i < files_to_delete.size())
    {
      ((File)files_to_delete.get(i)).delete();
      i += 1;
    }
    super.onBackPressed();
  }
  
  public void onClick(View paramView)
  {
    int i = 2130837910;
    switch (paramView.getId())
    {
    }
    for (;;)
    {
      new PhotoFrameTask(null).execute(new Integer[] { Integer.valueOf(i) });
      return;
      i = 2130837910;
      continue;
      i = 2130837922;
      continue;
      i = 2130837924;
      continue;
      i = 2130837926;
      continue;
      i = 2130837928;
      continue;
      i = 2130837930;
      continue;
      i = 2130837932;
      continue;
      i = 2130837934;
      continue;
      i = 2130837936;
      continue;
      i = 2130837911;
      continue;
      i = 2130837913;
      continue;
      i = 2130837915;
      continue;
      i = 2130837917;
      continue;
      i = 2130837919;
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903077);
    mImageView = ((ImageView)findViewById(2131689674));
    mImageView.setImageBitmap(original);
    files_to_delete = new ArrayList();
    progress_dialog = UIUtils.getLoadingIndicator(this, "Processing...", false);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755018, paramMenu);
    return true;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    Object localObject = ((BitmapDrawable)mImageView.getDrawable()).getBitmap();
    switch (paramMenuItem.getItemId())
    {
    }
    for (;;)
    {
      return super.onOptionsItemSelected(paramMenuItem);
      if (BitmapUtils.saveImageOnPhone(this, (Bitmap)localObject, true) != null)
      {
        Toast.makeText(getBaseContext(), "Image Saved in \"Pencil_Sketch\" Folder!", 0).show();
        continue;
        localObject = BitmapUtils.shareImage(this, (Bitmap)localObject);
        if (localObject != null) {
          files_to_delete.add(localObject);
        }
      }
    }
  }
  
  private class PhotoFrameTask
    extends AsyncTask<Integer, Integer, Bitmap>
  {
    private PhotoFrameTask() {}
    
    protected Bitmap doInBackground(Integer... paramVarArgs)
    {
      Object localObject = getWindowManager().getDefaultDisplay();
      Point localPoint = new Point();
      ((Display)localObject).getSize(localPoint);
      int i = x;
      int j = y;
      paramVarArgs = BitmapUtils.decodeResource(getResources(), paramVarArgs[0].intValue(), i, j);
      localObject = ColorImageProcessor.addPhotoFrame(PhotoFrameActivity.original, paramVarArgs);
      paramVarArgs.recycle();
      return localObject;
    }
    
    protected void onPostExecute(Bitmap paramBitmap)
    {
      if (progress_dialog.isShowing()) {
        progress_dialog.dismiss();
      }
      if (paramBitmap != null) {
        mImageView.setImageBitmap(paramBitmap);
      }
    }
    
    protected void onPreExecute()
    {
      super.onPreExecute();
      if (!progress_dialog.isShowing()) {
        progress_dialog.show();
      }
    }
  }
}
