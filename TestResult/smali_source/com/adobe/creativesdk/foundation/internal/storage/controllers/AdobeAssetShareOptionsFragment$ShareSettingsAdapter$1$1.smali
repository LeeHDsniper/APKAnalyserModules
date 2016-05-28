.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;
.super Ljava/lang/Object;
.source "AdobeAssetShareOptionsFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<[B",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

.field final synthetic val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 3
    .param p1, "this$2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    .prologue
    .line 322
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 1

    .prologue
    .line 326
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 322
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 12
    .param p1, "requestResult"    # [B

    .prologue
    .line 331
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jpg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 332
    .local v4, "fileName":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v8}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 333
    .local v5, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 334
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 335
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 336
    .local v2, "fOut":Ljava/io/FileOutputStream;
    invoke-virtual {v2, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 338
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 339
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "title"

    invoke-virtual {v6, v7, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    const-string v7, "description"

    const-string v8, "adobe creativeCloud"

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    const-string v7, "datetaken"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 342
    const-string v7, "bucket_id"

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 343
    const-string v7, "bucket_display_name"

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    const-string v7, "_data"

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 347
    .local v0, "cr":Landroid/content/ContentResolver;
    sget-object v7, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v7, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 349
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    .line 350
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-string v8, "File saved to gallery"

    const/4 v9, 0x0

    .line 349
    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 352
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c8} :catch_c9

    .line 359
    .end local v0    # "cr":Landroid/content/ContentResolver;
    .end local v2    # "fOut":Ljava/io/FileOutputStream;
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "values":Landroid/content/ContentValues;
    :goto_c8
    return-void

    .line 354
    :catch_c9
    move-exception v1

    .line 355
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_c8
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 364
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 322
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 369
    return-void
.end method
