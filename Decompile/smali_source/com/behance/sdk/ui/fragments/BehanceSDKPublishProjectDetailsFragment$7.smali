.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectDetailsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 860
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 864
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    if-ne v0, v1, :cond_13

    .line 865
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToFacebookConfirmationDialog()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    .line 866
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->LoginToFacebook()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$800(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    .line 870
    :cond_12
    :goto_12
    return-void

    .line 867
    :cond_13
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    if-ne v0, v1, :cond_12

    .line 868
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToFacebookConfirmationDialog()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    goto :goto_12
.end method
