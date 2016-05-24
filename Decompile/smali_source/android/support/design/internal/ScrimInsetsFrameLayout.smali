.class public Landroid/support/design/internal/ScrimInsetsFrameLayout;
.super Landroid/widget/FrameLayout;
.source "ScrimInsetsFrameLayout.java"


# instance fields
.field private mInsetForeground:Landroid/graphics/drawable/Drawable;

.field private mInsets:Landroid/graphics/Rect;

.field private mTempRect:Landroid/graphics/Rect;


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 82
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 84
    invoke-virtual {p0}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->getWidth()I

    move-result v2

    .line 85
    .local v2, "width":I
    invoke-virtual {p0}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->getHeight()I

    move-result v0

    .line 86
    .local v0, "height":I
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    if-eqz v3, :cond_94

    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_94

    .line 87
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 88
    .local v1, "sc":I
    invoke-virtual {p0}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->getScrollX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->getScrollY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 91
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3, v7, v7, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 92
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 93
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 96
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v0, v4

    invoke-virtual {v3, v7, v4, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 97
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 98
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 101
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v7, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 102
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 103
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 106
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int v4, v2, v4

    iget-object v5, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v4, v5, v2, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 107
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 108
    iget-object v3, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 110
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 112
    .end local v1    # "sc":I
    :cond_94
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 116
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 117
    iget-object v0, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    .line 118
    iget-object v0, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 120
    :cond_c
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 124
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 125
    iget-object v0, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_d

    .line 126
    iget-object v0, p0, Landroid/support/design/internal/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 128
    :cond_d
    return-void
.end method
