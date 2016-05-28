.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PreviewDrawableChangedEvent"
.end annotation


# instance fields
.field public final drawable:Landroid/graphics/drawable/Drawable;

.field public final reset:Z


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/drawable/Drawable;Z)V
    .registers 4
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p3, "reset"    # Z

    .prologue
    .line 670
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 671
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;->drawable:Landroid/graphics/drawable/Drawable;

    .line 672
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;->reset:Z

    .line 673
    return-void
.end method
