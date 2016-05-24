.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$3;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisView(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 660
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 664
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$3;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

    move-result-object v0

    invoke-interface {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;->onPublishWIPViewClose()V

    .line 665
    return-void
.end method
