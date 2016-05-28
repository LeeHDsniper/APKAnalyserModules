package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentValues;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.text.TextUtils;
import android.widget.Toast;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser.ContentItem;
import com.adobe.creativesdk.aviary.internal.utils.DateTimeUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import junit.framework.Assert;
import junit.framework.AssertionFailedError;
import org.json.JSONException;
import org.json.JSONObject;

final class CdsDefaultContentLoader
{
  private static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("CdsDefaultContentLoader");
  private Context mContext;
  
  public CdsDefaultContentLoader(Context paramContext)
  {
    mContext = paramContext;
  }
  
  private void extractContent(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, long paramLong, String paramString3)
    throws AssertionError, Resources.NotFoundException, IOException
  {
    LOGGER.info("extractContent: %s", new Object[] { paramString2 });
    if (!paramString1.startsWith("file:///android_asset/"))
    {
      LOGGER.warn("not a local file. skipping");
      return;
    }
    paramString3 = mContext.getResources().getAssets();
    paramString1 = paramString1.substring("file:///android_asset/".length());
    LOGGER.verbose("filePath: %s", new Object[] { paramString1 });
    paramString1 = paramString3.open(paramString1);
    LOGGER.info("Extracting " + paramString2);
    paramString2 = new File(mContext.getFilesDir() + "/" + CdsUtils.getPackItemsContentPath(paramString2));
    paramString2.mkdirs();
    Assert.assertTrue("failed to create output dir", paramString2.isDirectory());
    paramString2.setReadable(true, false);
    for (;;)
    {
      try
      {
        IOUtils.unzip(paramString1, paramString2);
        IOUtils.closeSilently(paramString1);
        int i = updateContentPath(paramSQLiteDatabase, paramLong, paramString2.getAbsolutePath());
        LOGGER.log("updateContentPath result: " + i);
        if (i > 0)
        {
          bool = true;
          Assert.assertTrue(bool);
          return;
        }
      }
      finally
      {
        IOUtils.closeSilently(paramString1);
      }
      boolean bool = false;
    }
  }
  
  private void extractIcon(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, long paramLong)
    throws IOException, AssertionError, Resources.NotFoundException
  {
    LOGGER.info("extractIcon: %s", new Object[] { paramString2 });
    Object localObject2 = mContext.getResources().getAssets();
    Assert.assertTrue("Not a local file", paramString1.startsWith("file:///android_asset/"));
    String str = paramString1.substring("file:///android_asset/".length());
    Object localObject1 = Uri.parse(paramString1);
    LOGGER.verbose("filePath: %s", new Object[] { str });
    paramString1 = ((AssetManager)localObject2).open(str);
    paramString2 = mContext.getFilesDir() + "/" + CdsUtils.getPackIconPath(paramString2);
    localObject2 = new File(paramString2);
    ((File)localObject2).mkdirs();
    Assert.assertTrue(((File)localObject2).isDirectory());
    localObject1 = new File(paramString2 + "/" + ((Uri)localObject1).getLastPathSegment() + ".png");
    LOGGER.log("iconFilePath: " + ((File)localObject1).getAbsolutePath());
    paramString2 = new FileOutputStream((File)localObject1, true);
    for (;;)
    {
      try
      {
        IOUtils.copyFile(paramString1, paramString2);
        IOUtils.closeSilently(paramString2);
        IOUtils.closeSilently(paramString1);
        if (updateIconPath(paramSQLiteDatabase, paramLong, ((File)localObject1).getAbsolutePath(), 0) > 0)
        {
          bool = true;
          Assert.assertTrue(bool);
          return;
        }
      }
      finally
      {
        IOUtils.closeSilently(paramString2);
        IOUtils.closeSilently(paramString1);
      }
      boolean bool = false;
    }
  }
  
