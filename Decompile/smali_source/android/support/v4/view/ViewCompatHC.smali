.class Landroid/support/v4/view/ViewCompatHC;
.super Ljava/lang/Object;
.source "ViewCompatHC.java"


# direct methods
.method public static combineMeasuredStates(II)I
    .registers 3
    .param p0, "curState"    # I
    .param p1, "newState"    # I

    .prologue
    .line 161
    invoke-static {p0, p1}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v0

    return v0
.end method

.method public static getAlpha(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    return v0
.end method

.method static getFrameTime()J
    .registers 2

    .prologue
    .line 25
    invoke-static {}, Landroid/animation/ValueAnimator;->getFrameDelay()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLayerType(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getLayerType()I

    move-result v0

    return v0
.end method

.method public static getMeasuredState(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredState()I

    move-result v0

    return v0
.end method

.method public static getScaleX(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v0

    return v0
.end method

.method public static getTranslationX(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    return v0
.end method

.method public static getTranslationY(Landroid/view/View;)F
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    return v0
.end method

.method public static jumpDrawablesToCurrentState(Landroid/view/View;)V
    .registers 1
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 149
    invoke-virtual {p0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    .line 150
    return-void
.end method

.method public static resolveSizeAndState(III)I
    .registers 4
    .param p0, "size"    # I
    .param p1, "measureSpec"    # I
    .param p2, "childMeasuredState"    # I

    .prologue
    .line 41
    invoke-static {p0, p1, p2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    return v0
.end method

.method public static setActivated(Landroid/view/View;Z)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "activated"    # Z

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 158
    return-void
.end method

.method public static setAlpha(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "value"    # F

    .prologue
    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 102
    return-void
.end method

.method public static setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "layerType"    # I
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 33
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 34
    return-void
.end method

.method public static setSaveFromParentEnabled(Landroid/view/View;Z)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "enabled"    # Z

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 154
    return-void
.end method

.method public static setScaleX(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "value"    # F

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 126
    return-void
.end method

.method public static setScaleY(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "value"    # F

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 130
    return-void
.end method

.method public static setTranslationX(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "value"    # F

    .prologue
    .line 93
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 94
    return-void
.end method

.method public static setTranslationY(Landroid/view/View;F)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "value"    # F

    .prologue
    .line 97
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 98
    return-void
.end method
