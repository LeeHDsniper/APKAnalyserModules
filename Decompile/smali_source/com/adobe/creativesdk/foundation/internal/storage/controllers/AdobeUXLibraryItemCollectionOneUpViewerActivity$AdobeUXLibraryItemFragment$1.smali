.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1;
.super Ljava/lang/Object;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    .prologue
    .line 522
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 525
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .line 526
    .local v0, "activity":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->isCurrentItemRenderable()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 527
    iget-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    .line 528
    .local v1, "layout":Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setVisibility(I)V

    .line 530
    .end local v1    # "layout":Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
    :cond_14
    const/4 v2, 0x1

    return v2
.end method
