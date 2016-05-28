.class Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;
.super Ljava/lang/Object;
.source "AdobeImageEditorController.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onClose(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

.field final synthetic val$isConfirmed:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Z)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 580
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;->val$isConfirmed:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCloseEnd()V
    .registers 3

    .prologue
    .line 592
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;->val$isConfirmed:Z

    if-eqz v0, :cond_19

    const/4 v0, 0x4

    :goto_7
    # invokes: Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->access$000(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;I)V

    .line 593
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->access$100(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOnViewChangingStatusListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;)V

    .line 594
    return-void

    .line 592
    :cond_19
    const/4 v0, 0x5

    goto :goto_7
.end method

.method public onCloseStart()V
    .registers 1

    .prologue
    .line 588
    return-void
.end method

.method public onOpenEnd()V
    .registers 1

    .prologue
    .line 585
    return-void
.end method

.method public onOpenStart()V
    .registers 1

    .prologue
    .line 582
    return-void
.end method
