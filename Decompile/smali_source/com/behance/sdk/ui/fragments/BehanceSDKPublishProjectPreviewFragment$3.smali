.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$3;
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
    .line 192
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 196
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 197
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;

    move-result-object v1

    .line 198
    .local v1, "instance":Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;
    invoke-virtual {v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKEmbedModuleDialog;->show()V

    .line 199
    return-void
.end method
