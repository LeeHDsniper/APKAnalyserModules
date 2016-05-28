.class Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectEditAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$image:Lcom/behance/sdk/project/modules/ImageModule;

.field final synthetic val$imageView:Landroid/widget/ImageView;

.field final synthetic val$imageViewDuplicate:Landroid/widget/ImageView;

.field final synthetic val$itemPosition:I

.field final synthetic val$rotateImage:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;Landroid/content/Context;Landroid/view/View;Landroid/widget/ImageView;Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;I)V
    .registers 8
    .param p1, "this$0"    # Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->this$0:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    iput-object p2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$rotateImage:Landroid/view/View;

    iput-object p4, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$image:Lcom/behance/sdk/project/modules/ImageModule;

    iput-object p6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageView:Landroid/widget/ImageView;

    iput p7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$itemPosition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 90
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$context:Landroid/content/Context;

    sget v3, Lcom/behance/sdk/R$anim;->bsdk_fade_in:I

    invoke-static {v2, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 91
    .local v1, "fadeIn":Landroid/view/animation/Animation;
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$rotateImage:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 92
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$image:Lcom/behance/sdk/project/modules/ImageModule;

    iget-object v4, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$context:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 93
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 94
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageView:Landroid/widget/ImageView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 95
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$context:Landroid/content/Context;

    sget v3, Lcom/behance/sdk/R$anim;->bsdk_thumbail_rotate:I

    invoke-static {v2, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 96
    .local v0, "anim":Landroid/view/animation/Animation;
    new-instance v2, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;

    invoke-direct {v2, p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1$1;-><init>(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 120
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;->val$imageViewDuplicate:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 122
    return-void
.end method
