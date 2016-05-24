.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;
.super Ljava/lang/Object;
.source "AdobeUXMobilePackageItemOneUpViewerActivity.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->setUpMobilePackageController(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->removeMobilePackageInitializedObserver()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->startItemsOneUpDisplay()V

    .line 103
    return-void
.end method
