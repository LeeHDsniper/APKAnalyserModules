.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$3;
.super Ljava/lang/Object;
.source "AdobeAssetViewNewCCFilesContainerFragment.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->registerLocalNofications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 289
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->closeSearchBarIfOpen()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    .line 290
    return-void
.end method
