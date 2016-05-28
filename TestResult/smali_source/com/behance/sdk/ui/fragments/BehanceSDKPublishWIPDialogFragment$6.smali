.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
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
    .line 1094
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1098
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    if-ne v0, v1, :cond_13

    .line 1099
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToFacebookConfirmationDialog()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    .line 1100
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->LoginToFacebook()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    .line 1104
    :cond_12
    :goto_12
    return-void

    .line 1101
    :cond_13
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    if-ne v0, v1, :cond_12

    .line 1102
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToFacebookConfirmationDialog()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    goto :goto_12
.end method
