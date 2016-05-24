.class Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;
.super Ljava/lang/Object;
.source "AdobeImageEditorController.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->activateTool(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/os/Bundle;Landroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 251
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCloseEnd()V
    .registers 1

    .prologue
    .line 265
    return-void
.end method

.method public onCloseStart()V
    .registers 1

    .prologue
    .line 262
    return-void
.end method

.method public onOpenEnd()V
    .registers 3

    .prologue
    .line 257
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const/4 v1, 0x2

    # invokes: Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->access$000(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;I)V

    .line 258
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->access$100(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOnViewChangingStatusListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;)V

    .line 259
    return-void
.end method

.method public onOpenStart()V
    .registers 1

    .prologue
    .line 253
    return-void
.end method
