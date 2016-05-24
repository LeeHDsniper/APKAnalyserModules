.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$6;
.super Ljava/lang/Object;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->showUploadSummaryBar(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 676
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 679
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_uploadSummaryBanner:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;

    move-result-object v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_uploadSummaryBanner:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;->bannerView:Landroid/view/View;

    if-eqz v0, :cond_1f

    .line 680
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_uploadSummaryBanner:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadSummaryBanner;->bannerView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 681
    :cond_1f
    return-void
.end method
