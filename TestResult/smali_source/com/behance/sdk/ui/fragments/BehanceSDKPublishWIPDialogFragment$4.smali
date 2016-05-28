.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$4;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPDialogFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


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
    .line 983
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$4;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 3
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 995
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$4;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updatePublishBtnState()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    .line 996
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 991
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 987
    return-void
.end method
