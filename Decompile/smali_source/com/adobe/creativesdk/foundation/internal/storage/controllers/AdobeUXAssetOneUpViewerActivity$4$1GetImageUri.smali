.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;
.super Landroid/os/AsyncTask;
.source "AdobeUXAssetOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->onCompletion([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetImageUri"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<[B",
        "Ljava/lang/Integer;",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field _failed:Z

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    .prologue
    .line 521
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([[B)Landroid/net/Uri;
    .registers 12
    .param p1, "dataBytes"    # [[B

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 525
    iput-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->_failed:Z

    .line 527
    if-nez p1, :cond_b

    .line 529
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->_failed:Z

    move-object v1, v6

    .line 560
    :cond_a
    :goto_a
    return-object v1

    .line 532
    :cond_b
    aget-object v2, p1, v7

    .line 534
    .local v2, "data":[B
    if-nez v2, :cond_13

    .line 536
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->_failed:Z

    move-object v1, v6

    .line 537
    goto :goto_a

    .line 540
    :cond_13
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v7

    if-nez v7, :cond_1b

    move-object v1, v6

    .line 541
    goto :goto_a

    .line 543
    :cond_1b
    const/4 v1, 0x0

    .line 544
    .local v1, "contentUri":Landroid/net/Uri;
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v8, v8, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->val$asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;
    invoke-static {v7, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v0

    .line 546
    .local v0, "baseName":Ljava/lang/String;
    :try_start_28
    new-instance v5, Ljava/io/File;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".png"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 547
    .local v5, "renditionFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 548
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 549
    .local v4, "fo":Ljava/io/FileOutputStream;
    invoke-virtual {v4, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 550
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->flush()V

    .line 551
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 552
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getFileProvideAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v5}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_65} :catch_67

    move-result-object v1

    goto :goto_a

    .line 554
    .end local v4    # "fo":Ljava/io/FileOutputStream;
    .end local v5    # "renditionFile":Ljava/io/File;
    :catch_67
    move-exception v3

    .line 557
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v8, "AdobeUXAssetOneUpViewerActivity"

    invoke-static {v7, v8, v6, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 521
    check-cast p1, [[B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->doInBackground([[B)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/net/Uri;)V
    .registers 5
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 569
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 578
    :goto_6
    return-void

    .line 572
    :cond_7
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->_failed:Z

    if-nez v0, :cond_18

    .line 573
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->val$assetIndex:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->enableOrDisableOpenBtn(IZ)V

    goto :goto_6

    .line 575
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    iget v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;->val$assetIndex:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->enableOrDisableOpenBtn(IZ)V

    goto :goto_6
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 521
    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->onPostExecute(Landroid/net/Uri;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .registers 2
    .param p1, "progress"    # [Ljava/lang/Integer;

    .prologue
    .line 566
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 521
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4$1GetImageUri;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
