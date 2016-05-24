package com.behance.sdk.util;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.res.Resources;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import android.util.DisplayMetrics;
import android.view.View;
import com.adobe.creativesdk.foundation.storage.AdobeAssetMimeTypes;
import com.behance.sdk.R.bool;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.project.modules.ImageModule;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class BehanceSDKUtils
{
  private static ArrayList<String> allowedFileExtensionsForProfileImage;
  private static ArrayList<String> allowedFileExtensionsForProjectImages;
  private static ArrayList<String> allowedFileExtensionsForWIPImage;
  private static ArrayList<String> restrictedCharForTagList;
  
  public static void addImageToGallery(Context paramContext, String paramString)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
    localContentValues.put("mime_type", "image/jpeg");
    localContentValues.put("_data", paramString);
    paramContext.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, localContentValues);
  }
  
  public static String cleanUpTagsString(String paramString)
  {
    int i = 0;
    String[] arrayOfString = new String[1];
    arrayOfString[0] = "FF0C";
    String str = "";
    int j = arrayOfString.length;
    while (i < j)
    {
      str = paramString.replaceAll(Character.toString((char)Integer.parseInt(arrayOfString[i], 16)), ",");
      i += 1;
    }
    return str;
  }
  
  @SuppressLint({"SimpleDateFormat"})
  public static File createTempImageFile()
    throws IOException
  {
    String str = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
    return File.createTempFile("JPEG_" + str + "_", ".jpg", Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES));
  }
  
  public static void deleteRecursive(File paramFile)
  {
    if ((paramFile != null) && (paramFile.exists()))
    {
      if (paramFile.isDirectory())
      {
        File[] arrayOfFile = paramFile.listFiles();
        int j = arrayOfFile.length;
        int i = 0;
        while (i < j)
        {
          deleteRecursive(arrayOfFile[i]);
          i += 1;
        }
      }
      paramFile.delete();
    }
  }
  
  public static EnumSet<AdobeAssetMimeTypes> getAdobeAssetMimeTypes(List<String> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      HashSet localHashSet = new HashSet(paramList.size());
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        String str = (String)paramList.next();
        if (("jpg".equalsIgnoreCase(str)) || ("jpeg".equalsIgnoreCase(str))) {
          localHashSet.add(AdobeAssetMimeTypes.MIMETYPE_JPEG);
        } else if ("png".equalsIgnoreCase(str)) {
          localHashSet.add(AdobeAssetMimeTypes.MIMETYPE_PNG);
        } else if ("gif".equalsIgnoreCase(str)) {
          localHashSet.add(AdobeAssetMimeTypes.MIMETYPE_GIF);
        }
      }
      return EnumSet.copyOf(localHashSet);
    }
    return null;
  }
  
  public static ArrayList<String> getAllowedFileExtensionsForProfileImage()
  {
    if (allowedFileExtensionsForProfileImage == null)
    {
      allowedFileExtensionsForProfileImage = new ArrayList();
      allowedFileExtensionsForProfileImage.add("jpg");
      allowedFileExtensionsForProfileImage.add("JPG");
      allowedFileExtensionsForProfileImage.add("jpeg");
      allowedFileExtensionsForProfileImage.add("JPEG");
      allowedFileExtensionsForProfileImage.add("png");
      allowedFileExtensionsForProfileImage.add("PNG");
      allowedFileExtensionsForProfileImage.add("gif");
      allowedFileExtensionsForProfileImage.add("GIF");
    }
    return allowedFileExtensionsForProfileImage;
  }
  
  public static ArrayList<String> getAllowedFileExtensionsForProjectImage()
  {
    if (allowedFileExtensionsForProjectImages == null)
    {
      allowedFileExtensionsForProjectImages = new ArrayList();
      allowedFileExtensionsForProjectImages.add("jpg");
      allowedFileExtensionsForProjectImages.add("JPG");
      allowedFileExtensionsForProjectImages.add("jpeg");
      allowedFileExtensionsForProjectImages.add("JPEG");
      allowedFileExtensionsForProjectImages.add("png");
      allowedFileExtensionsForProjectImages.add("PNG");
      allowedFileExtensionsForProjectImages.add("gif");
      allowedFileExtensionsForProjectImages.add("GIF");
    }
    return allowedFileExtensionsForProjectImages;
  }
  
  public static ArrayList<String> getAllowedFileExtensionsForWIPImage()
  {
    if (allowedFileExtensionsForWIPImage == null)
    {
      allowedFileExtensionsForWIPImage = new ArrayList();
      allowedFileExtensionsForWIPImage.add("jpg");
      allowedFileExtensionsForWIPImage.add("JPG");
      allowedFileExtensionsForWIPImage.add("jpeg");
      allowedFileExtensionsForWIPImage.add("JPEG");
      allowedFileExtensionsForWIPImage.add("png");
      allowedFileExtensionsForWIPImage.add("PNG");
      allowedFileExtensionsForWIPImage.add("gif");
      allowedFileExtensionsForWIPImage.add("GIF");
    }
    return allowedFileExtensionsForWIPImage;
  }
  
  public static String getCreativeFieldsString(List<BehanceSDKCreativeFieldDTO> paramList, String paramString)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      StringBuffer localStringBuffer = new StringBuffer();
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        BehanceSDKCreativeFieldDTO localBehanceSDKCreativeFieldDTO = (BehanceSDKCreativeFieldDTO)paramList.next();
        if (localStringBuffer.length() > 0) {
          localStringBuffer.append(paramString);
        }
        localStringBuffer.append(localBehanceSDKCreativeFieldDTO.getName());
      }
      return localStringBuffer.toString();
    }
    return null;
  }
  
  public static String getFileExtension(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    int i = paramString.lastIndexOf('.');
    if (Math.max(paramString.lastIndexOf('/'), paramString.lastIndexOf('\\')) > i) {
      i = -1;
    }
    while (i == -1) {
      return "";
    }
    return paramString.substring(i + 1);
  }
  
  public static boolean isTagValidForProjectAndWIP(String paramString)
  {
    Iterator localIterator;
    if ((paramString != null) && (paramString.length() > 0) && (!paramString.matches("-?\\d+(\\.\\d+)?")))
    {
      if (restrictedCharForTagList == null)
      {
        restrictedCharForTagList = new ArrayList();
        restrictedCharForTagList.add("~");
        restrictedCharForTagList.add("`");
        restrictedCharForTagList.add("!");
        restrictedCharForTagList.add("@");
        restrictedCharForTagList.add("#");
        restrictedCharForTagList.add("$");
        restrictedCharForTagList.add("%");
        restrictedCharForTagList.add("^");
        restrictedCharForTagList.add("&");
        restrictedCharForTagList.add("*");
        restrictedCharForTagList.add("(");
        restrictedCharForTagList.add(")");
        restrictedCharForTagList.add("-");
        restrictedCharForTagList.add("+");
        restrictedCharForTagList.add("=");
        restrictedCharForTagList.add("[");
        restrictedCharForTagList.add("]");
        restrictedCharForTagList.add("{");
        restrictedCharForTagList.add("}");
        restrictedCharForTagList.add("|");
        restrictedCharForTagList.add("\\");
        restrictedCharForTagList.add(";");
        restrictedCharForTagList.add(":");
        restrictedCharForTagList.add("\"");
        restrictedCharForTagList.add("'");
        restrictedCharForTagList.add("<");
        restrictedCharForTagList.add(">");
        restrictedCharForTagList.add(",");
        restrictedCharForTagList.add(".");
        restrictedCharForTagList.add("?");
        restrictedCharForTagList.add("/");
      }
      localIterator = restrictedCharForTagList.iterator();
    }
    while (localIterator.hasNext()) {
      if (paramString.contains((String)localIterator.next())) {
        return false;
      }
    }
    return true;
  }
  
  public static void setContentViewDimensions(Context paramContext, View paramView)
  {
    if (!paramContext.getResources().getBoolean(R.bool.bsdk_show_view_full_screen))
    {
      paramContext = paramContext.getResources().getDisplayMetrics();
      int i = widthPixels;
      int j = heightPixels;
      if ((i > 0) && (j > 0))
      {
        i = (int)(i * 0.8F);
        paramContext = paramView.getLayoutParams();
        if (paramContext != null)
        {
          width = i;
          height = -2;
          paramView.setLayoutParams(paramContext);
        }
      }
    }
  }
  
  public static void setContentViewPaddings(Context paramContext, View paramView, float paramFloat)
  {
    paramContext = paramContext.getResources().getDisplayMetrics();
    int i = widthPixels;
    int j = heightPixels;
    if ((i > 0) && (j > 0))
    {
      i -= (int)(i * paramFloat);
      paramView.setPadding(i / 2, paramView.getPaddingTop(), i / 2, paramView.getPaddingBottom());
    }
  }
  
  public static BehanceSDKPublishImageValidationResult validateImageForWIP(ImageModule paramImageModule)
  {
    if (paramImageModule != null)
    {
      Object localObject = paramImageModule.getFile();
      if ((localObject != null) && (((File)localObject).exists()) && (((File)localObject).isFile()))
      {
        localObject = getFileExtension(((File)localObject).getName());
        if ((localObject != null) && (((String)localObject).length() > 0))
        {
          ArrayList localArrayList = getAllowedFileExtensionsForWIPImage();
          if ((localArrayList != null) && (!localArrayList.isEmpty()) && (!localArrayList.contains(localObject))) {
            return BehanceSDKPublishImageValidationResult.INVALID_FILE_TYPE;
          }
        }
        else
        {
          return BehanceSDKPublishImageValidationResult.INVALID_FILE_TYPE;
        }
        long l = paramImageModule.getSizeInBytes();
        if ((l <= 0L) || (l > 12582912L)) {
          return BehanceSDKPublishImageValidationResult.INVALID_SIZE;
        }
        int i = paramImageModule.getWidth();
        int j = paramImageModule.getHeight();
        if ((i <= 0) || (j <= 0) || (i < 640) || (j < 320)) {
          return BehanceSDKPublishImageValidationResult.INVALID_IMAGE_DIMENSIONS;
        }
        return BehanceSDKPublishImageValidationResult.VALID;
      }
    }
    return BehanceSDKPublishImageValidationResult.INVALID;
  }
}
