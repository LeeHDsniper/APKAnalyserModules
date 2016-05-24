.class Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;
.super Ljava/lang/Object;
.source "MessagePromoDialogFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 4

    .prologue
    .line 101
    const-string v0, "MessageFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dialog size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 103
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    # invokes: Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->displayMessage(II)V
    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->access$000(Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;II)V

    .line 105
    return-void
.end method
