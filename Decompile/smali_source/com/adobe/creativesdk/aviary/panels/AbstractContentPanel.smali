.class public abstract Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;
.source "AbstractContentPanel.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;
    }
.end annotation


# instance fields
.field protected mDrawingPanel:Landroid/view/View;

.field protected mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 19
    return-void
.end method


# virtual methods
.method protected contentReady()V
    .registers 3

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 45
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 47
    :cond_12
    return-void
.end method

.method protected abstract generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end method

.method public final getContentView()Landroid/view/View;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->mDrawingPanel:Landroid/view/View;

    return-object v0
.end method

.method public final getContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->mDrawingPanel:Landroid/view/View;

    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->mDrawingPanel:Landroid/view/View;

    return-object v0
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->setEnabled(Z)V

    .line 35
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 36
    return-void
.end method
