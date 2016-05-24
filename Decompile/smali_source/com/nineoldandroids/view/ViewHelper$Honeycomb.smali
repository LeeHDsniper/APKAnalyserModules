.class final Lcom/nineoldandroids/view/ViewHelper$Honeycomb;
.super Ljava/lang/Object;
.source "ViewHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/view/ViewHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Honeycomb"
.end annotation


# direct methods
.method static getAlpha(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 181
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    return v0
.end method

.method static setTranslationX(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "translationX"    # F

    .prologue
    .line 265
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 266
    return-void
.end method

.method static setTranslationY(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "translationY"    # F

    .prologue
    .line 273
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 274
    return-void
.end method
