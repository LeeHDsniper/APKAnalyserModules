.class Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;
.super Ljava/lang/Object;
.source "BehanceSDKCCBrowserHeadlessFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadOriginalFile(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<",
        "Ljava/lang/Boolean;",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

.field final synthetic val$targetFile:Ljava/io/File;

.field final synthetic val$totalSize:I


# direct methods
.method constructor <init>(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/io/File;I)V
    .registers 4
    .param p1, "this$0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    iput-object p2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    iput p3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$totalSize:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 242
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 244
    :cond_d
    return-void
.end method

.method public onCompletion(Ljava/lang/Boolean;)V
    .registers 4
    .param p1, "aBoolean"    # Ljava/lang/Boolean;

    .prologue
    .line 249
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    # getter for: Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->files:Ljava/util/List;
    invoke-static {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->access$600(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    iget v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$totalSize:I

    # invokes: Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->checkForDownloadComplete(I)V
    invoke-static {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->access$200(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;I)V

    .line 251
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 238
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->onCompletion(Ljava/lang/Boolean;)V

    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 8
    .param p1, "e"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    # getter for: Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->downloadErrors:Ljava/util/List;
    invoke-static {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    sget v2, Lcom/behance/sdk/R$string;->bsdk_cc_asset_browser_file_download_error:I

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$targetFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->showMessage(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->access$100(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;Ljava/lang/String;)V

    .line 257
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;

    iget v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->val$totalSize:I

    # invokes: Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->checkForDownloadComplete(I)V
    invoke-static {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;->access$200(Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment;I)V

    .line 258
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 238
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment$2;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 263
    return-void
.end method
