.class public final Lcom/nineoldandroids/view/ViewHelper;
.super Ljava/lang/Object;
.source "ViewHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/view/ViewHelper$Honeycomb;
    }
.end annotation


# direct methods
.method public static getAlpha(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 12
    sget-boolean v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_d

    invoke-static {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->getAlpha()F

    move-result v0

    :goto_c
    return v0

    :cond_d
    invoke-static {p0}, Lcom/nineoldandroids/view/ViewHelper$Honeycomb;->getAlpha(Landroid/view/View;)F

    move-result v0

    goto :goto_c
.end method

.method public static setTranslationX(Landroid/view/View;F)V
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "translationX"    # F

    .prologue
    .line 136
    sget-boolean v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_c

    .line 137
    invoke-static {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setTranslationX(F)V

    .line 141
    :goto_b
    return-void

    .line 139
    :cond_c
    invoke-static {p0, p1}, Lcom/nineoldandroids/view/ViewHelper$Honeycomb;->setTranslationX(Landroid/view/View;F)V

    goto :goto_b
.end method

.method public static setTranslationY(Landroid/view/View;F)V
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "translationY"    # F

    .prologue
    .line 148
    sget-boolean v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    if-eqz v0, :cond_c

    .line 149
    invoke-static {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setTranslationY(F)V

    .line 153
    :goto_b
    return-void

    .line 151
    :cond_c
    invoke-static {p0, p1}, Lcom/nineoldandroids/view/ViewHelper$Honeycomb;->setTranslationY(Landroid/view/View;F)V

    goto :goto_b
.end method
