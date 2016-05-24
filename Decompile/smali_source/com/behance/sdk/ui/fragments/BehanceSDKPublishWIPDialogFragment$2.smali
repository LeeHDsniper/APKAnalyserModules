.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getFocusChangeListerForLayout(Landroid/view/View;)Landroid/view/View$OnFocusChangeListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;Landroid/view/View;)V
    .registers 3
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    iput-object p2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 347
    if-eqz p2, :cond_9

    .line 348
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;->val$view:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 351
    :goto_8
    return-void

    .line 350
    :cond_9
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;->val$view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_8
.end method
