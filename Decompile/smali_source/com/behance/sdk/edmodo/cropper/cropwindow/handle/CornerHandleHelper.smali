.class Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/CornerHandleHelper;
.super Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;
.source "CornerHandleHelper.java"


# direct methods
.method constructor <init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V
    .registers 3
    .param p1, "horizontalEdge"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .param p2, "verticalEdge"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;-><init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V

    .line 31
    return-void
.end method


# virtual methods
.method updateCropWindow(FFFLandroid/graphics/Rect;F)V
    .registers 14
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "targetAspectRatio"    # F
    .param p4, "imageRect"    # Landroid/graphics/Rect;
    .param p5, "snapRadius"    # F

    .prologue
    .line 42
    invoke-virtual {p0, p1, p2, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/CornerHandleHelper;->getActiveEdges(FFF)Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;

    move-result-object v6

    .line 43
    .local v6, "activeEdges":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;
    iget-object v0, v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->primary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 44
    .local v0, "primaryEdge":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    iget-object v7, v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/EdgePair;->secondary:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .local v7, "secondaryEdge":Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    move v1, p1

    move v2, p2

    move-object v3, p4

    move v4, p5

    move v5, p3

    .line 46
    invoke-virtual/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(FFLandroid/graphics/Rect;FF)V

    .line 47
    invoke-virtual {v7, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(F)V

    .line 49
    invoke-virtual {v7, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/Rect;F)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 50
    invoke-virtual {v7, p4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/Rect;)F

    .line 51
    invoke-virtual {v0, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustCoordinate(F)V

    .line 53
    :cond_1f
    return-void
.end method
