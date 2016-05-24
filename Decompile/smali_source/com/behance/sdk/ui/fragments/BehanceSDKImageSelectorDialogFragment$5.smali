.class Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$5;
.super Ljava/lang/Object;
.source "BehanceSDKImageSelectorDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .prologue
    .line 523
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$5;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$5;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    move-result-object v0

    invoke-interface {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;->onImageSelectorSelectionBackPressed()V

    .line 528
    return-void
.end method
