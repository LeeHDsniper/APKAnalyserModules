.class Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectEditAdapter.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;)V
    .registers 2
    .param p1, "this$1"    # Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 6
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 104
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->this$0:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    # getter for: Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->callback:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;
    invoke-static {v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->access$000(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;)Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

    move-result-object v1

    if-eqz v1, :cond_4e

    .line 105
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->this$0:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget v2, v2, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$itemPosition:I

    invoke-virtual {v1, v2}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 106
    .local v0, "item":Lcom/behance/sdk/project/modules/ImageModule;
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->this$0:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    # getter for: Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->callback:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;
    invoke-static {v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->access$000(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;)Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;->onRotate(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 107
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageView:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v2, v2, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$image:Lcom/behance/sdk/project/modules/ImageModule;

    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v3, v3, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 108
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageView:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 109
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 110
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;->this$1:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    iget-object v1, v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 113
    .end local v0    # "item":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_4e
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 118
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 100
    return-void
.end method
