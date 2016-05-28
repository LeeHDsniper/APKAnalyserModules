.class public Lcom/behance/sdk/senab/photoview/PhotoView;
.super Landroid/widget/ImageView;
.source "PhotoView.java"


# instance fields
.field private final mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

.field private mPendingScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/behance/sdk/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 46
    new-instance v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-direct {v0, p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    .line 48
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_1b

    .line 49
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/senab/photoview/PhotoView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    .line 52
    :cond_1b
    return-void
.end method


# virtual methods
.method public getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getMaxScale()F
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getMaxScale()F

    move-result v0

    return v0
.end method

.method public getMidScale()F
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getMidScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getMinScale()F

    move-result v0

    return v0
.end method

.method public getScale()F
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 176
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 177
    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 3
    .param p1, "allow"    # Z

    .prologue
    .line 91
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setAllowParentInterceptOnEdge(Z)V

    .line 92
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 112
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 114
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->update()V

    .line 116
    :cond_c
    return-void
.end method

.method public setImageResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 120
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 121
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 122
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->update()V

    .line 124
    :cond_c
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 128
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 129
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 130
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->update()V

    .line 132
    :cond_c
    return-void
.end method

.method public setMaxScale(F)V
    .registers 3
    .param p1, "maxScale"    # F

    .prologue
    .line 106
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setMaxScale(F)V

    .line 107
    return-void
.end method

.method public setMidScale(F)V
    .registers 3
    .param p1, "midScale"    # F

    .prologue
    .line 101
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setMidScale(F)V

    .line 102
    return-void
.end method

.method public setMinScale(F)V
    .registers 3
    .param p1, "minScale"    # F

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setMinScale(F)V

    .line 97
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 142
    return-void
.end method

.method public setOnMatrixChangeListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setOnMatrixChangeListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    .line 137
    return-void
.end method

.method public setOnPhotoTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setOnPhotoTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V

    .line 147
    return-void
.end method

.method public setOnViewTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    .line 152
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_a

    .line 157
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 161
    :goto_9
    return-void

    .line 159
    :cond_a
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    goto :goto_9
.end method

.method public setZoomable(Z)V
    .registers 3
    .param p1, "zoomable"    # Z

    .prologue
    .line 165
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;->mAttacher:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    .line 166
    return-void
.end method
