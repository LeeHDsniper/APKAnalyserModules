.class Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;
.super Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;
.source "MemePanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/MemePanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    .prologue
    .line 413
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;-><init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 415
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 418
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 10
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 422
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v3

    instance-of v3, v3, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v3, :cond_1e

    .line 423
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 425
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v3

    if-nez v3, :cond_1f

    .line 446
    .end local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_1e
    :goto_1e
    return-void

    .line 429
    .restart local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_1f
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setText(Ljava/lang/String;)V

    .line 431
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_65

    .line 432
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v3, p1}, Lcom/adobe/android/ui/view/AdobeButton;->setText(Ljava/lang/CharSequence;)V

    .line 433
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    if-eqz p1, :cond_63

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-lez v4, :cond_63

    :goto_45
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 439
    :cond_48
    :goto_48
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v1

    if-eqz v1, :cond_5d

    .line 440
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 443
    :cond_5d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged()V
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V

    goto :goto_1e

    :cond_63
    move v1, v2

    .line 433
    goto :goto_45

    .line 434
    :cond_65
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 435
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v3, p1}, Lcom/adobe/android/ui/view/AdobeButton;->setText(Ljava/lang/CharSequence;)V

    .line 436
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    if-eqz p1, :cond_88

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-lez v4, :cond_88

    :goto_84
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_48

    :cond_88
    move v1, v2

    goto :goto_84
.end method