  private long insertNewPackContentAndItems(SQLiteDatabase paramSQLiteDatabase, ContentValues[] paramArrayOfContentValues)
  {
    if (paramArrayOfContentValues != null)
    {
      bool = true;
      Assert.assertTrue(bool);
      if (paramArrayOfContentValues.length <= 2) {
        break label114;
      }
    }
    long l2;
    label114:
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      LOGGER.log("insert pack, content and items: " + paramArrayOfContentValues.length);
      l2 = CdsDatabaseHelper.insertValues("packs_table", paramArrayOfContentValues[0], paramSQLiteDatabase);
      if (l2 >= 0L) {
        break label120;
      }
      LOGGER.error("packId=" + l2);
      l1 = -1L;
      return l1;
      bool = false;
      break;
    }
    label120:
    ContentValues localContentValues = paramArrayOfContentValues[1];
    localContentValues.put("content_packId", Long.valueOf(l2));
    long l1 = CdsDatabaseHelper.insertValues("content_table", localContentValues, paramSQLiteDatabase);
    if (l1 < 0L)
    {
      LOGGER.error("rowId=" + l1);
      return -1L;
    }
    int i = 2;
    for (;;)
    {
      l1 = l2;
      if (i >= paramArrayOfContentValues.length) {
        break;
      }
      localContentValues = paramArrayOfContentValues[i];
      localContentValues.put("item_packId", Long.valueOf(l2));
      l1 = CdsDatabaseHelper.insertValues("items_table", localContentValues, paramSQLiteDatabase);
      if (l1 < 0L)
      {
        LOGGER.error("itemId=" + l1);
        return -1L;
      }
      i += 1;
    }
  }
  
  private void loadPackContent(SQLiteDatabase paramSQLiteDatabase, JSONObject paramJSONObject, boolean paramBoolean)
    throws JSONException, IOException, AssertionError
  {
    LOGGER.info("loadPackContent");
    CdsContentParser localCdsContentParser = new CdsContentParser();
    if (localCdsContentParser.parse(paramJSONObject) != 0) {
      throw new AssertionFailedError(localCdsContentParser.getStatus());
    }
    paramJSONObject = localCdsContentParser.getIdentifier();
    String str1 = localCdsContentParser.getPackType();
    LOGGER.info("loadPackContent: %s", new Object[] { str1 });
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = new ContentValues();
    ((ContentValues)localObject1).put("pack_identifier", paramJSONObject);
    ((ContentValues)localObject1).put("pack_type", str1);
    ((ContentValues)localObject1).put("pack_versionKey", localCdsContentParser.getVersionKey());
    ((ContentValues)localObject1).put("pack_visible", Integer.valueOf(1));
    ((ContentValues)localObject1).put("pack_displayOrder", Integer.valueOf(0));
    localArrayList.add(localObject1);
    localObject1 = new ContentValues();
    ((ContentValues)localObject1).put("content_displayName", localCdsContentParser.getDisplayName());
    ((ContentValues)localObject1).put("content_displayDescription", localCdsContentParser.getDisplayDescription());
    Object localObject2 = normalizeUrlForDatabase(localCdsContentParser.getContentURL());
    Object localObject3 = normalizeUrlForDatabase(localCdsContentParser.getIconURL());
    String str2 = normalizeUrlForDatabase(localCdsContentParser.getFeatureImageURL());
    String str3 = normalizeUrlForDatabase(localCdsContentParser.getPreviewURL());
    String str4 = normalizeUrlForDatabase(localCdsContentParser.getDetailImageURL());
    ((ContentValues)localObject1).put("content_contentURL", (String)localObject2);
    if (localCdsContentParser.isFreeWithLogin())
    {
      i = 1;
      ((ContentValues)localObject1).put("content_isFreeWithLogin", Integer.valueOf(i));
      ((ContentValues)localObject1).put("content_contentVersion", localCdsContentParser.getContentVersion());
      ((ContentValues)localObject1).put("content_iconUrl", (String)localObject3);
      ((ContentValues)localObject1).put("content_iconVersion", localCdsContentParser.getIconVersion());
      if (!localCdsContentParser.isFree()) {
        break label617;
      }
    }
    label617:
    for (int i = 1;; i = 0)
    {
      ((ContentValues)localObject1).put("content_isFree", Integer.valueOf(i));
      ((ContentValues)localObject1).put("content_shopBackgroundColor", localCdsContentParser.getShopBackgroundColor());
      ((ContentValues)localObject1).put("content_author", localCdsContentParser.getAuthor());
      ((ContentValues)localObject1).put("content_authorHyperlink", localCdsContentParser.getAuthorHyperlink());
      ((ContentValues)localObject1).put("content_socialMediaString", localCdsContentParser.getSocialMediaString());
      ((ContentValues)localObject1).put("content_numItems", Integer.valueOf(localCdsContentParser.getItems().size()));
      ((ContentValues)localObject1).put("content_featureImageURL", str2);
      ((ContentValues)localObject1).put("content_featureImageVersion", localCdsContentParser.getFeatureImageVersion());
      ((ContentValues)localObject1).put("content_previewURL", str3);
      ((ContentValues)localObject1).put("content_previewVersion", localCdsContentParser.getPreviewVersion());
      ((ContentValues)localObject1).put("content_detailImageURL", str4);
      ((ContentValues)localObject1).put("content_detailImageVersion", localCdsContentParser.getDetailImageVersion());
      if (paramBoolean) {
        ((ContentValues)localObject1).put("content_purchased", Integer.valueOf(1));
      }
      localArrayList.add(localObject1);
      localObject1 = localCdsContentParser.getItems();
      i = 0;
      while (i < ((List)localObject1).size())
      {
        localObject2 = (CdsContentParser.ContentItem)((List)localObject1).get(i);
        localObject3 = new ContentValues();
        ((ContentValues)localObject3).put("item_identifier", ((CdsContentParser.ContentItem)localObject2).getIdentifier());
        ((ContentValues)localObject3).put("item_displayName", ((CdsContentParser.ContentItem)localObject2).getDisplayName());
        if (((CdsContentParser.ContentItem)localObject2).getOptions() != null) {
          ((ContentValues)localObject3).put("item_options", ((CdsContentParser.ContentItem)localObject2).getOptions());
        }
        localArrayList.add(localObject3);
        i += 1;
      }
      i = 0;
      break;
    }
    long l = insertNewPackContentAndItems(paramSQLiteDatabase, (ContentValues[])localArrayList.toArray(new ContentValues[localArrayList.size()]));
    LOGGER.log("added pack: %d", new Object[] { Long.valueOf(l) });
    if (l > -1L) {}
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      extractIcon(paramSQLiteDatabase, localCdsContentParser.getIconURL(), paramJSONObject, l);
      if (paramBoolean) {
        extractContent(paramSQLiteDatabase, localCdsContentParser.getContentURL(), paramJSONObject, l, str1);
      }
      return;
    }
  }
  
  private static String normalizeUrlForDatabase(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return "";
    }
    LOGGER.info("normalizeUrlForDatabase: " + paramString);
    if (Uri.parse(paramString).getScheme() == null)
    {
      LoggerFactory.Logger localLogger = LOGGER;
      StringBuilder localStringBuilder = new StringBuilder().append("return: ").append("http://assets.aviary.com");
      Object localObject;
      if (paramString.startsWith("/"))
      {
        localObject = paramString;
        localLogger.log((String)localObject);
        localObject = new StringBuilder().append("http://assets.aviary.com");
        if (!paramString.startsWith("/")) {
          break label153;
        }
      }
      for (;;)
      {
        return paramString;
        localObject = "/" + paramString;
        break;
        label153:
        paramString = "/" + paramString;
      }
    }
    LOGGER.log("return: " + paramString);
    return paramString;
  }
  
  private void updateManifestVersion(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
    throws AssertionError
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("version_versionKey", paramString1);
    localContentValues.put("version_assetsBaseURL", paramString2);
    if (paramSQLiteDatabase.insert("version_table", null, localContentValues) > -1L) {}
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      return;
    }
  }
  
  public boolean loadDefaultContent(SQLiteDatabase paramSQLiteDatabase)
  {
    Cursor localCursor = paramSQLiteDatabase.query("version_table", new String[] { "version_id" }, null, null, null, null, null, "1");
    if (localCursor != null) {}
    try
    {
      if (localCursor.getCount() > 0)
      {
        LOGGER.warn("database is not empty");
        return false;
      }
      IOUtils.closeSilently(localCursor);
      if (paramSQLiteDatabase.isReadOnly())
      {
        LOGGER.warn("Failed to load default content because db is readOnly.");
        return false;
      }
    }
    finally
    {
      IOUtils.closeSilently(localCursor);
    }
    paramSQLiteDatabase.beginTransaction();
    LOGGER.log("Beginning load default content transaction");
    try
    {
      loadPackContent(paramSQLiteDatabase, new JSONObject("{\"packType\":\"effect\",\"displayName\":\"Original\",\"displayDescription\":\"Get started with this free pack of essential effects for beautiful, everyday photography.\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.be9be7e9-745f-4234-a84b-b0e043618328.300.jpg\",\"iconVersion\":\"10e000b71ff1fc07b275f460783850f7\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"previewURL\":\"/cdsv2/assets/com.aviary.effectpack.04/zips.androidPreviewPhoneXXHiRes.4e8edf7f-538b-4afa-bb63-3f5327b51436.zip\",\"previewVersion\":\"29318948dc1b06497c6887fbd1dc0f7f\",\"contentURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.effectJSON.235ff3a1-fdd8-4d16-b625-517945f61c82.zip\",\"contentVersion\":\"b74040f3396d01906ff02a346dfd4f21\",\"isFree\":true,\"pcnPriceTier\":0,\"identifier\":\"com.aviary.effectpack.04\",\"featureImageURL\":\"/cdsv2/testcontent/com.aviary.effectpack.04/images.androidFeatureImage.81f193b2-d02c-4dba-8811-31a77b359fbb.980.jpg\",\"featureImageVersion\":\"0\",\"detailImageURL\":\"/cdsv2/testcontent/com.aviary.effectpack.04/images.androidDetailImage.dff72372-7f7e-4bc1-aa98-88ac17fb5457.1080.jpg\",\"detailImageVersion\":\"0\",\"items\":[{\"identifier\":\"default5\",\"displayName\":\"Clyde\"},{\"identifier\":\"default10\",\"displayName\":\"Avenue\"},{\"identifier\":\"default2\",\"displayName\":\"Haas\"},{\"identifier\":\"default9\",\"displayName\":\"Arizona\"},{\"identifier\":\"default11\",\"displayName\":\"Lucky\"},{\"identifier\":\"default1\",\"displayName\":\"Dean\"},{\"identifier\":\"default8\",\"displayName\":\"Keylime\"},{\"identifier\":\"default3\",\"displayName\":\"Boardwalk\"},{\"identifier\":\"default7\",\"displayName\":\"Sentosa\"},{\"identifier\":\"default13\",\"displayName\":\"Sage\"},{\"identifier\":\"default6\",\"displayName\":\"Metropolis\"},{\"identifier\":\"default12\",\"displayName\":\"Cruz\"}],\"versionKey\":\"53a0643f5920039d84000167\",\"v\":1404419997941,\"code\":0,\"status\":\"Ok\"}"), true);
      loadPackContent(paramSQLiteDatabase, new JSONObject("{\"packType\":\"sticker\",\"displayName\":\"Original\",\"displayDescription\":\"Decorate all of your photos with this fun and totally free pack of hats, eyewear, neckwear, speech bubbles, shapes and more!\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.593086a0-76eb-44a5-9285-2459e4660bd8.300.png\",\"iconVersion\":\"94e5bb72e131575b612a49c68c95bbd3\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/images.androidFeatureImage.faedc45c-e914-4bd4-95f7-5ebeccb781be.980.jpg\",\"featureImageVersion\":\"e8c8e313e8c7f73563d412749f961a80\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.9cdb2f88-b089-458a-9f23-76400c261b0b.1080.jpg\",\"detailImageVersion\":\"81a734b8cdc31dcb8dcd5663cd382645\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.733886ea-16cc-4292-8af7-6b3c78caa187.zip\",\"previewVersion\":\"b21916443b1bdcb699e6f99bab5bea6c\",\"contentURL\":\"/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/zips.contentAndroidHiRes.0137fe97-9900-480e-bacc-51ed4128ca46.zip\",\"contentVersion\":\"2139119ea57de6f295d5ae2274ba8c14\",\"isFree\":true,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.sticker.53d185cc6b76fe302f001cde\",\"items\":[{\"identifier\":\"original-bolt\",\"displayName\":\"Original Bolt\"},{\"identifier\":\"original-money\",\"displayName\":\"Original Money\"},{\"identifier\":\"original-mustache\",\"displayName\":\"Original Mustache\"},{\"identifier\":\"original-arrow\",\"displayName\":\"Original Arrow\"},{\"identifier\":\"original-arrowcross\",\"displayName\":\"Original Arrowcross\"},{\"identifier\":\"original-beauty\",\"displayName\":\"Original Beauty\"},{\"identifier\":\"original-circle\",\"displayName\":\"Original Circle\"},{\"identifier\":\"original-circlestripe\",\"displayName\":\"Original Circlestripe\"},{\"identifier\":\"original-embellishment\",\"displayName\":\"Original Embellishment\"},{\"identifier\":\"original-eyelashL\",\"displayName\":\"Original EyelashL\"},{\"identifier\":\"original-eyelashR\",\"displayName\":\"Original EyelashR\"},{\"identifier\":\"original-glasses\",\"displayName\":\"Original Glasses\"},{\"identifier\":\"original-hand1\",\"displayName\":\"Original Hand1\"},{\"identifier\":\"original-hand2\",\"displayName\":\"Original Hand2\"},{\"identifier\":\"original-hexagon\",\"displayName\":\"Original Hexagon\"},{\"identifier\":\"original-kitchen\",\"displayName\":\"Original Kitchen\"},{\"identifier\":\"original-lips\",\"displayName\":\"Original Lips\"},{\"identifier\":\"original-love\",\"displayName\":\"Original Love\"},{\"identifier\":\"original-skull\",\"displayName\":\"Original Skull\"},{\"identifier\":\"original-sombrero\",\"displayName\":\"Original Sombrero\"},{\"identifier\":\"original-square\",\"displayName\":\"Original Square\"},{\"identifier\":\"original-stars\",\"displayName\":\"Original Stars\"},{\"identifier\":\"original-truth\",\"displayName\":\"Original Truth\"},{\"identifier\":\"original-wreath\",\"displayName\":\"Original Wreath\"}],\"versionKey\":\"53dfa8b965374ff32600025e\",\"v\":1411160277221,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"), false);
      loadPackContent(paramSQLiteDatabase, new JSONObject("{\"packType\":\"frame\",\"displayName\":\"Original\",\"displayDescription\":\"A collection of beautiful, versatile frames to get you started with Aviary.\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.7b749c3b-f657-4c39-8919-9f065caef753.300.png\",\"iconVersion\":\"4c1240a2312b16c113b5704fd277a4d7\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/images.androidFeatureImage.31ad3bc8-af49-4a00-9445-1463854ad589.980.jpg\",\"featureImageVersion\":\"edfa3dcb2a52de25edc38e3349920cc3\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.9cf957a7-be64-4dbb-818b-63ba2854dec9.1080.jpg\",\"detailImageVersion\":\"0a1f306453a963546067379785c9828b\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.783ecc43-f4fa-4818-9a87-97b1c84f68ee.zip\",\"previewVersion\":\"546b8a102022342dc2d2dc000a90a5a0\",\"contentURL\":\"/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/zips.contentAndroidHiRes.51b9118e-1527-4a42-bea9-856adff83db3.zip\",\"contentVersion\":\"3820dfc8be90338a24fbf5abdb3c07a9\",\"isFree\":true,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.frame.53ced8b78abeb3083b001e4a\",\"items\":[{\"identifier\":\"original-Aura\",\"displayName\":\"Aura\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Borde\",\"displayName\":\"Borde\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Lumen\",\"displayName\":\"Lumen\",\"options\":{\"width\":0.3}},{\"identifier\":\"original-Noir\",\"displayName\":\"Noir\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Stella\",\"displayName\":\"Stella\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Notte\",\"displayName\":\"Notte\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Vela\",\"displayName\":\"Vela\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Capa\",\"displayName\":\"Capa\",\"options\":{\"width\":0.35}},{\"identifier\":\"original-Sole\",\"displayName\":\"Sole\",\"options\":{\"width\":0.4}},{\"identifier\":\"original-Luna\",\"displayName\":\"Luna\",\"options\":{\"width\":0.4}},{\"identifier\":\"original-Fino\",\"displayName\":\"Fino\",\"options\":{\"width\":0.5}},{\"identifier\":\"original-Rima\",\"displayName\":\"Rima\",\"options\":{\"width\":0.5}}],\"versionKey\":\"53cedd7e8abeb3083b001fc1\",\"v\":1411160596064,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"), false);
      loadPackContent(paramSQLiteDatabase, new JSONObject("{\"packType\":\"overlay\",\"displayName\":\"Original\",\"displayDescription\":\"Explore Overlays with a free starter pack of classic, sharable shapes. Pro Tip: Pinch your photo in or out to perfectly place the overlay!\",\"icon\":\"file:///android_asset/aviary/cdsv2/assets/images.largeIcon.e9d184f0-e91d-46e1-afc2-56096684a954.300.png\",\"iconVersion\":\"4f5885e76982129580ba42c72937c6a4\",\"author\":\"Aviary\",\"authorHyperlink\":null,\"socialMediaString\":null,\"shopBackgroundColor\":\"#1c2027\",\"featureImageURL\":\"/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/images.androidFeatureImage.d4f40ea1-14ce-43f4-b091-c0968b743e31.980.jpg\",\"featureImageVersion\":\"16022ce5993f9020b9587017784206ee\",\"detailImageURL\":\"file:///android_asset/aviary/cdsv2/assets/images.androidDetailImage.5e96bfcc-62ec-4a4c-bf3b-20f3cf295bd2.1080.jpg\",\"detailImageVersion\":\"a28b079ac99cc6ddc0d47574ef41e133\",\"previewURL\":\"file:///android_asset/aviary/cdsv2/assets/zips.androidPreviewHiRes.9153b745-c9fc-4228-8038-aa82ad3dfa74.zip\",\"previewVersion\":\"b9263f146ac845e43248d67b5e271b68\",\"contentURL\":\"/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/zips.contentAndroidHiRes.636f77f1-da87-48da-a294-377e0fc1d5d7.zip\",\"contentVersion\":\"254e626c3d990e27e341cd25867e12ee\",\"isFree\":true,\"isFreeWithLogin\":false,\"pcnPriceTier\":2,\"identifier\":\"com.aviary.overlay.54384c3ffd87927c3c000001\",\"items\":[{\"identifier\":\"Circle 1\",\"displayName\":\"Circle 1\"},{\"identifier\":\"Circle 2\",\"displayName\":\"Circle 2\"},{\"identifier\":\"Cross 1\",\"displayName\":\"Cross 1\"},{\"identifier\":\"Cross 2\",\"displayName\":\"Cross 2\"},{\"identifier\":\"Hex 1\",\"displayName\":\"Hex 1\"},{\"identifier\":\"Hex 2\",\"displayName\":\"Hex 2\"},{\"identifier\":\"Vertical 1\",\"displayName\":\"Vertical 1\"},{\"identifier\":\"Vertical 2\",\"displayName\":\"Vertical 2\"},{\"identifier\":\"Scape 1\",\"displayName\":\"Scape 1\"},{\"identifier\":\"Scape 2\",\"displayName\":\"Scape 2\"},{\"identifier\":\"Square 1\",\"displayName\":\"Square 1\"},{\"identifier\":\"Square 2\",\"displayName\":\"Square 2\"}],\"versionKey\":\"54f4e8b7eba8dc6a3e062888\",\"v\":1427205395409,\"assetsBaseURL\":\"http://assets.aviary.com\",\"code\":0,\"status\":\"Ok\"}"), false);
      updateManifestVersion(paramSQLiteDatabase, "0", "http://assets.aviary.com");
      paramSQLiteDatabase.setTransactionSuccessful();
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        if (PackageManagerUtils.isStandalone(mContext)) {
          Toast.makeText(mContext, "Cannot install the default effects. Please make sure you've included the assets folder from the CreativeSDKImage project!", 1).show();
        }
        LOGGER.log("finally");
        paramSQLiteDatabase.endTransaction();
      }
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      LOGGER.warn("Error in JSON parsing.");
      return false;
    }
    finally
    {
      LOGGER.log("finally");
      paramSQLiteDatabase.endTransaction();
    }
    LOGGER.log("Load default content success");
    return true;
  }
  
  public int updateContentPath(SQLiteDatabase paramSQLiteDatabase, long paramLong, String paramString)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("content_contentPath", paramString);
    localContentValues.put("content_installDate", DateTimeUtils.toSqlDateTime(System.currentTimeMillis()));
    return paramSQLiteDatabase.update("content_table", localContentValues, "content_packId=?", new String[] { String.valueOf(paramLong) });
  }
  
  public int updateIconPath(SQLiteDatabase paramSQLiteDatabase, long paramLong, String paramString, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("content_iconPath", paramString);
    localContentValues.put("content_iconNeedDownload", Integer.valueOf(paramInt));
    return paramSQLiteDatabase.update("content_table", localContentValues, "content_packId=?", new String[] { String.valueOf(paramLong) });
  }
}
