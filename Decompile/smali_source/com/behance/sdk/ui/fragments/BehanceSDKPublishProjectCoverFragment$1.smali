.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectCoverFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getClickListenerForImages()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 257
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 258
    .local v1, "id":I
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    const/4 v3, 0x0

    # setter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;
    invoke-static {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$002(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Lcom/behance/sdk/project/modules/CoverImage;)Lcom/behance/sdk/project/modules/CoverImage;

    .line 259
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    sget-object v3, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    # setter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
    invoke-static {v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$102(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 260
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    iget-object v2, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->actionBarForwardButton:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    invoke-virtual {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_addproject_project_cover_selection_right_nav_crop_txt:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showCoverImage(I)V
    invoke-static {v2, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;I)V

    .line 263
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;
    invoke-static {v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I
    invoke-static {v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 264
    .local v0, "childAt":Landroid/view/View;
    if-eqz v0, :cond_40

    .line 265
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->hideSelector(Landroid/view/View;)V
    invoke-static {v2, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Landroid/view/View;)V

    .line 267
    :cond_40
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showSelector(Landroid/view/View;)V
    invoke-static {v2, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Landroid/view/View;)V

    .line 268
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # setter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I
    invoke-static {v2, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$302(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;I)I

    .line 269
    return-void
.end method
