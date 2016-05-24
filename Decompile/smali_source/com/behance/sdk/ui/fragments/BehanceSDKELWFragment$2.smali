.class Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;
.super Ljava/lang/Object;
.source "BehanceSDKELWFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->dismiss()V

    .line 61
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 62
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

    move-result-object v0

    invoke-interface {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;->onCancelButtonPressed()V

    .line 63
    :cond_16
    return-void
.end method
