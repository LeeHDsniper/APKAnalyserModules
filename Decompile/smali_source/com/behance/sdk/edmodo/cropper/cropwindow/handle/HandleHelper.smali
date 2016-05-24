.class abstract Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;
.super Ljava/lang/Object;
.source "HandleHelper.java"


# instance fields
.field private mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

.field private mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field private mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;


# direct methods
.method constructor <init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V
    .registers 6
    .param p1, "horizontalEdge"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .param p2, "verticalEdge"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 49
    iput-object p2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 50
    new-instance v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;-><init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V

    iput-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    .line 51
    return-void
.end method

.method private getAspectRatio(FF)F
    .registers 10
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 152
    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    if-ne v5, v6, :cond_21

    move v2, p1

    .line 153
    .local v2, "left":F
    :goto_7
    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    if-ne v5, v6, :cond_28

    move v4, p2

    .line 154
    .local v4, "top":F
    :goto_e
    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    if-ne v5, v6, :cond_2f

    move v3, p1

    .line 155
    .local v3, "right":F
    :goto_15
    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    if-ne v5, v6, :cond_36

    move v1, p2

    .line 157
    .local v1, "bottom":F
    :goto_1c
    invoke-static {v2, v4, v3, v1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateAspectRatio(FFFF)F

    move-result v0

    .line 159
    .local v0, "aspectRatio":F
    return v0

    .line 152
    .end local v0    # "aspectRatio":F
    .end local v1    # "bottom":F
    .end local v2    # "left":F
    .end local v3    # "right":F
    .end local v4    # "top":F
    :cond_21
    sget-object v5, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    goto :goto_7

    .line 153
    .restart local v2    # "left":F
    :cond_28
    sget-object v5, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    goto :goto_e

    .line 154
    .restart local v4    # "top":F
    :cond_2f
    sget-object v5, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    goto :goto_15

    .line 155
    .restart local v3    # "right":F
    :cond_36
    sget-object v5, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    goto :goto_1c
.end method


# virtual methods
.method getActiveEdges()Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    return-object v0
.end method

.method getActiveEdges(FFF)Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "targetAspectRatio"    # F

    .prologue
    .line 125
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->getAspectRatio(FF)F

    move-result v0

    .line 129
    .local v0, "potentialAspectRatio":F
    cmpl-float v1, v0, p3

    if-lez v1, :cond_17

    .line 130
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iput-object v2, v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 131
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iput-object v2, v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 136
    :goto_14
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    return-object v1

    .line 133
    :cond_17
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mHorizontalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iput-object v2, v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 134
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mActiveEdges:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->mVerticalEdge:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iput-object v2, v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    goto :goto_14
.end method

.method abstract updateCropWindow(FFFLandroid/graphics/Rect;F)V
.end method

.method updateCropWindow(FFLandroid/graphics/Rect;F)V
    .registers 14
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "imageRect"    # Landroid/graphics/Rect;
    .param p4, "snapRadius"    # F

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;->getActiveEdges()Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    move-result-object v7

    .line 71
    .local v7, "activeEdges":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;
    iget-object v0, v7, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 72
    .local v0, "primaryEdge":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    iget-object v8, v7, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 74
    .local v8, "secondaryEdge":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    if-eqz v0, :cond_13

    .line 75
    const/high16 v5, 0x3f800000

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(FFLandroid/graphics/Rect;FF)V

    .line 77
    :cond_13
    if-eqz v8, :cond_1f

    .line 78
    const/high16 v6, 0x3f800000

    move-object v1, v8

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v6}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(FFLandroid/graphics/Rect;FF)V

    .line 79
    :cond_1f
    return-void
.end method
