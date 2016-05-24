.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;
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
    .line 380
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 1

    .prologue
    .line 414
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 380
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 9
    .param p1, "requestResult"    # [B

    .prologue
    .line 397
    :try_start_0
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v1

    .line 398
    .local v1, "fileName":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v6}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 399
    .local v4, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 400
    .local v2, "localFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 401
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 402
    .local v0, "fOut":Ljava/io/FileOutputStream;
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 404
    new-instance v3, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;

    invoke-direct {v3, v2}, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;-><init>(Ljava/io/File;)V

    .line 405
    .local v3, "options":Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->launchPublishWIP(Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;Landroid/content/Context;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_45} :catch_46

    .line 409
    .end local v0    # "fOut":Ljava/io/FileOutputStream;
    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "localFile":Ljava/io/File;
    .end local v3    # "options":Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;
    .end local v4    # "path":Ljava/lang/String;
    :goto_45
    return-void

    .line 406
    :catch_46
    move-exception v5

    goto :goto_45
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 390
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 380
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingsAdapter$1$2;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 385
    return-void
.end method
