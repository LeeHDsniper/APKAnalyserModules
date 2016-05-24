.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$2;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->initializeEditProjectScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->launchCameraToCapturePicture()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    .line 189
    return-void
.end method
