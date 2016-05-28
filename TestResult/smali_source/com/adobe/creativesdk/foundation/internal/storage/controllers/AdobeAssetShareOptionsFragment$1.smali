.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;
.super Ljava/lang/Object;
.source "AdobeAssetShareOptionsFragment.java"

# interfaces
.implements Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelSlideListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

.field final synthetic val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPanelAnchored(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v0, v1, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 163
    return-void
.end method

.method public onPanelCollapsed(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v0, v2, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setClickable(Z)V

    .line 152
    return-void
.end method

.method public onPanelExpanded(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v0, v1, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setClickable(Z)V

    .line 158
    return-void
.end method

.method public onPanelHidden(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v0, v1, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 168
    return-void
.end method

.method public onPanelSlide(Landroid/view/View;F)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "v"    # F

    .prologue
    const/4 v1, 0x0

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$1;->val$shadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v0, v1, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 145
    return-void
.end method
