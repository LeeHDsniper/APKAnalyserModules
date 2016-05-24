.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;
.super Ljava/lang/Object;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->generateShareIntentInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

.field final synthetic val$item:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->val$item:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 10
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 309
    const/4 v1, 0x0

    .line 310
    .local v1, "contentUri":Landroid/net/Uri;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->val$item:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getUniqueNameForLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;
    invoke-static {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "baseName":Ljava/lang/String;
    :try_start_9
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".png"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 313
    .local v4, "renditionFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    move-result v5

    if-eqz v5, :cond_47

    .line 314
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 315
    .local v3, "fo":Ljava/io/FileOutputStream;
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {p1, v5, v6, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 316
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 317
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 318
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getFileProvideAuthority()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_46} :catch_48

    move-result-object v1

    .line 326
    .end local v3    # "fo":Ljava/io/FileOutputStream;
    .end local v4    # "renditionFile":Ljava/io/File;
    :cond_47
    :goto_47
    return-void

    .line 320
    :catch_48
    move-exception v2

    .line 322
    .local v2, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "AdobeUXLibraryItemCollectionOneUpViewerActivity"

    const/4 v7, 0x0

    invoke-static {v5, v6, v7, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_47
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 306
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
