.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;
.super Lcom/etsy/android/grid/util/DynamicHeightImageView;
.source "AdobeDynamicHeightImageView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/util/DynamicHeightImageView;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/etsy/android/grid/util/DynamicHeightImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->onMeasure(II)V

    .line 24
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getSuggestedMinimumHeight()I

    move-result v3

    if-lt v2, v3, :cond_17

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getSuggestedMinimumWidth()I

    move-result v3

    if-ge v2, v3, :cond_32

    .line 26
    :cond_17
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getSuggestedMinimumHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 27
    .local v0, "height":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 29
    .local v1, "width":I
    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDynamicHeightImageView;->setMeasuredDimension(II)V

    .line 32
    .end local v0    # "height":I
    .end local v1    # "width":I
    :cond_32
    return-void
.end method
