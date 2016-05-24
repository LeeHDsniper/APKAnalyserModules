.class public Luk/co/senab/photoview/DefaultOnDoubleTapListener;
.super Ljava/lang/Object;
.source "DefaultOnDoubleTapListener.java"

# interfaces
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# instance fields
.field private photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 2
    .param p1, "photoViewAttacher"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->setPhotoViewAttacher(Luk/co/senab/photoview/PhotoViewAttacher;)V

    .line 24
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    .line 70
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-nez v6, :cond_7

    .line 71
    const/4 v5, 0x0

    .line 99
    :cond_6
    :goto_6
    return v5

    .line 74
    :cond_7
    :try_start_7
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    .line 75
    .local v0, "scale":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 76
    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 78
    .local v3, "y":F
    move v1, v0

    .line 80
    .local v1, "scaleSet":F
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v6

    cmpg-float v6, v0, v6

    if-gez v6, :cond_40

    .line 81
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v7

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v2, v3, v8}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 82
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v1

    .line 91
    :goto_32
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getZoomDelegate()Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    move-result-object v4

    .line 92
    .local v4, "zoomDelegate":Luk/co/senab/photoview/IPhotoViewZoomDelegate;
    if-eqz v4, :cond_6

    .line 93
    invoke-interface {v4, v1, v2, v3}, Luk/co/senab/photoview/IPhotoViewZoomDelegate;->signalZoomHandled(FFF)V

    goto :goto_6

    .line 95
    .end local v0    # "scale":F
    .end local v1    # "scaleSet":F
    .end local v2    # "x":F
    .end local v3    # "y":F
    .end local v4    # "zoomDelegate":Luk/co/senab/photoview/IPhotoViewZoomDelegate;
    :catch_3e
    move-exception v6

    goto :goto_6

    .line 83
    .restart local v0    # "scale":F
    .restart local v1    # "scaleSet":F
    .restart local v2    # "x":F
    .restart local v3    # "y":F
    :cond_40
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v6

    cmpl-float v6, v0, v6

    if-ltz v6, :cond_67

    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v6

    cmpg-float v6, v0, v6

    if-gez v6, :cond_67

    .line 84
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v7

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v2, v3, v8}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 85
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v1

    .line 86
    goto :goto_32

    .line 87
    :cond_67
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v7

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v2, v3, v8}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 88
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F
    :try_end_78
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_78} :catch_3e

    move-result v1

    goto :goto_32
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 105
    const/4 v0, 0x0

    return v0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x0

    .line 37
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-nez v7, :cond_6

    .line 65
    :cond_5
    :goto_5
    return v6

    .line 40
    :cond_6
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 42
    .local v1, "imageView":Landroid/widget/ImageView;
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object v7

    if-eqz v7, :cond_49

    .line 43
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 45
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_49

    .line 46
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 49
    .local v4, "y":F
    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v7

    if-eqz v7, :cond_49

    .line 51
    iget v6, v0, Landroid/graphics/RectF;->left:F

    sub-float v6, v2, v6

    .line 52
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 51
    div-float v3, v6, v7

    .line 53
    .local v3, "xResult":F
    iget v6, v0, Landroid/graphics/RectF;->top:F

    sub-float v6, v4, v6

    .line 54
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v7

    .line 53
    div-float v5, v6, v7

    .line 56
    .local v5, "yResult":F
    iget-object v6, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object v6

    invoke-interface {v6, v1, v3, v5}, Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    .line 57
    const/4 v6, 0x1

    goto :goto_5

    .line 61
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    .end local v2    # "x":F
    .end local v3    # "xResult":F
    .end local v4    # "y":F
    .end local v5    # "yResult":F
    :cond_49
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 62
    iget-object v7, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    invoke-interface {v7, v1, v8, v9}, Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    goto :goto_5
.end method

.method public setPhotoViewAttacher(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 2
    .param p1, "newPhotoViewAttacher"    # Luk/co/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 32
    iput-object p1, p0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;->photoViewAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    .line 33
    return-void
.end method
