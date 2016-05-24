.class Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;
.super Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;
.source "TextPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/TextPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;-><init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "afterTextChanged"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 7
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "beforeTextChanged"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 7
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 89
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    instance-of v1, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v1, :cond_1c

    .line 90
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 92
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v1

    if-nez v1, :cond_1d

    .line 97
    .end local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_1c
    :goto_1c
    return-void

    .line 95
    .restart local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_1d
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setText(Ljava/lang/String;)V

    goto :goto_1c
.end method
