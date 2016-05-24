.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$1;
.super Ljava/lang/Object;
.source "AdobeUXAssetOneUpViewerActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    .prologue
    .line 830
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 833
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    .line 834
    .local v0, "layout":Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setVisibility(I)V

    .line 835
    const/4 v1, 0x1

    return v1
.end method
