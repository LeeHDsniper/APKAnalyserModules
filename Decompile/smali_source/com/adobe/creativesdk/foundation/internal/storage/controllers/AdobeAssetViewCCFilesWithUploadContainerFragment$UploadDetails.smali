.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadDetails;
.super Ljava/lang/Object;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UploadDetails"
.end annotation


# instance fields
.field public isAnyUploadInProgress:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

.field public uploadSession:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$UploadDetails;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
